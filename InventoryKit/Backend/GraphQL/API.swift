//  This file was automatically generated and should not be edited.

import Apollo

/// API namespace
public enum API {
  public enum DeleteItemError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case itemDoesNotExist
    case unauthorized
    case unauthenticated
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "ItemDoesNotExist": self = .itemDoesNotExist
        case "Unauthorized": self = .unauthorized
        case "Unauthenticated": self = .unauthenticated
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .itemDoesNotExist: return "ItemDoesNotExist"
        case .unauthorized: return "Unauthorized"
        case .unauthenticated: return "Unauthenticated"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: DeleteItemError, rhs: DeleteItemError) -> Bool {
      switch (lhs, rhs) {
        case (.itemDoesNotExist, .itemDoesNotExist): return true
        case (.unauthorized, .unauthorized): return true
        case (.unauthenticated, .unauthenticated): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum Category: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case book
    case seed
    case other
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "Book": self = .book
        case "Seed": self = .seed
        case "Other": self = .other
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .book: return "Book"
        case .seed: return "Seed"
        case .other: return "Other"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: Category, rhs: Category) -> Bool {
      switch (lhs, rhs) {
        case (.book, .book): return true
        case (.seed, .seed): return true
        case (.other, .other): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum UpdateItemError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case itemDoesNotExist
    case unauthorized
    case unauthenticated
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "ItemDoesNotExist": self = .itemDoesNotExist
        case "Unauthorized": self = .unauthorized
        case "Unauthenticated": self = .unauthenticated
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .itemDoesNotExist: return "ItemDoesNotExist"
        case .unauthorized: return "Unauthorized"
        case .unauthenticated: return "Unauthenticated"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: UpdateItemError, rhs: UpdateItemError) -> Bool {
      switch (lhs, rhs) {
        case (.itemDoesNotExist, .itemDoesNotExist): return true
        case (.unauthorized, .unauthorized): return true
        case (.unauthenticated, .unauthenticated): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum VoteError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case itemDoesNotExist
    case unauthenticated
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "ItemDoesNotExist": self = .itemDoesNotExist
        case "Unauthenticated": self = .unauthenticated
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .itemDoesNotExist: return "ItemDoesNotExist"
        case .unauthenticated: return "Unauthenticated"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: VoteError, rhs: VoteError) -> Bool {
      switch (lhs, rhs) {
        case (.itemDoesNotExist, .itemDoesNotExist): return true
        case (.unauthenticated, .unauthenticated): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum CreateItemError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case unauthenticated
    case unauthorized
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "Unauthenticated": self = .unauthenticated
        case "Unauthorized": self = .unauthorized
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .unauthenticated: return "Unauthenticated"
        case .unauthorized: return "Unauthorized"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: CreateItemError, rhs: CreateItemError) -> Bool {
      switch (lhs, rhs) {
        case (.unauthenticated, .unauthenticated): return true
        case (.unauthorized, .unauthorized): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum WithdrawVoteError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case itemDoesNotExist
    case unauthenticated
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "ItemDoesNotExist": self = .itemDoesNotExist
        case "Unauthenticated": self = .unauthenticated
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .itemDoesNotExist: return "ItemDoesNotExist"
        case .unauthenticated: return "Unauthenticated"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WithdrawVoteError, rhs: WithdrawVoteError) -> Bool {
      switch (lhs, rhs) {
        case (.itemDoesNotExist, .itemDoesNotExist): return true
        case (.unauthenticated, .unauthenticated): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public final class DeleteInventoryItemMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation DeleteInventoryItem($id: UUIDV4!) {\n  deleteItem(id: $id)\n}"

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("deleteItem", arguments: ["id": GraphQLVariable("id")], type: .scalar(DeleteItemError.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deleteItem: DeleteItemError? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "deleteItem": deleteItem])
      }

      /// delete item response
      public var deleteItem: DeleteItemError? {
        get {
          return resultMap["deleteItem"] as? DeleteItemError
        }
        set {
          resultMap.updateValue(newValue, forKey: "deleteItem")
        }
      }
    }
  }

  public final class EditInventoryItemMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation EditInventoryItem($id: UUIDV4!, $name: ItemName!, $description: ItemDescription!, $story: ItemStory, $photo: Base64ItemPhoto, $category: Category!) {\n  updateItem(input: {item: $id, name: $name, description: $description, story: $story, photo: $photo, category: $category}) {\n    __typename\n    item {\n      __typename\n      id\n      name\n      description\n      story\n      photo\n      votes\n      votedOnIt\n      category\n    }\n    error\n  }\n}"

    public var id: String
    public var name: String
    public var description: String
    public var story: String?
    public var photo: String?
    public var category: Category

    public init(id: String, name: String, description: String, story: String? = nil, photo: String? = nil, category: Category) {
      self.id = id
      self.name = name
      self.description = description
      self.story = story
      self.photo = photo
      self.category = category
    }

    public var variables: GraphQLMap? {
      return ["id": id, "name": name, "description": description, "story": story, "photo": photo, "category": category]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("updateItem", arguments: ["input": ["item": GraphQLVariable("id"), "name": GraphQLVariable("name"), "description": GraphQLVariable("description"), "story": GraphQLVariable("story"), "photo": GraphQLVariable("photo"), "category": GraphQLVariable("category")]], type: .nonNull(.object(UpdateItem.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(updateItem: UpdateItem) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "updateItem": updateItem.resultMap])
      }

      /// update item
      public var updateItem: UpdateItem {
        get {
          return UpdateItem(unsafeResultMap: resultMap["updateItem"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "updateItem")
        }
      }

      public struct UpdateItem: GraphQLSelectionSet {
        public static let possibleTypes = ["UpdateItemResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("item", type: .object(Item.selections)),
          GraphQLField("error", type: .scalar(UpdateItemError.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(item: Item? = nil, error: UpdateItemError? = nil) {
          self.init(unsafeResultMap: ["__typename": "UpdateItemResponse", "item": item.flatMap { (value: Item) -> ResultMap in value.resultMap }, "error": error])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var item: Item? {
          get {
            return (resultMap["item"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "item")
          }
        }

        public var error: UpdateItemError? {
          get {
            return resultMap["error"] as? UpdateItemError
          }
          set {
            resultMap.updateValue(newValue, forKey: "error")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Item"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("story", type: .scalar(String.self)),
            GraphQLField("photo", type: .scalar(String.self)),
            GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("category", type: .nonNull(.scalar(Category.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String, description: String, story: String? = nil, photo: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
            self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "description": description, "story": story, "photo": photo, "votes": votes, "votedOnIt": votedOnIt, "category": category])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// unique id of the item
          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// name of the item
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// description of the item
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// story behind this item
          public var story: String? {
            get {
              return resultMap["story"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "story")
            }
          }

          /// photo of item
          public var photo: String? {
            get {
              return resultMap["photo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "photo")
            }
          }

          /// votes on that item
          public var votes: Int {
            get {
              return resultMap["votes"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votes")
            }
          }

          /// did the currently authenticated person voted on it
          public var votedOnIt: Bool {
            get {
              return resultMap["votedOnIt"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "votedOnIt")
            }
          }

          /// category of item
          public var category: Category {
            get {
              return resultMap["category"]! as! Category
            }
            set {
              resultMap.updateValue(newValue, forKey: "category")
            }
          }
        }
      }
    }
  }

  public final class InventoryItemsQuery: GraphQLQuery {
    public let operationDefinition =
      "query InventoryItems($fromId: UUIDV4, $count: Int!) {\n  items(start: $fromId, next: $count) {\n    __typename\n    id\n    name\n    description\n    story\n    photo\n    votes\n    votedOnIt\n    category\n  }\n}"

    public var fromId: String?
    public var count: Int

    public init(fromId: String? = nil, count: Int) {
      self.fromId = fromId
      self.count = count
    }

    public var variables: GraphQLMap? {
      return ["fromId": fromId, "count": count]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Query"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("items", arguments: ["start": GraphQLVariable("fromId"), "next": GraphQLVariable("count")], type: .nonNull(.list(.nonNull(.object(Item.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(items: [Item]) {
        self.init(unsafeResultMap: ["__typename": "Query", "items": items.map { (value: Item) -> ResultMap in value.resultMap }])
      }

      /// get all items
      public var items: [Item] {
        get {
          return (resultMap["items"] as! [ResultMap]).map { (value: ResultMap) -> Item in Item(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Item) -> ResultMap in value.resultMap }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Item"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("story", type: .scalar(String.self)),
          GraphQLField("photo", type: .scalar(String.self)),
          GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("category", type: .nonNull(.scalar(Category.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, name: String, description: String, story: String? = nil, photo: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
          self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "description": description, "story": story, "photo": photo, "votes": votes, "votedOnIt": votedOnIt, "category": category])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// unique id of the item
        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// name of the item
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// description of the item
        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// story behind this item
        public var story: String? {
          get {
            return resultMap["story"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "story")
          }
        }

        /// photo of item
        public var photo: String? {
          get {
            return resultMap["photo"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "photo")
          }
        }

        /// votes on that item
        public var votes: Int {
          get {
            return resultMap["votes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "votes")
          }
        }

        /// did the currently authenticated person voted on it
        public var votedOnIt: Bool {
          get {
            return resultMap["votedOnIt"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "votedOnIt")
          }
        }

        /// category of item
        public var category: Category {
          get {
            return resultMap["category"]! as! Category
          }
          set {
            resultMap.updateValue(newValue, forKey: "category")
          }
        }
      }
    }
  }

  public final class VoteForInventoryItemMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation VoteForInventoryItem($id: UUIDV4!) {\n  vote(id: $id) {\n    __typename\n    item {\n      __typename\n      id\n      name\n      description\n      story\n      photo\n      votes\n      votedOnIt\n      category\n    }\n    error\n  }\n}"

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("vote", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Vote.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(vote: Vote) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "vote": vote.resultMap])
      }

      /// vote on a item
      public var vote: Vote {
        get {
          return Vote(unsafeResultMap: resultMap["vote"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "vote")
        }
      }

      public struct Vote: GraphQLSelectionSet {
        public static let possibleTypes = ["VoteResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("item", type: .object(Item.selections)),
          GraphQLField("error", type: .scalar(VoteError.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(item: Item? = nil, error: VoteError? = nil) {
          self.init(unsafeResultMap: ["__typename": "VoteResponse", "item": item.flatMap { (value: Item) -> ResultMap in value.resultMap }, "error": error])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// item
        public var item: Item? {
          get {
            return (resultMap["item"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "item")
          }
        }

        /// error that might happen during voting
        public var error: VoteError? {
          get {
            return resultMap["error"] as? VoteError
          }
          set {
            resultMap.updateValue(newValue, forKey: "error")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Item"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("story", type: .scalar(String.self)),
            GraphQLField("photo", type: .scalar(String.self)),
            GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("category", type: .nonNull(.scalar(Category.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String, description: String, story: String? = nil, photo: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
            self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "description": description, "story": story, "photo": photo, "votes": votes, "votedOnIt": votedOnIt, "category": category])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// unique id of the item
          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// name of the item
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// description of the item
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// story behind this item
          public var story: String? {
            get {
              return resultMap["story"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "story")
            }
          }

          /// photo of item
          public var photo: String? {
            get {
              return resultMap["photo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "photo")
            }
          }

          /// votes on that item
          public var votes: Int {
            get {
              return resultMap["votes"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votes")
            }
          }

          /// did the currently authenticated person voted on it
          public var votedOnIt: Bool {
            get {
              return resultMap["votedOnIt"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "votedOnIt")
            }
          }

          /// category of item
          public var category: Category {
            get {
              return resultMap["category"]! as! Category
            }
            set {
              resultMap.updateValue(newValue, forKey: "category")
            }
          }
        }
      }
    }
  }

  public final class CreateInventoryItemMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation CreateInventoryItem($name: ItemName!, $description: ItemDescription!, $story: ItemStory, $photo: Base64ItemPhoto, $category: Category!) {\n  create(name: $name, description: $description, story: $story, photo: $photo, category: $category) {\n    __typename\n    item {\n      __typename\n      id\n      name\n      description\n      story\n      photo\n      votes\n      votedOnIt\n      category\n    }\n    error\n  }\n}"

    public var name: String
    public var description: String
    public var story: String?
    public var photo: String?
    public var category: Category

    public init(name: String, description: String, story: String? = nil, photo: String? = nil, category: Category) {
      self.name = name
      self.description = description
      self.story = story
      self.photo = photo
      self.category = category
    }

    public var variables: GraphQLMap? {
      return ["name": name, "description": description, "story": story, "photo": photo, "category": category]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("create", arguments: ["name": GraphQLVariable("name"), "description": GraphQLVariable("description"), "story": GraphQLVariable("story"), "photo": GraphQLVariable("photo"), "category": GraphQLVariable("category")], type: .nonNull(.object(Create.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(create: Create) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "create": create.resultMap])
      }

      /// create a new item
      public var create: Create {
        get {
          return Create(unsafeResultMap: resultMap["create"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "create")
        }
      }

      public struct Create: GraphQLSelectionSet {
        public static let possibleTypes = ["CreateItemResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("item", type: .object(Item.selections)),
          GraphQLField("error", type: .scalar(CreateItemError.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(item: Item? = nil, error: CreateItemError? = nil) {
          self.init(unsafeResultMap: ["__typename": "CreateItemResponse", "item": item.flatMap { (value: Item) -> ResultMap in value.resultMap }, "error": error])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// the created item
        public var item: Item? {
          get {
            return (resultMap["item"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "item")
          }
        }

        /// error that happend during item creation
        public var error: CreateItemError? {
          get {
            return resultMap["error"] as? CreateItemError
          }
          set {
            resultMap.updateValue(newValue, forKey: "error")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Item"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("story", type: .scalar(String.self)),
            GraphQLField("photo", type: .scalar(String.self)),
            GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("category", type: .nonNull(.scalar(Category.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String, description: String, story: String? = nil, photo: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
            self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "description": description, "story": story, "photo": photo, "votes": votes, "votedOnIt": votedOnIt, "category": category])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// unique id of the item
          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// name of the item
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// description of the item
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// story behind this item
          public var story: String? {
            get {
              return resultMap["story"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "story")
            }
          }

          /// photo of item
          public var photo: String? {
            get {
              return resultMap["photo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "photo")
            }
          }

          /// votes on that item
          public var votes: Int {
            get {
              return resultMap["votes"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votes")
            }
          }

          /// did the currently authenticated person voted on it
          public var votedOnIt: Bool {
            get {
              return resultMap["votedOnIt"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "votedOnIt")
            }
          }

          /// category of item
          public var category: Category {
            get {
              return resultMap["category"]! as! Category
            }
            set {
              resultMap.updateValue(newValue, forKey: "category")
            }
          }
        }
      }
    }
  }

  public final class WithdrawVoteFromInventoryItemMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation WithdrawVoteFromInventoryItem($id: UUIDV4!) {\n  withdrawVote(id: $id) {\n    __typename\n    item {\n      __typename\n      id\n      name\n      description\n      story\n      photo\n      votes\n      votedOnIt\n      category\n    }\n    error\n  }\n}"

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("withdrawVote", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(WithdrawVote.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(withdrawVote: WithdrawVote) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "withdrawVote": withdrawVote.resultMap])
      }

      /// remove vote from item
      public var withdrawVote: WithdrawVote {
        get {
          return WithdrawVote(unsafeResultMap: resultMap["withdrawVote"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "withdrawVote")
        }
      }

      public struct WithdrawVote: GraphQLSelectionSet {
        public static let possibleTypes = ["WithdrawVoteResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("item", type: .object(Item.selections)),
          GraphQLField("error", type: .scalar(WithdrawVoteError.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(item: Item? = nil, error: WithdrawVoteError? = nil) {
          self.init(unsafeResultMap: ["__typename": "WithdrawVoteResponse", "item": item.flatMap { (value: Item) -> ResultMap in value.resultMap }, "error": error])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// item
        public var item: Item? {
          get {
            return (resultMap["item"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "item")
          }
        }

        /// error happend during withdrawing a vote
        public var error: WithdrawVoteError? {
          get {
            return resultMap["error"] as? WithdrawVoteError
          }
          set {
            resultMap.updateValue(newValue, forKey: "error")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Item"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("story", type: .scalar(String.self)),
            GraphQLField("photo", type: .scalar(String.self)),
            GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("category", type: .nonNull(.scalar(Category.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String, description: String, story: String? = nil, photo: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
            self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "description": description, "story": story, "photo": photo, "votes": votes, "votedOnIt": votedOnIt, "category": category])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// unique id of the item
          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// name of the item
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// description of the item
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// story behind this item
          public var story: String? {
            get {
              return resultMap["story"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "story")
            }
          }

          /// photo of item
          public var photo: String? {
            get {
              return resultMap["photo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "photo")
            }
          }

          /// votes on that item
          public var votes: Int {
            get {
              return resultMap["votes"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votes")
            }
          }

          /// did the currently authenticated person voted on it
          public var votedOnIt: Bool {
            get {
              return resultMap["votedOnIt"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "votedOnIt")
            }
          }

          /// category of item
          public var category: Category {
            get {
              return resultMap["category"]! as! Category
            }
            set {
              resultMap.updateValue(newValue, forKey: "category")
            }
          }
        }
      }
    }
  }
}