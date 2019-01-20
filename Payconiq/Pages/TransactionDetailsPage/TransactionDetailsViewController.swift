//
//  TransactionDetailsViewController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit
import MapKit

class TransactionDetailsViewController: UIViewController {
    var model: TransactionViewModel?
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yy HH:mm"
        return dateFormatter
    }()
    private let scrollView: UIScrollView = UIScrollView(frame: CGRect.zero)
    private let dateLabel: UILabel = UILabel(frame: CGRect.zero)
    private let amountLabel: UILabel = UILabel(frame: CGRect.zero)
    private let mapView: MKMapView = MKMapView(frame: CGRect.zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(amountLabel)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(mapView)
        view.backgroundColor = UIColor.white
        
        if let model = model {
            applyModel(model: model)
            view.setNeedsLayout()
        }
        
        amountLabel.isAccessibilityElement = true
        amountLabel.accessibilityIdentifier = "details_page_amount_label"
    }
    
    private func applyModel(model: TransactionViewModel) {
        amountLabel.text = model.amount
        amountLabel.textColor = model.amount.hasPrefix("-") ? UIColor.defaultRed : UIColor.defaultGreen
        amountLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        dateLabel.text = dateFormatter.string(from: model.date)
        dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        mapView.setRegion(MKCoordinateRegion(center: model.coordinates.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = model.coordinates.coordinate
        pin.title = model.description
        mapView.addAnnotation(pin)
        
        self.title = model.description
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(origin: CGPoint(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top), size: CGSize(width: view.bounds.size.width - view.safeAreaInsets.left - view.safeAreaInsets.right, height: view.bounds.size.height - view.safeAreaInsets.bottom - view.safeAreaInsets.top))
        amountLabel.frame = CGRect(origin: CGPoint(x: (scrollView.frame.size.width - amountLabel.intrinsicContentSize.width) * 0.5, y: 30), size: amountLabel.intrinsicContentSize)
        dateLabel.frame = CGRect(origin: CGPoint(x: (scrollView.frame.size.width - dateLabel.intrinsicContentSize.width) * 0.5, y: amountLabel.frame.maxY + 30), size: dateLabel.intrinsicContentSize)
        let aspectRatio: CGFloat = 16/9
        let width = view.bounds.size.width * 0.9
        mapView.frame = CGRect(origin: CGPoint(x: (scrollView.frame.size.width - width) * 0.5, y: dateLabel.frame.maxY + 30), size: CGSize(width: width, height: width / aspectRatio))
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: mapView.frame.maxY + 30)
    }

}
