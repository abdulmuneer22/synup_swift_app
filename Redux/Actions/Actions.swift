//
//  Actions.swift
//  businessData
//
//  Created by synup on 21/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation

import ReSwift

// all of the actions that can be applied to the state
struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}

// synup actions
struct ReceivedBusinessData: Action {
    let payload : Business
}
