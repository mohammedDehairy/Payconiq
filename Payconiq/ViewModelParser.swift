//
//  ViewModelParser.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import Foundation

protocol ViewModelParser {
    func parse(data: Data) -> [ViewModel]
}
