//
//  ViewControllerEditRemove.swift
//  TPWACTrialB
//
//  Created by Ben Yoon on 2/14/20.
//  Copyright © 2020 Trinity Pawling. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
class ViewControllerEditRemove: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //remove value method
        /*
         
         ref.child("Activities").child(Activity.getName).removeValue { (error, ref) in
             if error != nil {
                 print("error \(error)")
             }
         }
         
         
         
         */
        
        //print("asdf" + name)
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
