//
//  UserProfileViewModel.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class UserProfileViewModel: ViewModel {
    let firstName: String
    let lastName: String
    let birthDate: String
    let nationality: String
    
    init(firstName: String, lastName: String, birthDate: String, nationality: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.nationality = nationality
    }
}
