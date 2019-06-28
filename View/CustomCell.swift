//
//  CustomCell.swift
//  businessData
//
//  Created by synup on 25/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import SnapKit

class CustomCell : UITableViewCell{
    
    var headerLabel: String?
    var headerValue: String?
    
    
    var HeaderComponent: UIView = {
        var container = UIView()
//        container.backgroundColor = .yellow
        return container
    }()
    
    var Label: UILabel = {
        var label = UILabel()
//        label.backgroundColor = .green
        return label
    }()
    
    
    
    var ValueText: UILabel = {
        var label = UILabel()
//        label.backgroundColor = .purple
        return label
        
    }()
    
    
    var leftContainer : UIView = {
        var container = UIView()
//        container.backgroundColor = .red
        return container
    }()
    
    var rightContainer : UIView = {
        var container = UIView()
//        container.backgroundColor = .purple
        return container
    }()
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(HeaderComponent)
        HeaderComponent.addSubview(leftContainer)
        HeaderComponent.addSubview(rightContainer)
        leftContainer.addSubview(Label)
        rightContainer.addSubview(ValueText)
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        Label.text = String(headerLabel ?? "").upperCaseFirstLetter()
        ValueText.text =  String(headerValue ?? "").upperCaseFirstLetter()
        
    }
    
    
    
    func setUpConstraints(){
        HeaderComponent.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(40)
            make.left.equalTo(self)
        }
        
        
        
        leftContainer.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(self.snp.width).multipliedBy(0.5)
            make.left.equalTo(5)
        }
        
        rightContainer.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.5)
            make.height.equalTo(40)
            make.left.equalTo(self.leftContainer.snp.rightMargin)
        }
        
        
        Label.snp.makeConstraints { (make) in
            make.left.equalTo(leftContainer.snp.left)
            make.right.equalTo(leftContainer.snp.right)
            make.height.equalTo(40)
        }
        
        
        
        ValueText.snp.makeConstraints { (make) in
            make.left.equalTo(rightContainer.snp.left)
            make.right.equalTo(rightContainer.snp.right)
            make.height.equalTo(40)
        }
    }
    
    
}



extension String {
    func upperCaseFirstLetter() -> String{
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}









