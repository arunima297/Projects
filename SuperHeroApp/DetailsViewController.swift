//
//  DetailsViewController.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import UIKit

class DetailsViewController: UIViewController {
    var power = ""
    var appearance = ""
    var work = ""
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var detailLabel: UILabel!
    var connections = ""
    var biography = ""
    var identifier = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        switch (identifier)  {
            case "b":
                detailLabel.text = biography
            case "p":
                detailLabel.text = power
            case "a":
                detailLabel.text = appearance
            case "w":
                detailLabel.text = work
            case "c":
                detailLabel.text = connections
            default:
            detailLabel.text = "Sorryy!!! \nTry Again"
        }
    }
}

