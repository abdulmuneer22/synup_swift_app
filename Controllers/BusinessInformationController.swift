//
//  BusinessInformationController.swift
//  businessData
//
//  Created by synup on 25/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import ReSwift
import  SwiftyJSON


class BusinessInformationController : UITableViewController{
    
    
    var data: [String : JSON]?
    typealias StoreSubscriberStateType = AppState
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GraphQueries.getBusinessData { (response : [String : JSON]) in
            self.data = response
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom")! as! CustomCell
        let currentKey = Array(data!.keys)[indexPath.row]
        
        
        cell.headerLabel = currentKey
        
        
        if let currentValue = data?[currentKey]?.stringValue {
            cell.headerValue = currentValue
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = data?.count {
            return count
        }
        
        return 0
    }
    
    
    
    
    
}
