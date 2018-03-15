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

class RepositoryManager {
    
    static let shared = RepositoryManager()
    
    fileprivate static let sessionToken: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDksInZlcmlmaWNhdGlvbl9jb2RlIjoiZkNmQWJ1bmpfS0xmVkp6cjhIeWQ3dHc1VlJSa1ZNQi1iNFhZWnlHd0pYc3NMenpUVm1uY3RHLTVGcFBxRHhocyIsInJlbmV3X2lkIjoiR3lZZlF6dVhTMllMOFRRb2d4TUJ2c1N5N3FKcjV4NldiUWtzVUQxc1JYdlo4elBHaHoxSDVKX3hDRngySHhrcyIsIm1heGltdW1fdXNlZnVsX2RhdGUiOjE1MjM3Mjc3NzQsImV4cGlyYXRpb25fZGF0ZSI6MTUyMTMwODU3NCwid2FybmluZ19leHBpcmF0aW9uX2RhdGUiOjE1MjExNTM3NzR9.ODYW6PcALJ-iMEgYJEi3gzn_A0ZFdseq99VzeTV_2Lc"
    
    fileprivate let _sessionManager = SessionManager()
    
    var networkingConfiguration: NetworkingConfiguration {
        return NetworkingConfiguration(
            useSecureConnection: true,
            domainURL: "wbooks-api-stage.herokuapp.com",
            subdomainURL: "/api/v1",
            usePinningCertificate: false)
    }
    
    private init() {
        logInUser()
    }
    
    func logInUser() {
        let token = RepositoryManager.sessionToken
        let userLogged = User(sessionToken: token, id: 1)
        _sessionManager.login(user: userLogged)
    }
    
    func createLibraryRepository() -> LibraryRepository {
        return LibraryRepository(
            networkingConfiguration: networkingConfiguration,
            sessionManager: _sessionManager)
    }
}
