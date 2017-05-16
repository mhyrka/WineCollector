//
//  WineViewController.swift
//  WineCollector
//
//  Created by sally white on 5/16/17.
//  Copyright © 2017 Matthew Hyrka. All rights reserved.
//

import UIKit

class WineViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // Added UIImagePickerControllerDelegate and UINavigationControllerDelegate to satisfy imagePicker.delegate = self
    
    @IBOutlet weak var wineImageView: UIImageView!
    @IBOutlet weak var winemakerTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }

    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary //This line tells app to access photo library when tapped
        
        present(imagePicker, animated: true, completion: nil) // brings up another view controller
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        wineImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil) // necessary to return picked image to view ctrler
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let wine = Wine(context: context)
        wine.name = winemakerTextField.text
        wine.image = UIImagePNGRepresentation(wineImageView.image!) as NSData?
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true) 
    }
}
