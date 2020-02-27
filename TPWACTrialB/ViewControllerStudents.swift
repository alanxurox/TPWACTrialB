//
//  ViewControllerStudents.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/14/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit

class ViewControllerStudents: UIViewController {

    var index : Int = 0
    var activities : [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //creates a clear navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //customizes the back button
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
        
        activities = Activity.facultyActivity(userName: currentUser.fullName)
        students.text = ""
        if (activities.isEmpty){
            titleText.text = ""
            date.text = ""
            dueDate.text = ""
            students.text = "No activity"
        }else{
            titleText.text = activities[index].getName()
            date.text = "Date: " + activities[index].getDateSimplified()
            dueDate.text = "Due date: " + activities[index].getDueSimplified()
            for student in activities[index].getCurrentStudents(){
                self.students.text = self.students.text! + student + "\n"
            }
        }
    }
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var students: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    
    @IBAction func nextActivity(_ sender: UIButton) {
        students.text = ""
        if (!activities.isEmpty){
            index = (index + 1) % activities.count
            titleText.text = activities[index].getName()
            date.text = "Date: " + activities[index].getDateSimplified()
            dueDate.text = "Due date: " + activities[index].getDueSimplified()
            for student in activities[index].getCurrentStudents(){
                self.students.text = self.students.text! + student + "\n"
            }
        }
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
