//
//  ProfileViewController.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    let tableContents = [
        "Completed Tasks",
        "Archived Tasks"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped!")
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile_cell", for: indexPath)
        
        cell.textLabel?.text = tableContents[indexPath.row]
        
        return cell
    }
}
