//
//  BusinessDetailsViewController.swift
//  businessData
//
//  Created by synup on 21/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import ReSwift
import SwiftyJSON





class BusinessDetailsViewController: UIViewController, StoreSubscriber {
    
    var screenTitle : UILabel!
    var taglineLabel : UILabel!
    var taglineValue : UILabel!
    var yocLabel : UILabel!
    var yocValue : UILabel!
    

    
    
    
    // values
    var _tagline: String = ""
    var _yoc: String = ""
    
    
    typealias StoreSubscriberStateType = AppState
    
    // subscribe to store changes here for this View Controller
    func newState(state: AppState) {
        
        if let business = state.businessData {
            
            _tagline = business.tagline!
            _yoc = business.yearOfIncorporation
            
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStore.subscribe(self)
        
        
        screenTitle = createLabel(name: "Business Details")
        taglineLabel = createLabel(name: "Tag Line")
        taglineValue = createLabel(name: _tagline)
        yocLabel = createLabel(name: "YOC")
        yocValue = createLabel(name: _yoc)
        view.addSubview(screenTitle)
        view.addSubview(taglineLabel)
        view.addSubview(taglineValue)
        view.addSubview(yocLabel)
        view.addSubview(yocValue)
        
        
        
        
        // business name
        NSLayoutConstraint.activate([
            screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            taglineLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            taglineLabel.topAnchor.constraint(equalTo: screenTitle.bottomAnchor,constant: 20),
            taglineLabel.widthAnchor.constraint(equalToConstant: taglineLabel.intrinsicContentSize.width),

            
            taglineValue.leadingAnchor.constraint(equalTo: taglineLabel.trailingAnchor,constant: 20),
            taglineValue.topAnchor.constraint(equalTo: screenTitle.bottomAnchor,constant: 20),
            
            
            yocLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            yocLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor,constant: 20),
            
            yocValue.leadingAnchor.constraint(equalTo: yocLabel.trailingAnchor,constant: 20),
            yocValue.topAnchor.constraint(equalTo: taglineValue.bottomAnchor,constant: 20),
            ])

        
    
        
    }
    
}

