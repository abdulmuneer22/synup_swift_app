//
//  BusinessInformationController.swift
//  businessData
//
//  Created by synup on 25/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import ReSwift


class BusinessInformationController : UITableViewController , StoreSubscriber{
    
    
    var data: [String : Any]?
    typealias StoreSubscriberStateType = AppState
    
    func newState(state: AppState) {
        data = [:]
        
        data!["name"] = state.businessData.name
        data!["city"] = state.businessData.city
        data!["description"] = state.businessData.description
        data!["state_name"] = state.businessData.state_name
        data!["postal_code"] = state.businessData.postal_code
        data!["phone"] = state.businessData.phone
        data!["biz_url"] = state.businessData.biz_url
        data!["owner_name"] = state.businessData.owner_name
        data!["tagline"] = state.businessData.tagline
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStore.subscribe(self)
        self.loadData()
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom")! as! CustomCell
        let currentKey = Array(data!.keys)[indexPath.row]
        let currentValue = data?[currentKey]
        cell.headerValue = currentValue as? String
        cell.headerLabel = currentKey
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = data?.count {
        return count
        }
        
        return 0
    }
    
    
    func loadData() {
        guard let urlToExecute = URL(string: "http://uat1.uat-sandbox.stg.synup.com/api/v2/businesses/41.json?type=all&auth_token=wu4751AU38SL-bHyufAqCHaNvMM") else { return  }
        let networkingClient = NetworkingClient()
        networkingClient.getBusinessData(url: urlToExecute)
    }
}
