//
//  Presenter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

protocol TransactionDetailsPresenter: class {
    func presen(model: TransactionViewModel, animated: Bool, completion: (()->Void))
}
