//
//  NetworkingClient.swift
//  businessData
//
//  Created by synup on 18/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class NetworkingClient {
    
    typealias WebServiceResponse = (JSON?,Error?) -> Void
    
    func execute(url: URL, completion : @escaping WebServiceResponse) {
        Alamofire.request(url).validate().responseJSON { apiResponse in
            
            let response:JSON
            let error:Any
            
            if(apiResponse.result.value != nil){
                let swiftyJSONVar = JSON(apiResponse.result.value!)
                response = swiftyJSONVar
                completion(response,nil)
            }
            
            if(apiResponse.error != nil){
                let errorJSON = JSON(apiResponse.error!)
                error = errorJSON
                completion(nil,error as? Error)
            }
            
            
            
            
        }
    }
    
    
    
    
    
}
