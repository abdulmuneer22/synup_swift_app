//  This file was automatically generated and should not be edited.

import Apollo

public final class SearchLocationsQuery: GraphQLQuery {
  public let operationDefinition =
    "query searchLocations($query: String!) {\n  searchLocations(query: $query) {\n    __typename\n    edges {\n      __typename\n      node {\n        __typename\n        name\n        accountId\n        city\n        countryIso\n        ownerEmail\n      }\n    }\n  }\n}"

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
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("accountId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("countryIso", type: .nonNull(.scalar(String.self))),
            GraphQLField("ownerEmail", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, accountId: Int, city: String, countryIso: String, ownerEmail: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "LocationSummary", "name": name, "accountId": accountId, "city": city, "countryIso": countryIso, "ownerEmail": ownerEmail])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          /// Id of the account to which the location belongs to
          public var accountId: Int {
            get {
              return resultMap["accountId"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "accountId")
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

          /// Email ID of the owner of the business
          public var ownerEmail: String? {
            get {
              return resultMap["ownerEmail"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "ownerEmail")
            }
          }
        }
      }
    }
  }
}