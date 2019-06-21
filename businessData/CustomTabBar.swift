//
//  CustomTabBar.swift
//  businessData
//
//  Created by synup on 21/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import UIKit


class CustomTabBarController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup custom view controllers
        
        //        let layout = UICollectionViewLayout()
        
        let rootViewController = ViewController()
        let businessDetailsViewController = BusinessDetailsViewController()
        let operationDetailsViewController = OperationalDetailsViewController()
        let mediaViewController = MediaViewController()
        
        
        
        
        viewControllers = [
            createNavBarController(name: "Business Information",vc :rootViewController),
            createNavBarController(name: "Business Details",vc : businessDetailsViewController),
            createNavBarController(name: "Operation Details",vc : operationDetailsViewController),
            createNavBarController(name: "Media",vc : mediaViewController)
        ]
        
    }
    
    
    
    private func createNavBarController(name:String , vc : UIViewController) -> UINavigationController {
        //        let vc = UIViewController()
        let tabBarImage = UIImage(named: "handshake")
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = name
        navController.tabBarItem.image = tabBarImage
        return navController
    }
}
