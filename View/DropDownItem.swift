//
//  CustomCell.swift
//  businessData
//
//  Created by synup on 25/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import SnapKit

class DropDownItem : UITableViewCell{
    
    var headerLabel: String?
    
    
    var HeaderComponent: UIView = {
        var container = UIView()
        return container
    }()
    
    var Label: UILabel = {
        var label = UILabel()
        return label
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(HeaderComponent)
        HeaderComponent.addSubview(Label)
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        Label.text = String(headerLabel ?? "").upperCaseFirstLetter()
        
    }
    
    
    
    func setUpConstraints(){
        HeaderComponent.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(40)
            make.left.equalTo(self)
        }
        
        
        Label.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.center.equalTo(self.snp.center)
            make.left.equalTo(self).offset(20)
        }
        
        
    }
    
    
}












