//
//  EntryViewController.swift
//  Journal
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {

    var entry: Entry?
    
    //IBOutlet Variables
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // just to display the existing entry 
    func updateViews() {
        // unwrap a entry
        guard let entry = entry else {return}
        // set the outlets properties to your object properties
        titleTextField.text = entry.title
        detailsTextView.text = entry.bodyText
        
    }
    
    //save
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        
        guard let entry = entry else {return}
        guard let newTitle = titleTextField.text else {return}
        guard let newBody = detailsTextView.text else {return}
        
        EntryController.shared.update(entryToUpdate: entry, titleUpdate: newTitle, bodyUpdate: newBody)
        
    }
    

}
