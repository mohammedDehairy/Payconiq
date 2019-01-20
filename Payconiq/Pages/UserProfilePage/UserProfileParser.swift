//
//  UserProfileParser.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import Foundation

struct UserProfileParser: ViewModelParser {
    private let dateFormatter: DateFormatter
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    func parse(data: Data) -> [ViewModel] {
        let jsonData = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
        guard let json = jsonData as? Dictionary<String, Any> else { return [] }
        guard let firstName = json["name"] as? String else { return [] }
        guard let lastName = json["surname"] as? String else { return [] }
        guard let birthDate = json["Birthdate"] as? String else { return [] }
        guard let nationality = json["Nationality"] as? String else { return [] }
        let user = UserProfileViewModel(firstName: firstName, lastName: lastName, birthDate: birthDate, nationality: nationality)
        return [user]
    }
}
