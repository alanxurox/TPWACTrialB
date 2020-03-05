//
//  ViewControllerCreateActivity.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/14/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit

class ViewControllerCreateActivity: UIViewController{

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var maxStudent: UITextField!
    @IBOutlet weak var headFaculty: UITextField!
    @IBOutlet weak var altFaculty: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var dueSwitch: UISwitch!
    @IBOutlet weak var dueDate: UIDatePicker!
    
    @IBOutlet var textFields: [UITextField]!
    
    
    @IBAction func create(_ sender: UIButton) {
        let newActivity : Activity = Activity()
        for textField in textFields{
                //modify()
                //if !(isNotEmpty(temp: name) && isNotEmpty(temp: place) && isNotEmpty(temp: maxStudent) && isNotEmpty(temp: headFaculty) && isNotEmpty(temp: altFaculty)){
                
                //A perhaps simpler solution
            if (textField.text! == "" || textField.text!.contains(".") || textField.text!.contains("#") || textField.text!.contains("$") || textField.text!.contains("[") || textField.text!.contains("]")){
                    
                let sendMailErrorAlert = UIAlertController(title: "Error", message: "Input cannot be empty and cannot contain \".\" \"#\" \"$\" \"[\" or \"]\"", preferredStyle: .alert)
                let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
                sendMailErrorAlert.addAction(dismiss)
                self.present(sendMailErrorAlert, animated: true, completion: nil)
                    
                return
            }
        }
        if (Int(maxStudent.text!) == nil){
            let sendMailErrorAlert = UIAlertController(title: "Error", message: "Max Student must be an Integer", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
            sendMailErrorAlert.addAction(dismiss)
            self.present(sendMailErrorAlert, animated: true, completion: nil)
            
            return
            
        }
        newActivity.setName(name: name.text!)


        newActivity.setLocation(location: place.text!)
            
        newActivity.setMaxStudent(maxStudent: Int(maxStudent.text!)!)
         
        newActivity.setLeadFaculty(leadFaculty: headFaculty.text!)
        newActivity.setAltFaculty(altFaculty: altFaculty.text!)
        newActivity.setDate(date: date.date)
        newActivity.setDue(date: dueDate.date)
        newActivity.setDescription(description: "description")
                //yt:newActivity.setDue(date: dueDate.date) Waiting for TW's firebase
        
        Activity.activityList.append(newActivity)
            
        ref.child("Activities").child(newActivity.getName()).setValue([
            "date": newActivity.getDateString(),
            "maxStudent": newActivity.getMaxStudent(),
            "leadFaculty": newActivity.getLeadFaculty(),
            "location": newActivity.getLocation(),
            "currentStudents": [" "],  //newActivity.getCurrentStudents(),
            "headStudent": newActivity.getHeadStudent(),
            "altFaculty": newActivity.getAltFaculty(),
            "name": newActivity.getName(),
            "due": newActivity.getDueString(),
            "description": newActivity.getDescription()])
        
            //yt: "due": newActivity.getDue() (Should be .getDateString()?) waiting for TW's firebase
            
        for textField in textFields{
                
            let sendMailErrorAlert = UIAlertController(title: "Success", message: "Activity Successfully Commited", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
                sendMailErrorAlert.addAction(dismiss)
            self.present(sendMailErrorAlert, animated: true, completion: nil)
                
            textField.text = ""
            
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func isNotEmpty(temp :UITextField) -> Bool{
        let text = temp.text
        return !text!.isEmpty
    }
    
    func specialSymbol(temp :UITextField) -> String{
        var text = temp.text
        text = text?.replacingOccurrences(of: ".", with: "")
        text = text?.replacingOccurrences(of: "#", with: "#")
        text = text?.replacingOccurrences(of: "$", with: "")
        text = text?.replacingOccurrences(of: "[", with: "")
        text = text?.replacingOccurrences(of: "]", with: "")
        return text!
    }
    func modify(){
        name.text = specialSymbol(temp: name)
        place.text = specialSymbol(temp: place)
        headFaculty.text = specialSymbol(temp: headFaculty)
        altFaculty.text = specialSymbol(temp: altFaculty)
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
    
    override func viewDidAppear(_ animated: Bool) {
        //headFaculty.text = currentUser.getEmail()
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
