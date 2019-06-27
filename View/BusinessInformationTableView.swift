//
//  BusinessInformationTableView.swift
//  businessData
//
//  Created by synup on 26/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import SwiftyJSON

class BusinessInformationTableView: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {

    private let myArray: NSArray = []
    private var myTableView: UITableView!
    private var mySearchBar: UIView!
    private var searchBar : UISearchBar!
    private var data: [String : JSON] = [:]


    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.hidesWhenStopped = true
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let displayHeight: CGFloat = self.view.frame.height

        searchBar = UISearchBar()
        searchBar.placeholder = "Please Search Here"
        searchBar.delegate = self

        myTableView = UITableView()

        // registering custom ui table cell with an identifier "custom"

        myTableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        myTableView.dataSource = self
        myTableView.delegate = self

        self.view.addSubview(searchBar)
        self.view.addSubview(myTableView)
        self.view.addSubview(activityIndicator)

//        activityIndicator.startAnimating()





        // position search bar
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(89)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(40)

        }


        // position table view below search bar
        myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchBar.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(displayHeight)
        }


        // position activity indicator
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
        }



    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle cell selection here
        // print("Num: \(indexPath.row)")
        // print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns number of rows required here
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // pass data to each cell item here , we are using Custom Cell Created by us than default UITableCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        let currentKey = Array(data.keys)[indexPath.row]
        cell.headerLabel = currentKey
        if let currentValue = data[currentKey]?.stringValue {
            cell.headerValue = currentValue
        }
        return cell
    }



    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // on change on search bar , we need to check the length of input string ,
        // if its > 3 , search need to be initiated ,
        // during search , activity indicator need to be placed
        if (searchText.count > 3){
            self.activityIndicator.startAnimating()
            GraphQueries.getBusinessData(queryString: searchText) { (response) in
                // print response here
                self.data = response
                self.myTableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }else{
            return
        }

    }


}



