//
//  BusinessModel.swift
//  businessData
//
//  Created by synup on 21/06/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation

public struct BusinessModel:Decodable {
    
//    public var additionalCategoryIds : [AnyObject]!
//    public var additionalImages : [AnyObject]!
//    public var additionalInfo : AnyObject!
//    public var bizUrl : AnyObject!
    public var businessCover : String!
//    public var businessHours : [BusinessHour]!
    public var businessLogo : String!
    public var city : String!
    public var descriptionField : String!
//    public var facebookUrl : AnyObject!
    public var hideAddress : Bool!
    public var id : Int!
    public var latitude : String!
    public var longitude : String!
    public var name : String!
    public var ownerName : String!
    public var phone : String!
    public var postalCode : String!
    public var stateName : String!
    public var street : String!
    public var subCategoryId : Int!
    public var tagline : String!
//    public var twitterUrl : AnyObject!
//    public var videos : [AnyObject]!
    public var yearOfIncorporation : String!
    
}
