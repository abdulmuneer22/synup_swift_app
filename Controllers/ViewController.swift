//
//  ViewController.swift
//  businessData
//
//  Created by synup on 18/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import ReSwift
import SwiftyJSON




class ViewController: UIViewController, StoreSubscriber {
    
    var businessLabel : UILabel!
    var streetNameLabel: UILabel!
    var streetName: UILabel!
    var businessImage: UIImage!
    
    typealias StoreSubscriberStateType = AppState
    
    
    
    // subscribe to store changes here for this View Controller
    func newState(state: AppState) {
        
//        for businessHour in state.businessData.business_hours! {
//            print(businessHour.day!)
//        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // subscribe to the changes
        
        mainStore.subscribe(self)
        
        
        // layout items
        setUpLabel()
        setUpStreetName()
        
        // layout auto constraints
        setUpLayout()
        
        // data loading
        loadData()
        
        
    }
    
    
    func loadData() {
        guard let urlToExecute = URL(string: "http://uat1.uat-sandbox.stg.synup.com/api/v2/businesses/41.json?type=all&auth_token=wu4751AU38SL-bHyufAqCHaNvMM") else { return  }
        let networkingClient = NetworkingClient()
        networkingClient.getBusinessData(url: urlToExecute)        
    }
    
    
    
    func setUpLayout() {
        
        // business name
        NSLayoutConstraint.activate([
            businessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            businessLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            ])
        
        
        // streetname
        NSLayoutConstraint.activate([
            
            //label
            streetNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            streetNameLabel.topAnchor.constraint(equalTo: businessLabel.bottomAnchor, constant: 20),
            streetNameLabel.widthAnchor.constraint(equalToConstant: streetNameLabel.intrinsicContentSize.width),
            
            //value
            streetName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            streetName.leadingAnchor.constraint(equalTo: streetNameLabel.trailingAnchor,constant: 15),
            streetName.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -1),
            streetName.topAnchor.constraint(equalTo: businessLabel.bottomAnchor, constant: 20),
            //
            
            ])
        
        
        
    }
    
    
    func setUpLabel(){
        businessLabel = UILabel()
        businessLabel.font = .systemFont(ofSize: 24)
        businessLabel.textColor = .red
        businessLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(businessLabel)
    }
    
    
    func setUpStreetName(){
        streetNameLabel = UILabel()
        streetName = UILabel()
        
        
        streetNameLabel.text = "Street"
        streetNameLabel.font = .systemFont(ofSize: 18)
        streetNameLabel.textColor = .purple
        streetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        streetName.font = .systemFont(ofSize: 18)
        streetName.textColor = .purple
        streetName.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(streetName)
        view.addSubview(streetNameLabel)
    }
    
    
    
    
    
    
    
    
}

