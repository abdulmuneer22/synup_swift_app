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
//        container.backgroundColor = .red
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
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(HeaderComponent)
        HeaderComponent.addSubview(Label)
        HeaderComponent.addSubview(ValueText)
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
            make.width.equalTo(self)
            make.height.equalTo(40)
            make.left.equalTo(self)
        }
        
        
        Label.snp.makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.4)
            make.center.equalTo(self)
            make.left.equalTo(self).offset(20)
        }

        ValueText.snp.makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.4)
            make.height.equalTo(40)
            make.center.equalTo(self)
            make.left.equalTo(self.Label.snp.right)
            make.leftMargin.equalTo(10)
        }
    }
    
    
}



extension String {
    func upperCaseFirstLetter() -> String{
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}









