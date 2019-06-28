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
    public static func getBusinessData(queryString: String, completion : @escaping ([JSON]) -> Void) {
        apollo.fetch(query: SearchLocationsQuery(query: queryString)) {
            (result,error) in
            if let resultMap = result?.data?.resultMap {
                let accountData = JSON(resultMap)
                let payload = accountData["searchLocations"]["edges"].arrayValue
                
                // return array of JSON
                completion(payload)
            }
        }
    }
    
}
