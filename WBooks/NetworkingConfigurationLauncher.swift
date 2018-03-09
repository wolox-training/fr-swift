//
//  NetworkingConfiguration.swift
//  WBooks
//
//  Created by Florencia Rosental on 02/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import AlamofireNetworkActivityIndicator
import AlamofireNetworkActivityLogger

class NetworkingConfigurationLauncher {
    
    fileprivate let _sessionManager = SessionManager()
    
    func launch() {
        enableAlamofireNetworkActivityLogger()
        enableNetworkActivityIndicatorManager()
        bootstrapSessionManager()
    }
}

private extension NetworkingConfigurationLauncher {
    
    func enableAlamofireNetworkActivityLogger() {
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
    }
    
    func enableNetworkActivityIndicatorManager() {
        NetworkActivityIndicatorManager.shared.isEnabled = true
    }
 
    func bootstrapSessionManager() {
        _sessionManager.bootstrap()
    }
}
