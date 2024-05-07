//
//  SuperHeroViewController.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import UIKit
class SuperHeroViewController: UIViewController {
    var id = ""
    var powerstat = ""
    var appearanc = ""
    var workk = ""
    var bio = ""
    var connection = ""
    var number = ""
    var savedName = ""
    var savedUrl = ""
    var taps = 0
    
    var dbManager = (UIApplication.shared.delegate as! AppDelegate).DBManager
    var currentPhotoCollection: PhotoCollection?
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = "https://superheroapi.com/api/5792873957489711/\(number)"
        fetchObjects(urlString: name)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            heroImage.addGestureRecognizer(tapGesture)
            heroImage.isUserInteractionEnabled = true
    }
    @objc func imageTapped() {
       
        taps += 1
        print("Image tapped \(taps) times")
        let imageIndex = number
        let name = savedName
        
        dbManager?.insertPhotoIntoStorage(id: number, name: savedName, image: savedUrl)
        FirebaseManager.Shared.insertPhotoIntoStorage(id: number, name: savedName, image: savedUrl)
        CoreData.Shared.insertPhotoIntoStorage(id: number, name: savedName, image:savedUrl)
    }

    @IBAction func pickAnother(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    var details: String = ""
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    var heroName = ""
    func outputName(name: String) {
        nameTitle.text = name
        savedName = name
    }
    func outputImage(im: String){
        
        if let url = URL(string: im) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  self.heroImage.image = UIImage(data: imageData)
                  self.savedUrl = im
              }
            }.resume()
          }
    }
    func outputPowerstats(combat: String,durability: String, intelligence: String, power: String, speed: String,strength: String) {
        powerstat.append("Combat: \(combat) \nDurability: \(durability) \nIntelligence: \(intelligence) \nPower: \(power) \nSpeed: \(speed) \nStrength: \(strength)")
    }
    func outputAppearance(gender: String, race: String, height: Array<String>, weight: Array<String>, eye_color: String, hair_color: String){
        var h = ""
        var w = ""
        h.append("\(height[0]),\(height[1])")
        w.append("\(weight[0]),\(weight[1])")
        appearanc.append("Gender: \(gender) \nRace: \(race) \nHeight: \(h) \nWeight: \(w) \nEye Color: \(eye_color) \nHair Color: \(hair_color)")
    }
    func outputWork(occupation: String, base: String){
        workk.append("Occupation: \(occupation) \nBase: \(base)")
    }
    func outputConnections(group_affiliation: String, relatives: String){
        connection.append("Group Affiliation: \(group_affiliation) \nRelatives: \(relatives)")
    }
    func outputBiography(full_name: String, alter_egos: String, place_of_birth: String, first_appearance: String, publisher: String, alignment: String){
        
        bio.append("Full Name: \(full_name) \nAlter Egos: \(alter_egos) \nPlace of Birth: \(place_of_birth) \nFirst Appearance: \(first_appearance) \nPublisher: \(publisher) \nAlignment: \(alignment)")
    }
    func fetchObjects(urlString: String){
        
        guard let url = URL(string: urlString) else { fatalError("invalid") }
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data, err == nil else { return }
            do {
                let jsonData = try JSONDecoder().decode(hero.self, from: data)
                DispatchQueue.main.async {
                    self.outputName(name: jsonData.name)
                    self.outputImage(im: jsonData.image.url)
                    self.outputPowerstats(combat: jsonData.powerstats.combat, durability: jsonData.powerstats.durability, intelligence: jsonData.powerstats.intelligence, power: jsonData.powerstats.power, speed: jsonData.powerstats.speed, strength: jsonData.powerstats.strength)
                   self.outputAppearance(gender: jsonData.appearance.gender, race: jsonData.appearance.race, height: jsonData.appearance.height, weight: jsonData.appearance.weight, eye_color: jsonData.appearance.eye_color, hair_color: jsonData.appearance.hair_color)
                    self.outputWork(occupation: jsonData.work.occupation, base: jsonData.work.base)
                    self.outputBiography(full_name: jsonData.biography.full_name, alter_egos: jsonData.biography.alter_egos, place_of_birth: jsonData.biography.place_of_birth, first_appearance: jsonData.biography.first_appearance, publisher: jsonData.biography.publisher, alignment: jsonData.biography.alignment)
                    self.outputConnections(group_affiliation: jsonData.connections.group_affiliation, relatives: jsonData.connections.relatives)
                }
            } catch let jsonErr {
                print("failed to decode json:", jsonErr)
            }
        }.resume()
    }
    @IBAction func connect(_ sender: UIButton) {
        id = "c"
    }
    @IBAction func work(_ sender: UIButton) {
        id = "w"
    }
    @IBAction func biog(_ sender: UIButton) {
        id = "b"
    }
    @IBAction func power(_ sender: UIButton) {
        id = "p"
    }
    @IBAction func appear(_ sender: UIButton) {
        id = "a"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC  = segue.destination as! DetailsViewController
        detailsVC.appearance=appearanc
        detailsVC.power = powerstat
        detailsVC.biography = bio
        detailsVC.work = workk
        detailsVC.connections = connection
        detailsVC.identifier = id
    }
}
