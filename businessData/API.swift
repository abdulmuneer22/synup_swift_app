//  This file was automatically generated and should not be edited.

import Apollo

public enum LocationApproved: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case approved
  case notApproved
  case pending
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "APPROVED": self = .approved
      case "NOT_APPROVED": self = .notApproved
      case "PENDING": self = .pending
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .approved: return "APPROVED"
      case .notApproved: return "NOT_APPROVED"
      case .pending: return "PENDING"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: LocationApproved, rhs: LocationApproved) -> Bool {
    switch (lhs, rhs) {
      case (.approved, .approved): return true
      case (.notApproved, .notApproved): return true
      case (.pending, .pending): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum DayOfTheWeek: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
  case special
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MONDAY": self = .monday
      case "TUESDAY": self = .tuesday
      case "WEDNESDAY": self = .wednesday
      case "THURSDAY": self = .thursday
      case "FRIDAY": self = .friday
      case "SATURDAY": self = .saturday
      case "SUNDAY": self = .sunday
      case "SPECIAL": self = .special
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .monday: return "MONDAY"
      case .tuesday: return "TUESDAY"
      case .wednesday: return "WEDNESDAY"
      case .thursday: return "THURSDAY"
      case .friday: return "FRIDAY"
      case .saturday: return "SATURDAY"
      case .sunday: return "SUNDAY"
      case .special: return "SPECIAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DayOfTheWeek, rhs: DayOfTheWeek) -> Bool {
    switch (lhs, rhs) {
      case (.monday, .monday): return true
      case (.tuesday, .tuesday): return true
      case (.wednesday, .wednesday): return true
      case (.thursday, .thursday): return true
      case (.friday, .friday): return true
      case (.saturday, .saturday): return true
      case (.sunday, .sunday): return true
      case (.special, .special): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class SearchLocationsQuery: GraphQLQuery {
  public let operationDefinition =
    "query searchLocations($query: String!) {\n  searchLocations(query: $query) {\n    __typename\n    edges {\n      __typename\n      node {\n        __typename\n        accountId\n        name\n        additionalInfo\n        approved\n        bizUrl\n        cancellationScheduledAt\n        categoryId\n        city\n        countryIso\n        databaseId\n        description\n        facebookUrl\n        locationPhotos {\n          __typename\n          name\n        }\n        ownerEmail\n        businessHours {\n          __typename\n          day\n        }\n      }\n    }\n  }\n}"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("searchLocations", arguments: ["query": GraphQLVariable("query")], type: .object(SearchLocation.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(searchLocations: SearchLocation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchLocations": searchLocations.flatMap { (value: SearchLocation) -> ResultMap in value.resultMap }])
    }

    /// Search for locations
    public var searchLocations: SearchLocation? {
      get {
        return (resultMap["searchLocations"] as? ResultMap).flatMap { SearchLocation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "searchLocations")
      }
    }

    public struct SearchLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["LocationSummaryConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "LocationSummaryConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["LocationSummaryEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .nonNull(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "LocationSummaryEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["LocationSummary"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accountId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("additionalInfo", type: .scalar(String.self)),
            GraphQLField("approved", type: .scalar(LocationApproved.self)),
            GraphQLField("bizUrl", type: .scalar(String.self)),
            GraphQLField("cancellationScheduledAt", type: .scalar(String.self)),
            GraphQLField("categoryId", type: .scalar(Int.self)),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("countryIso", type: .nonNull(.scalar(String.self))),
            GraphQLField("databaseId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("facebookUrl", type: .scalar(String.self)),
            GraphQLField("locationPhotos", type: .list(.object(LocationPhoto.selections))),
            GraphQLField("ownerEmail", type: .scalar(String.self)),
            GraphQLField("businessHours", type: .list(.nonNull(.object(BusinessHour.selections)))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(accountId: Int, name: String, additionalInfo: String? = nil, approved: LocationApproved? = nil, bizUrl: String? = nil, cancellationScheduledAt: String? = nil, categoryId: Int? = nil, city: String, countryIso: String, databaseId: Int, description: String? = nil, facebookUrl: String? = nil, locationPhotos: [LocationPhoto?]? = nil, ownerEmail: String? = nil, businessHours: [BusinessHour]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LocationSummary", "accountId": accountId, "name": name, "additionalInfo": additionalInfo, "approved": approved, "bizUrl": bizUrl, "cancellationScheduledAt": cancellationScheduledAt, "categoryId": categoryId, "city": city, "countryIso": countryIso, "databaseId": databaseId, "description": description, "facebookUrl": facebookUrl, "locationPhotos": locationPhotos.flatMap { (value: [LocationPhoto?]) -> [ResultMap?] in value.map { (value: LocationPhoto?) -> ResultMap? in value.flatMap { (value: LocationPhoto) -> ResultMap in value.resultMap } } }, "ownerEmail": ownerEmail, "businessHours": businessHours.flatMap { (value: [BusinessHour]) -> [ResultMap] in value.map { (value: BusinessHour) -> ResultMap in value.resultMap } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Id of the account to which the location belongs to
          public var accountId: Int {
            get {
              return resultMap["accountId"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "accountId")
            }
          }

          /// Name of the location
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// Any additional information on the location
          public var additionalInfo: String? {
            get {
              return resultMap["additionalInfo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "additionalInfo")
            }
          }

          /// Location Approval Status
          public var approved: LocationApproved? {
            get {
              return resultMap["approved"] as? LocationApproved
            }
            set {
              resultMap.updateValue(newValue, forKey: "approved")
            }
          }

          /// Business Url of the location
          public var bizUrl: String? {
            get {
              return resultMap["bizUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "bizUrl")
            }
          }

          /// Date at which location is cancelled
          public var cancellationScheduledAt: String? {
            get {
              return resultMap["cancellationScheduledAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "cancellationScheduledAt")
            }
          }

          /// Id of the parent category of the primary sub category
          public var categoryId: Int? {
            get {
              return resultMap["categoryId"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "categoryId")
            }
          }

          /// City
          public var city: String {
            get {
              return resultMap["city"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "city")
            }
          }

          /// Unique ISO of the location's country
          public var countryIso: String {
            get {
              return resultMap["countryIso"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "countryIso")
            }
          }

          /// Id of the location on the database
          public var databaseId: Int {
            get {
              return resultMap["databaseId"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "databaseId")
            }
          }

          /// description of the location
          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// Url of the loction's facebook page
          public var facebookUrl: String? {
            get {
              return resultMap["facebookUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "facebookUrl")
            }
          }

          /// All photos of the location
          public var locationPhotos: [LocationPhoto?]? {
            get {
              return (resultMap["locationPhotos"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LocationPhoto?] in value.map { (value: ResultMap?) -> LocationPhoto? in value.flatMap { (value: ResultMap) -> LocationPhoto in LocationPhoto(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [LocationPhoto?]) -> [ResultMap?] in value.map { (value: LocationPhoto?) -> ResultMap? in value.flatMap { (value: LocationPhoto) -> ResultMap in value.resultMap } } }, forKey: "locationPhotos")
            }
          }

          /// Email ID of the owner of the business
          public var ownerEmail: String? {
            get {
              return resultMap["ownerEmail"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "ownerEmail")
            }
          }

          /// Operational hours of the location
          public var businessHours: [BusinessHour]? {
            get {
              return (resultMap["businessHours"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [BusinessHour] in value.map { (value: ResultMap) -> BusinessHour in BusinessHour(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [BusinessHour]) -> [ResultMap] in value.map { (value: BusinessHour) -> ResultMap in value.resultMap } }, forKey: "businessHours")
            }
          }

          public struct LocationPhoto: GraphQLSelectionSet {
            public static let possibleTypes = ["LocationPhoto"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "LocationPhoto", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// File name of the photo
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct BusinessHour: GraphQLSelectionSet {
            public static let possibleTypes = ["BusinessHoursDay"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("day", type: .scalar(DayOfTheWeek.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(day: DayOfTheWeek? = nil) {
              self.init(unsafeResultMap: ["__typename": "BusinessHoursDay", "day": day])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The day of the week
            public var day: DayOfTheWeek? {
              get {
                return resultMap["day"] as? DayOfTheWeek
              }
              set {
                resultMap.updateValue(newValue, forKey: "day")
              }
            }
          }
        }
      }
    }
  }
}