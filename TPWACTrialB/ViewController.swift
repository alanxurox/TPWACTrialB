//
//  ViewController.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/12/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit
import Firebase

var ref : DatabaseReference = Database.database().reference()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This works. The method to create a new activity with specific parameters
        //let activity = Activity()
        //activity.setMaxStudent(maxStudent: 13)
        /*ref.child("Activities").child(activity.getName()).setValue([
            "date": activity.getDateString(),
            "maxStudent": activity.getMaxStudent(),
            "leadFaculty": activity.getLeadFaculty(),
            "location": newActivity.getLocation(),
            "currentStudents": activity.getCurrentStudents(),
            "headStudent": activity.getHeadStudent(),
            "altFaculty": activity.getAltFaculty()])
         
        */
        
        
        //This works. Reading activity data from firebase.
        /*ref.child("Activities").observeSingleEvent(of: .value) { snapshot in
            print(snapshot.childrenCount) // I got the expected number of items
            for oneAct in snapshot.children.allObjects as! [DataSnapshot] {
                print(oneAct.value ?? 00)
                let activity = Activity()
                activity.setMaxStudent(maxStudent: oneAct.childSnapshot(forPath: "maxStudent").value as! Int)
                activity.setLeadFaculty(leadFaculty: oneAct.childSnapshot(forPath: "leadFaculty").value as! String)
                    ...
                print(activity.getMaxStudent())
         }
         }*/
                
        
        // Do any additional setup after loading the view.
       //creates a clear navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //customizes the back button
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
    }

    @IBAction func ContinuewithGoogle(_ sender: UIButton) {
    }
    
}
    

