//
//  ViewController.swift
//  businessData
//
//  Created by synup on 18/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit



struct Business {
    let name:String?
    let city:String?
    let streetName: String?
    
    init(name:String? = nil,city:String? = nil, streetName:String? = nil) {
        self.name = name
        self.city = city
        self.streetName = streetName
    }
}

class ViewController: UIViewController {
    
    
    var businessLabel : UILabel!
    var streetNameLabel: UILabel!
    var streetName: UILabel!
    var businessImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        networkingClient.execute(url: urlToExecute) { (json,error) in
            let businessName = json!["result"]["name"].string
            let cityName = json!["result"]["city"].string
            let street = json!["result"]["street"].string
            //            print(businessName)
            let currentBusiness = Business(name: businessName,city: cityName,streetName: street)
            self.businessLabel.text = currentBusiness.name
            self.streetName.text = currentBusiness.streetName
            print("currentBusiness : \(currentBusiness)")
        }
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

