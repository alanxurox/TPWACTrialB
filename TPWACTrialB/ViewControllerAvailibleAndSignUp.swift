//
//  ViewControllerAvailibleAndSignUp.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/14/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit
import Firebase
class ViewControllerAvailibleAndSignUp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //creates a clear navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //customizes the back button
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
        
        
        //Sign up method this works, change [1] to any number of activity that is selected
        
        /*
        let activity = Activity.activityList[1]
        ref.child("Activities").child(activity.getName()).child("currentStudents").child(String(activity.currentStudents.count)).setValue(currentUser.getEmail())
        */
        
        
        
    }
    
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        let screenWidth  = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        var currentHeight = 30
        
        for subview in self.scroll.subviews{
             subview.removeFromSuperview()
        }
        
        //method to read activities from database
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
                    
                    let activityLabel = UILabel.init()
                    activityLabel.frame = CGRect(x: 0, y: currentHeight, width: Int(screenWidth), height: 30)
                    activityLabel.text = "   " + activity.getName() + ", " + activity.getDateSimplified()
                    activityLabel.textAlignment = .left
                    activityLabel.font = UIFont(name: "Verdana", size: 20)
                    self.scroll.addSubview(activityLabel)
                    currentHeight += 30
                }
                Activity.activityList.append(activity)
            }
        }
        
        
        
        self.scroll.contentSize = CGSize(width: Int(screenWidth), height: currentHeight + 30)
    }
    
    //the method that will link to the button which sign students up for activities
    /*@IBAction func onRegister(){
        
        
        
        
        
        
        
    }*/
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
