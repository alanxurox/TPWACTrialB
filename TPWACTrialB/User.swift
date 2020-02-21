//
//  User.swift
//  TPWAC
//
//  Created by Jiayang (James) Wang on 1/30/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import Foundation

class User{
    
    var userID : String
    var idToken : String
    var fullName : String
    var givenName : String
    var familyName : String
    var email : String
    var status : String
    var isFaculty : Bool
    
    var facultyList : [String] = ["vmetcalf@trinitypawling.org",
                                  "jwang@trinitypawling.org","tyu@trinitypawling.org"]
    
    static var userList : [User] = []
    
    public func logout(){
        self.status = "Inactive"
    }
    
    init(){
        userID = "null"
        idToken = "null"
        fullName = "null"
        givenName = "null"
        familyName = "null"
        email = "null"
        status = "Inactive"
        isFaculty = false
    }
    
    init(userID: String, idToken: String, fullName: String, givenName: String, familyName: String, email: String, status: String, isFaculty: Bool){
        self.userID = userID
        self.idToken = idToken
        self.fullName = fullName
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.status = status
        self.isFaculty = isFaculty
    }
    
    public func checkFaculty(){
        for i in facultyList{
            if (self.getEmail() == i){
                self.isFaculty = true
            }
        }
    }
    
    public func setUserID(userID: String){
        self.userID = userID
    }
    
    public func getUserID() -> String{
        return userID
    }
    
    public func setIDToken(idToken: String){
        self.idToken = idToken
    }
    
    public func getIDToken() -> String{
        return idToken
    }
    
    public func setFullName(fullName: String){
        self.fullName = fullName
    }
    
    public func getFullName() -> String{
        return fullName
    }
    
    public func setGivenName(givenName: String){
        self.givenName = givenName
    }
    
    public func getGivenName() -> String{
        return givenName
    }
    
    public func setFamilyName(familyName: String){
        self.familyName = familyName
    }
    
    public func getFamilyName() -> String{
        return familyName
    }
    
    public func setEmail(email: String){
        self.email = email
    }
    
    public func getEmail() -> String{
        return email
    }
    
    public func setStatus(status: String){
        self.status = status
    }
    
    public func getStatus() -> String{
        return status
    }
    
    public func setFaculty(isFaculty: Bool){
        self.isFaculty = isFaculty
    }
    
    public func getFaculty() -> Bool{
        return isFaculty
    }
}
