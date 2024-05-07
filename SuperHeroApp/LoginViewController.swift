//
//  LoginViewController.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import UIKit

import UIKit

class LoginViewController: UIViewController  {
    var input = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func enter(_ sender: UIButton) {
        input = "e"
    }
    @IBAction func savedPhotosList(_ sender: UIButton) {
        input = "s"
    }
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var username: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if input == "e"{
            if username.text == ""{
                let alert = UIAlertController(title: "Error", message: "Please enter your name.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                present(alert, animated: true)
                input = ""
            }
            else{
                let pickVC = segue.destination as! PickViewController
                pickVC.uname = username.text!
                input = ""
            }
        }
        else if input == "s" {
            let savedVC = segue.destination as! SavedTableViewController
            input = ""
        }
        else {
            input = ""
        }
    }
}

