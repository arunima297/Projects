//
//  FirebaseManager.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import CoreData

class FirebaseManager {
    static var Shared = FirebaseManager()
    let db = Firestore.firestore()
    
    func insertPhotoIntoStorage(id: String, name: String, image: String){
        
        let data = [
            "id": id,
            "name": name,
            "image": image
        ] as [String : Any]
        
        let photoData = db.collection("savedPhotos").document()
        photoData.setData(data) { error in
            print(error ?? "error")
        }
    }
    func getAllImagesFromStorage(complition: @escaping ([photoData])->Void){
        var result = [photoData]()
        db.collection("savedPhotos").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let firestoreMap = document.data()
                    if let id = firestoreMap["id"] as? String,
                       let name = firestoreMap["name"] as? String,
                       let image = firestoreMap["image"] as? String {
                        let photo = photoData(id: id, name: name, image: image)
                        result.append(photo)
                    }
                }
                complition(result)
            }
        }
    }

    
}
