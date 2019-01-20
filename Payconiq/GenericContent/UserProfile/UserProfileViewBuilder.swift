//
//  UserProfileViewBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class UserProfileViewBuilder: ViewBuilder {
    let layouter: ViewLayouter
    init(layouter: ViewLayouter) {
        self.layouter = layouter
    }
    override func view(data: ViewModel, index: Int) -> UIView {
        guard data is UserProfileViewModel else { return UIView() }
        let view = UserProfileView()
        return view
    }
    
    override func update(view: UIView, data: ViewModel, index: Int) {
        guard let model = data as? UserProfileViewModel else { return }
        guard let view = view as? UserProfileView else { return }
        let constraintWidth = UIScreen.main.bounds.width
        view.nameLabel.text = "\(model.firstName) \(model.lastName)"
        view.nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.birthDateLabel.text = model.birthDate
        view.birthDateLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        view.nationalityLabel.text = model.nationality
        view.nationalityLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        layouter.layout(view: view, data: model, index: index, constraintWidth: constraintWidth)
    }
}

