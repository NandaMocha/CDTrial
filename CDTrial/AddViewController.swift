//
//  AddViewController.swift
//  CDTrial
//
//  Created by Nanda Mochammad on 02/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate {
    func reloadData(name:String, phoneNumber:String)
}

class AddViewController: UIViewController {
    
    var myDelegate:AddViewControllerDelegate?
    
    @IBOutlet weak var nama: UITextField!
    @IBOutlet weak var nomorHP: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func addButton(_ sender: Any) {
        dismissModal()
    }
    
    func dismissModal(){
        self.dismiss(animated: true) {
            self.myDelegate?.reloadData(name: self.nama.text!, phoneNumber: self.nomorHP.text!)
        }
    }
    

}
