//
//  FCollectionReference.swift
//  NewTinDog
//
//  Created by Ramiro Soto on 12/8/21.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String{
    case User
    
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
