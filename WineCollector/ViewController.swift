//
//  ViewController.swift
//  WineCollector
//
//  Created by sally white on 5/16/17.
//  Copyright © 2017 Matthew Hyrka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var wines : [Wine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            wines = try context.fetch(Wine.fetchRequest())
            print(wines)
            tableView.reloadData()
        } catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return wines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let wine = wines[indexPath.row]
        cell.textLabel?.text = wine.name
        cell.imageView?.image = UIImage(data: wine.image! as Data)
        return cell
    }

}

