//
//  UserProfileViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class UserProfileViewLayouter: ViewLayouter {
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat) {
        guard let view = view as? UserProfileView else { return }
        view.nameLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.nameLabel.intrinsicContentSize.width) * 0.5, y: 20), size: view.nameLabel.intrinsicContentSize)
        view.birthDateLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.birthDateLabel.intrinsicContentSize.width) * 0.5, y: view.nameLabel.frame.maxY + 20), size: view.birthDateLabel.intrinsicContentSize)
        view.nationalityLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.nationalityLabel.intrinsicContentSize.width) * 0.5, y: view.birthDateLabel.frame.maxY + 20), size: view.nationalityLabel.intrinsicContentSize)
    }
    
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize {
        guard let _ = viewModel as? UserProfileViewModel else { return CGSize.zero }
        return CGSize(width: constraintWidth, height: 150)
    }
}
