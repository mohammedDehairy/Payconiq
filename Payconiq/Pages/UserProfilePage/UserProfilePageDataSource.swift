//
//  UserProfilePageDataSource.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class UserProfilePageDataSource: PayconiqDataSource {
    override func hardReload(data: [ViewModel]) {
        _datasource = data
        reloadData()
    }
}
