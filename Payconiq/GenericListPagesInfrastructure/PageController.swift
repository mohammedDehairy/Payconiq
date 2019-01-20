//
//  PageController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

protocol PageController {
    var builder: PageBuilder { get }
    func startListening()
}
