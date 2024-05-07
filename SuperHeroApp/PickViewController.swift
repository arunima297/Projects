//
//  PickViewController.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import UIKit
class PickViewController: UIViewController  {
    var num = ""
    var uname = ""
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var choose: UILabel!
    @IBOutlet weak var pickimage: UIImageView!
    @IBOutlet weak var pickTitle: UILabel!
    
    @IBOutlet weak var hello: UILabel!
    @IBAction func goAhead(_ sender: UIButton) {
        if ((Int(number.text!)! >= 1) && (Int(number.text!)! <= 731)){
            num = number.text!
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please enter a number between 1 and 731", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let superVC  = segue.destination as! SuperHeroViewController
        superVC.number = num
    }
    
    @IBAction func logout(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hello.text = "Hello \(uname)!!"
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

