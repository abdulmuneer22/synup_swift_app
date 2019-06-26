//
//  GraphQueries.swift
//  businessData
//
//  Created by synup on 26/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import SwiftyJSON

class GraphQueries {
    public static func getBusinessData(completion : @escaping ([String : JSON]) -> Void) {
        apollo.fetch(query: SearchLocationsQuery(query: "OM")) {
            (result,error) in
            if let resultMap = result?.data?.resultMap {
                let accountData = JSON(resultMap)
                let payload = accountData["searchLocations"]["edges"][0]["node"]
                var result: [String : JSON] = [:]
                for (key,subJson):(String, JSON) in payload {
                    result[key] = subJson
                }
                completion(result)
                
            }
        }
    }
    
}
