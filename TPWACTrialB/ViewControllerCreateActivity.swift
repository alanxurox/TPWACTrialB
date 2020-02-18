//
//  ViewControllerCreateActivity.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/14/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit

class ViewControllerCreateActivity: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var maxStudent: UITextField!
    @IBOutlet weak var headFaculty: UITextField!
    @IBOutlet weak var altFaculty: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    @IBAction func create(_ sender: UIButton) {
//        var newActivity : Activity = Activity()
//               newActivity.setName(name: name.text!)
//
//               newActivity.setLocation(location: place.text!)
//               newActivity.setMaxStudent(maxStudent: Int(maxStudent.text!)!)
//               newActivity.setLeadFaculty(leadFaculty: headFaculty.text!)
//               newActivity.setAltFaculty(altFaculty: altFaculty.text!)
//               newActivity.setDate(date: date.date)
//               Activity.activityList.append(newActivity)
//           }
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
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
