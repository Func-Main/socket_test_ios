//
//  ApolloService.swift
//  Conversation
//
//  Created by Daniel Morgan on 12/07/2021.
//


import Apollo
import ApolloSQLite
import ApolloWebSocket
import Foundation
import Combine

class ApolloService {
    static let shared = ApolloService()
    static let url = Config.host.appendingPathComponent("api")
  
    private(set) lazy var client: ApolloClient = {

        let store = ApolloStore()
        
        let requestChainTransport = RequestChainNetworkTransport(
            interceptorProvider: DefaultInterceptorProvider(store: store),
            endpointURL: ApolloService.url
        )
        
        // The Normal Apollo Web Socket Implementation which uses an Apollo adapter server side
        let wsUrl = Config.absintheWsHost
        let wsRequest = URLRequest(url: wsUrl)
        let wsClient = WebSocket(request: wsRequest)
        let apolloWebSocketTransport =  WebSocketTransport(websocket: wsClient)

        let splitNetworkTransport = SplitNetworkTransport(
            uploadingNetworkTransport: requestChainTransport,
            webSocketNetworkTransport: apolloWebSocketTransport
          )

        // Remember to give the store you already created to the client so it
        // doesn't create one on its own
        let client =  ApolloClient(
            networkTransport: splitNetworkTransport,
            store: store
        )

        return client
    }()
}
