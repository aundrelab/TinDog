//
//  Utilities.swift
//  TinDog
//
//  Created by Prince Rios on 11/3/21.
//

import Foundation

static func isPasswordValid( password : String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@",
    "^(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?@]{8,}")
    
    return passwordTest.evaluate(with: password)
}
