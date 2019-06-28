import UIKit
import SnapKit
import SwiftyJSON
import SwiftIconFont



public enum Fonts: String {
    case fontAwesome = "FontAwesome"
    case iconic = "open-iconic"
    case ionicon = "Ionicons"
    case octicon = "octicons"
    case themify = "themify"
    case mapIcon = "map-icons"
    case materialIcon = "MaterialIcons-Regular"
    case segoeMDL2 = "Segoe mdl2 assets"
}



class HomeViewController: UIViewController, UITabBarDelegate,UITableViewDelegate,UITableViewDataSource , UISearchBarDelegate {
    
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var data : [String : JSON] = [:]
    
    
    fileprivate var header:UIView = {
        let header = UIView()
        //        header.backgroundColor = .red
        return header
    }()
    
    
    fileprivate var searchBar:UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search Here"
        return sb
    }()
    
    fileprivate var footer:UIView = {
        let footer = UIView()
        footer.backgroundColor = .green
        return footer
    }()
    
    
    fileprivate var body: UIView = {
        var body = UIView()
        body.backgroundColor = .purple
        return body
    }()
    
    
    fileprivate var tabBar: UITabBar = {
        var tb = UITabBar()
        var tb1 = UITabBarItem()
        tb1.title = "Information"
        tb1.icon(from: .fontAwesome, code: "info", iconColor: .gray, imageSize: CGSize(width: 20, height: 20), ofSize: 20)
        tb1.tag = 0
        
        var tb2 = UITabBarItem()
        tb2.title = "Details"
        tb2.tag = 1
        tb2.icon(from: .fontAwesome, code: "info", iconColor: .gray, imageSize: CGSize(width: 20, height: 20), ofSize: 20)
        
        var tb3 = UITabBarItem()
        tb3.title = "Hours"
        tb3.tag = 2
        tb3.icon(from: .fontAwesome, code: "info", iconColor: .gray, imageSize: CGSize(width: 20, height: 20), ofSize: 20)
        var tb4 = UITabBarItem()
        tb4.title = "Images"
        tb4.tag = 3
        tb4.icon(from: .fontAwesome, code: "info", iconColor: .gray, imageSize: CGSize(width: 20, height: 20), ofSize: 20)
        tb.items = [tb1,tb2,tb3,tb4]
        return tb
    }()
    
    
    
    fileprivate var table: UITableView = {
        var tv = UITableView()
        return tv
    }()
    
    fileprivate var dropDowntable: UITableView = {
        var table = UITableView()
        return table
    }()
    
    fileprivate let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    
    fileprivate let dropDownView : UIView = {
        let dv = UIView()
        dv.backgroundColor = .red
        return dv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(header)
        header.addSubview(searchBar)
        
        
        view.addSubview(body)
        table.register(CustomCell.self, forCellReuseIdentifier: "businessData")
        table.dataSource = self
        table.delegate = self
        
        
        dropDowntable.register(CustomCell.self, forCellReuseIdentifier: "businessSuggestions")
        dropDowntable.delegate = self
        dropDowntable.dataSource = self
        
        body.addSubview(table)
        view.addSubview(dropDownView)
        dropDownView.addSubview(dropDowntable)
        
        
        view.addSubview(footer)
        footer.addSubview(tabBar)
        
        
        tabBar.delegate = self
        searchBar.delegate = self
        
        header.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(60)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(header.snp.top)
            make.bottom.equalTo(header.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(header.snp.width)
        }
        
        
        body.snp.makeConstraints { (make) in
            make.top.equalTo(self.header.snp.bottomMargin)
            make.bottom.equalTo(self.footer.snp.topMargin)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
        }
        
        
        
        table.snp.makeConstraints { (make) in
            make.top.equalTo(self.body.snp.top)
            make.bottom.equalTo(self.body.snp.bottom)
            make.width.equalTo(self.body.snp.width)
        }
        
        
        dropDowntable.snp.makeConstraints { (make) in
            make.top.equalTo(dropDownView.snp.top)
            make.bottom.equalTo(dropDownView.snp.bottom)
            make.width.equalTo(dropDownView.snp.width)
        }
        
        footer.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(60)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
        }
        
        tabBar.snp.makeConstraints { (make) in
            make.bottom.equalTo(footer.snp.bottom)
            make.height.equalTo(60)
            make.width.equalTo(footer.snp.width)
        }
        
        
        // adding dropdown view
        
        
        
        dropDownView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottomMargin)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(200)
        }
        
        
    }
    
    
    
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
        let index = item.tag
        
        if(index != 0) {
            table.isHidden = true
        }else{
            table.isHidden = false
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns number of rows required here
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.dropDowntable {
            // pass data to each cell item here , we are using Custom Cell Created by us than default UITableCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "businessSuggestions") as! CustomCell
            let currentKey = Array(data.keys)[indexPath.row]
            cell.headerLabel = currentKey
            if let currentValue = data[currentKey]?.stringValue {
                cell.headerValue = currentValue
            }
            return cell
        }else if tableView == self.table {
            // pass data to each cell item here , we are using Custom Cell Created by us than default UITableCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "businessData") as! CustomCell
            let currentKey = Array(data.keys)[indexPath.row]
            cell.headerLabel = currentKey
            if let currentValue = data[currentKey]?.stringValue {
                cell.headerValue = currentValue
            }
            return cell
        }
        
        return UITableViewCell()
        
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
                self.dropDowntable.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }else{
            return
        }
        
    }
    
    
}