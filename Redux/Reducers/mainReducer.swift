//
//  SampleReducer.swift
//  businessData
//
//  Created by synup on 21/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation

import ReSwift

struct MyNameAction: Action {
    let payload: String
}

// the reducer is responsible for evolving the application state based
// on the actions it receives
func mainReducer(action: Action, state: AppState?) -> AppState {
    // if no state has been provided, create the default state
    
    let initialBusinessHours = [BusinessHour(day: "",start_time: "",end_time: "")]
    
    var state = state ?? AppState(businessData: Business(name: "",business_hours: initialBusinessHours))
    
    switch action {
        
    case let action as ReceivedBusinessData:
        state.businessData = action.payload
        break
    default:
        break
    }
    
    return state
}
