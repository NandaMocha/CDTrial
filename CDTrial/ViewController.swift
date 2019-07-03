//
//  ViewController.swift
//  CDTrial
//
//  Created by Nanda Mochammad on 02/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemArray = Array<ContactData>()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        
        
        loadItems()
        
    }
    
    func reloadData(name: String, phoneNumber: String) {
        
        let contactData = ContactData(context: self.context)
        contactData.nama = name
        contactData.nomorHP = phoneNumber
        
        itemArray.append(contactData)
        saveItems()
        
        tableView.reloadData()
    }

    @IBAction func addAction(_ sender: Any) {
        performSegue(withIdentifier: "goToAdd", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addViewController = segue.destination as! AddViewController
        addViewController.myDelegate = self
    }

    
    func saveItems(){
        do {
            try context.save()
        } catch  {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems(){
        let request : NSFetchRequest<ContactData> = ContactData.fetchRequest()
        
        do {
            itemArray = try context.fetch(request)
        } catch  {
            print("Error fetching data from context \(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        
        cell.nama.text = itemArray[indexPath.row].nama
        cell.nomorHP.text = itemArray[indexPath.row].nomorHP
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let nomorHP = itemArray[indexPath.row].nomorHP{
            print("Nomor HP ", nomorHP)
            
            if let url = URL(string: "tel://\("08222")"), UIApplication.shared.canOpenURL(url as URL) {
                
                print("URL nya ",url)
                
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }

        }
        
        
        
    }
    
}

