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

