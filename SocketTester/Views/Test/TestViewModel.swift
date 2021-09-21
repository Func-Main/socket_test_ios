//
//  TestViewModel.swift
//  SocketTester
//
//  Created by Daniel Morgan on 20/09/2021.
//

import Foundation
import Combine
import Apollo

class TestViewModel: ObservableObject {
    
    private var cancellableSet: Set<AnyCancellable> = []
    private var subscription: Apollo.Cancellable?

    @Published var subscriptionResults: [Date] = []
    
    deinit {
        subscription?.cancel()
    }

    func trigger() {
        print("Trigger")
        
        remoteTestTriggerSubscriptionOperation()
            .sink { completion in
            switch completion {
            case .failure(let error):
                print("remoteTestTriggerSubscriptionOperation failed: \(error)")
            case .finished:
                break
            }
        } receiveValue: { result in
            print("remoteTestTriggerSubscriptionOperation Success: \(result)")
        }
        .store(in: &cancellableSet)
    }
    
    func subscribe() {
        subscription = ApolloService.shared.client.subscribe(subscription: SubscriptionTestSubscription()) { [weak self] result in
            switch result {
                case .success(let graphQLResult):
                    guard let _ = graphQLResult.data?.subscriptionTest?.fragments.testPayloadFragment else {
                        print("Unable to parse")
                        return
                    }
                    self?.subscriptionResults.append(Date())
                case .failure(let error):
                    print("Subscription Failed: \(error)")
            }
        }
    }
    
    
    //MARK: - API Methods
    
    private func remoteTestTriggerSubscriptionOperation() -> AnyPublisher<TestPayloadFragment, APIError> {
                return Deferred {
                    Future { promise in
                        ApolloService.shared.client.perform(mutation: SubscriptionTestTriggerMutation()) { result in
                            switch result {
                                case .success(let graphQLResult):
        
                                guard let fragment = graphQLResult.data?.subscriptionTest?.fragments.testPayloadFragment else {
                                    return promise(.failure(APIError.unableToParse))
                                    }
        
                                    promise(.success(fragment))
        
                                case .failure(_):
                                promise(.failure(APIError.unknown))
                            }
                        }
                     }
                }
                .eraseToAnyPublisher()
    }
}


enum APIError: Error {
    case unknown
    case unableToParse
}
