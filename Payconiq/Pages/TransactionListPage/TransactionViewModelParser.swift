//
//  TransactionViewModelParser.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import Foundation
import CoreLocation

struct TransactionViewModelParser: ViewModelParser {
    private let dateFormatter: DateFormatter
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    func parse(data: Data) -> [ViewModel] {
        let jsonData = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
        guard let json = jsonData as? Array<Dictionary<String, Any>> else { return [] }
        var result = [TransactionViewModel]()
        for (index, transaction) in json.enumerated() {
            guard let coordinates = transaction["coordinates"] as? String else { continue }
            guard let latitudeStr = coordinates.split(separator: ",").first?.trimmingCharacters(in: .whitespaces) else { continue }
            guard let longitudeStr = coordinates.split(separator: ",").last?.trimmingCharacters(in: .whitespaces) else { continue }
            guard let latitude = Double(latitudeStr) else { continue }
            guard let longitude = Double(longitudeStr) else { continue }
            guard let dateStr = transaction["date"] as? String else { continue }
            guard let date = dateFormatter.date(from: dateStr) else { continue }
            guard let effectiveDateStr = transaction["effective date"] as? String else { continue }
            guard let effectiveDate = dateFormatter.date(from: effectiveDateStr) else { continue }
            guard let description = transaction["description"] as? String else { continue }
            guard let amount = transaction["amount"] as? String else { continue }
            
            let model = TransactionViewModel(coordinates: CLLocation(latitude: latitude, longitude: longitude), date: date, effectiveDate: effectiveDate, description: description, amount: amount)
            result.append(model)
        }
        return result
    }
}
