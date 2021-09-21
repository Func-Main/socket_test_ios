// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SubscriptionTestTriggerMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SubscriptionTestTrigger {
      subscriptionTest {
        __typename
        ...TestPayloadFragment
      }
    }
    """

  public let operationName: String = "SubscriptionTestTrigger"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + TestPayloadFragment.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subscriptionTest", type: .object(SubscriptionTest.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subscriptionTest: SubscriptionTest? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "subscriptionTest": subscriptionTest.flatMap { (value: SubscriptionTest) -> ResultMap in value.resultMap }])
    }

    /// Test Subscription
    public var subscriptionTest: SubscriptionTest? {
      get {
        return (resultMap["subscriptionTest"] as? ResultMap).flatMap { SubscriptionTest(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "subscriptionTest")
      }
    }

    public struct SubscriptionTest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TestPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(TestPayloadFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "TestPayload", "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var testPayloadFragment: TestPayloadFragment {
          get {
            return TestPayloadFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class SubscriptionTestSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription SubscriptionTest {
      subscriptionTest {
        __typename
        ...TestPayloadFragment
      }
    }
    """

  public let operationName: String = "SubscriptionTest"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + TestPayloadFragment.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootSubscriptionType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subscriptionTest", type: .object(SubscriptionTest.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subscriptionTest: SubscriptionTest? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootSubscriptionType", "subscriptionTest": subscriptionTest.flatMap { (value: SubscriptionTest) -> ResultMap in value.resultMap }])
    }

    /// Test Subscription
    public var subscriptionTest: SubscriptionTest? {
      get {
        return (resultMap["subscriptionTest"] as? ResultMap).flatMap { SubscriptionTest(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "subscriptionTest")
      }
    }

    public struct SubscriptionTest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TestPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(TestPayloadFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "TestPayload", "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var testPayloadFragment: TestPayloadFragment {
          get {
            return TestPayloadFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct TestPayloadFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment TestPayloadFragment on TestPayload {
      __typename
      message
    }
    """

  public static let possibleTypes: [String] = ["TestPayload"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("message", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(message: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "TestPayload", "message": message])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var message: String? {
    get {
      return resultMap["message"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "message")
    }
  }
}
