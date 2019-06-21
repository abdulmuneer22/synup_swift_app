//
//  AppState.swift
//  businessData
//
//  Created by synup on 21/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import ReSwift

//struct Business {
//    let name:String?
//    let city:String?
//    let streetName: String?
//    let tagline : String?
//    let yoc: String?
//
//    init(
//        name:String? = "",
//        city:String? = "",
//        streetName:String? = "",
//        tagline:String? = "",
//        yoc: String? = ""
//        ) {
//        self.name = name
//        self.city = city
//        self.streetName = streetName
//        self.tagline = tagline
//        self.yoc = yoc
//    }
//}





struct AppState: StateType {
    var counter: Int = 0
    var businessData: BusinessModel?
}
