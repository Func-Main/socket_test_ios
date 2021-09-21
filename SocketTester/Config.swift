//
//  Config.swift
//  BetterBooking
//
//  Created by Daniel Morgan on 04/05/2021.
//

import Foundation

struct Config {
    
    /// Our Hosts
    static let debugHost = "funcmain.eu.ngrok.io"
    static let productionHost = "conversation-8sju.onrender.com"
    
    static var localhost: String { "https://\(Config.debugHost)/"}
    static var localhostAbsintheWS: String { "wss://\(Config.debugHost)/absinthe-ws/websocket"}

    
    static let host = URL(string: localhost)!
    static let absintheWsHost = URL(string: localhostAbsintheWS)!

}
