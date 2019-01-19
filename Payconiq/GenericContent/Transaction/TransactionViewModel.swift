//
//  TransactionViewModel.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit
import CoreLocation

final class TransactionViewModel: ViewModel {
    let coordinates: CLLocation
    let date: Date
    let effectiveDate: Date
    let description: String
    let amount: String
    
    init(coordinates: CLLocation, date: Date, effectiveDate: Date, description: String, amount: String) {
        self.coordinates = coordinates
        self.date = date
        self.effectiveDate = effectiveDate
        self.description = description
        self.amount = amount
        super.init()
    }
}
