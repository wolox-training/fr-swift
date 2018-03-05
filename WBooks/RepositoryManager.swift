//
//  RepositoryManager.swift
//  WBooks
//
//  Created by Florencia Rosental on 05/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import AlamofireNetworkActivityIndicator
import AlamofireNetworkActivityLogger

// Singleton

class RepositoryManager {
    
    static let shared = RepositoryManager()
    
    fileprivate let _sessionManager = SessionManager()
    
    var networkingConfiguration: NetworkingConfiguration {
        return NetworkingConfiguration(
            useSecureConnection: true,
            domainURL: "http://polls.apiblueprint.org",
            subdomainURL: "/api/v1",
            usePinningCertificate: false)
    }
    
    private init() {
        
    }
    
    func createBibliotecaRepo() -> BibliotecaRepository {
        return BibliotecaRepository(
            networkingConfiguration: networkingConfiguration,
            sessionManager: _sessionManager)
    }
}
