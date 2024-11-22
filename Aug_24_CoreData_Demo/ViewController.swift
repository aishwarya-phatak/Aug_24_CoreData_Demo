//
//  ViewController.swift
//  Aug_24_CoreData_Demo
//
//  Created by Vishal Jagtap on 22/11/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        insertRecords()
        retriveRecords()
//        deleteRecords()
//        retriveRecords()
    }

    func insertRecords(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //insertion of single object into the user entity
        let studentEntity = NSEntityDescription.entity(forEntityName: "Student",
                                                    in: managedContext)
        
        let studentObject = NSManagedObject(entity: studentEntity!, insertInto: managedContext)
                        
        studentObject.setValue("Pallavi", forKey: "name")
        studentObject.setValue("pallavi@gmail.com", forKey: "email")
        
        for i in 1...4{
            let studentObject = NSManagedObject(entity: studentEntity!, insertInto: managedContext)
            studentObject.setValue("Student\(i)", forKey: "name")
            studentEntity?.setValue("Student\(i)@gmail.com", forKey: "email")
        }
        
        do{
            try managedContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func retriveRecords(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        do{
           let fetchedResults = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for eachObject in fetchedResults{
                print(eachObject.objectID)
                print("username -- \(eachObject.value(forKey: "username") as! String) -- email -- \(eachObject.value(forKey: "email")  as! String)")
            }
        }catch{
            print(error.localizedDescription)
        }
        
        do{
            try managedContext.save()}
        catch{
            print(error)
        }
    }
    
    func deleteRecords(){
        
        
        
        
        
    }
}
