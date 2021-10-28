//
//  ViewController.swift
//  TinDog
//
//  Created by Prince Rios on 10/27/21.
//  Copyright © 2021 Prince Rios. All rights reserved.
//

import FirebaseDatabase
import UIKit

class ViewController: UIViewController {
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIBUtton(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
        button.setTitle("A", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
    }
    
    @objc private func addNewEntry() {
        database.child("something").setValue(value: Any?)
    }


}
