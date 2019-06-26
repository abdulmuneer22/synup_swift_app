//
//  NetworkingClient.swift
//  businessData
//
//  Created by synup on 18/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import SwiftyJSON


struct APIResponse : Codable {
    var success : Bool
    var result : Business?
}


class NetworkingClient {
    
    typealias WebServiceResponse = (JSON?,Error?) -> Void
    
//    func execute(url: URL, completion : @escaping WebServiceResponse) {
//        Alamofire.request(url).validate().responseJSON { apiResponse in
//            
//            let response:JSON
//            let error:Any
//            
//            if(apiResponse.result.value != nil){
//                let swiftyJSONVar = JSON(apiResponse.result.value!)
//                response = swiftyJSONVar
//                completion(response,nil)
//            }
//            
//            if(apiResponse.error != nil){
//                let errorJSON = JSON(apiResponse.error!)
//                error = errorJSON
//                completion(nil,error as? Error)
//            }
//            
//            
//            
//            
//        }
//    }
    
    
    
//    func getBusinessData(url : URL){
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let data = data {
//                let result = try? JSONDecoder().decode(APIResponse.self, from: data)
//                let businessData = result?.result
//                if(businessData != nil){
//                    mainStore.dispatch(ReceivedBusinessData(payload: businessData!))
//                }
//                
//            }
//            }.resume()
//    }
    
    
    
    
}
