//
//  TinDogApp.swift
//  TinDog
//
//  Created by Ramiro Soto on 10/28/21.
//

import SwiftUI
import Firebase

@main
struct TinDogApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
