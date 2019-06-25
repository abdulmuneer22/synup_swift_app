//
//  CustomCell.swift
//  businessData
//
//  Created by synup on 25/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit

class CustomCell : UITableViewCell{
    
    var message : String?
    
    
    var messageView: UILabel = {
        var textView = UILabel()
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .red
        self.addSubview(messageView)
        
        
        messageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            ])
        
        //        messageView.translatesAutoresizingMaskIntoConstraints = false
        //        messageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        //        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let message = message {
            messageView.text = message
        }
    }
}
