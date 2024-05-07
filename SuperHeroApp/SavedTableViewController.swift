//
//  SavedTableViewController.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import UIKit

class SavedTableViewController: UITableViewController {

    var allPhotos = [photoData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseManager.Shared.getAllImagesFromStorage { array in
            self.allPhotos = array
            print(self.allPhotos)
            self.tableView.reloadData()
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        FirebaseManager.Shared.getAllImagesFromStorage { array in
            self.allPhotos = array
            print(self.allPhotos)
            self.tableView.reloadData()
            
        }
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPhotos.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(allPhotos[indexPath.row].name) : \(allPhotos[indexPath.row].id)"
        

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toImage"){
        let ivc = segue.destination as! ImageViewController
            ivc.url = allPhotos[tableView.indexPathForSelectedRow!.row].image
        }
    }
}
