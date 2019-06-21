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
    var state = state ?? AppState(counter: 0, businessData: BusinessModel())
    
    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
        
    case let action as ReceivedBusinessData:
        
        print(action.payload)
        state.businessData = action.payload
        break
    default:
        break
    }
    
    return state
}
