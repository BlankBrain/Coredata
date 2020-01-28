//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Md. Mehedi Hasan on 23/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController {

    @IBOutlet weak var personNameInput: UITextField!
    @IBOutlet weak var personAgeInput: UITextField!
    @IBOutlet weak var personNameOutputt: UILabel!
    @IBOutlet weak var personAgeOutput: UILabel!
    @IBOutlet weak var updatePersonName: UITextField!
    @IBOutlet weak var updatePersonAge: UITextField!
    @IBOutlet weak var updateMessage: UILabel!
    @IBOutlet weak var deletePersonName: UITextField!
    @IBOutlet weak var deleteMessage: UILabel!
    
    var people = [Person]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showAllPerson()
        
    }

    @IBAction func addPersonClicked(_ sender: Any) {
        let person1 = Person(context: PersistanceServic.context)
        person1.name = personNameInput.text
        person1.age = Int16(personAgeInput.text!)!
        PersistanceServic.saveContext()
        self.people.append(person1)
        self.personAgeOutput.text = String(people.count)
        showAllPerson()
        
    }
    
    @IBAction func updatePersonClicked(_ sender: Any) {
        
        
    }
    
    @IBAction func deletePersonClicked(_ sender: Any) {
        
        let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name like %@", self.deletePersonName.text!)
        do{
            let people = try PersistanceServic.context.fetch(fetchRequest)
            self.people = people
            for person in people {
                print(person.name)
                PersistanceServic.context.delete(person)
                 PersistanceServic.saveContext()
            }
           
               showAllPerson()
            
//            let personToDelete = people.first(where:{$0.name == self.deletePersonName.text!})
//            self.deleteMessage.text = personToDelete!.name
//            self.personNameInput.text = ""
//            self.personAgeOutput.text = ""
//            self.deletePersonName.text = ""
//            PersistanceServic.context.delete(personToDelete!)
//            PersistanceServic.saveContext()
//            showAllPerson()
            
            //let resultPredicate = NSPredicate(format: "name = %@", self.deletePersonName.text!)
      
            
            
            
        }catch{
            print("error loading users !")
        }
        
    }
    
    
    func showAllPerson()  {
        let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
        do{
          let people = try PersistanceServic.context.fetch(fetchRequest)
            self.people = people
            print("==========")
            print(people.count)
            for item in people{
                print(item.name)
            }

        }catch{
            print("error loading previous data !")
        }
    }
    
}

