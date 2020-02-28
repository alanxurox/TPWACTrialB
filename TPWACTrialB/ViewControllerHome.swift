//
//  ViewControllerHome.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/14/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class ViewControllerHome: UIViewController {
    //selection UICollection that holds all of the buttons in the menu
    @IBOutlet var Selection: [UIButton]!
    @IBOutlet weak var ImageViewCalendar: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        self.activities.text = ""
        
        ref.child("Activities").observeSingleEvent(of: .value) { snapshot in
            print(snapshot.childrenCount) // I got the expected number of items
            Activity.activityList = []
            for oneAct in snapshot.children.allObjects as! [DataSnapshot] {
                print(oneAct.value ?? 00)
                let activity = Activity()
                if (oneAct.value != nil){
                    activity.setMaxStudent(maxStudent: oneAct.childSnapshot(forPath: "maxStudent").value as! Int)
                    activity.setLeadFaculty(leadFaculty: oneAct.childSnapshot(forPath: "leadFaculty").value as! String)
                    activity.setName(name: oneAct.childSnapshot(forPath: "name").value as! String)
                    activity.setLocation(location: oneAct.childSnapshot(forPath: "location").value as! String)
                    activity.setAltFaculty(altFaculty: oneAct.childSnapshot(forPath: "altFaculty").value as! String)
                    activity.setHeadStudent(headStudent: oneAct.childSnapshot(forPath: "headStudent").value as! String)
                    activity.setCurrentStudents(currentStudents: oneAct.childSnapshot(forPath: "currentStudents").value as! [String])
                    activity.setDate(dateString: oneAct.childSnapshot(forPath: "date").value as! String)
                    
                    if activity.getCurrentStudents().contains(currentUser.getEmail()){
                        //let activityLabel = UILabel.init()
                        //activityLabel.frame = CGRect(x: 10, y: UIScreen)
                        self.activities.text = self.activities.text! + activity.getName() + ", " + activity.getDateSimplified() + "\n"
                    }
                }
                Activity.activityList.append(activity)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //creates a clear navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //customizes the back button
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
    }
    
    @IBOutlet weak var activities: UILabel!
    
    //on click menu function to activate the drop down menu
    @IBAction func onClickMenu(_ sender: UIButton) {
        Selection.forEach{ (button) in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
        UIView.animate(withDuration: 0.3) {
            self.ImageViewCalendar.isHidden = !self.ImageViewCalendar.isHidden
        }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance()?.disconnect()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
