//
//  DatabaseManagement.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/21/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import Foundation
import SQLite

class DatabaseManagement{
    
    var database: Connection!
    
    let userTable = Table("users")
    //dlet id = Expression<Int>("id")
    let userName = Expression<String>("name")
    let userEmail = Expression<String>("email")
    let userPassword = Expression<String>("password")
    let userMobileNumber = Expression<String>("mobile")
    
    func setupDatabase(){
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch{
            print(error)
        }
    }
    
    func createTable(){
        print("create Table")
        
        let createTable = self.userTable.create { (table) in
            //table.column(self.id, primaryKey: true)
            table.column(self.userEmail, unique: true)
            table.column(self.userPassword)
        }
        
        do{
            try self.database.run(createTable)
            print("Created Table")
        } catch {
            print(error)
        }
    }
    
    func insertUser(userEmail: String, userPassword: String){

        //print("email: \(userEmail), password: \(userPassword)")
  
        let insertUser = self.userTable.insert(self.userEmail <- userEmail, self.userPassword <- userPassword)
        
        do{
            try self.database.run(insertUser)
            print("User added to database")
        } catch{
            print(error)
        }
    }
    
    func removeTable(){
        print ("remove table")
        let removeTable = self.userTable.drop(ifExists: true)
        
        do{
            try self.database.run(removeTable)
        }catch{
            print(error)
        }
    }
    
    func listUsers() {
        do{
            let users = try self.database.prepare(self.userTable)
            for user in users {
                print("userEmail: \(user[self.userEmail]), userPassword: \(user[self.userPassword])")
            }
        }catch{
            print(error)
        }
    }
}

