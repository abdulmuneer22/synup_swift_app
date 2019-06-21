//
//  Utils.swift
//  businessData
//
//  Created by synup on 21/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import UIKit


func createLabel(name:String) -> UILabel {
    
    let label = UILabel()
    
    
    
    
    label.text = name
    label.font = .systemFont(ofSize: 18)
    label.textColor = .purple
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.font = .systemFont(ofSize: 18)
    label.textColor = .purple
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}
