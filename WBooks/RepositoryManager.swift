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
    
    fileprivate static let sessionToken: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDksInZlcmlmaWNhdGlvbl9jb2RlIjoiZkNmQWJ1bmpfS0xmVkp6cjhIeWQ3dHc1VlJSa1ZNQi1iNFhZWnlHd0pYc3NMenpUVm1uY3RHLTVGcFBxRHhocyIsInJlbmV3X2lkIjoibkg3MW1NMzlONzJpOFRrMXNzakp4M25pVU1LaHFfams3Z19WNFRpZ3k5VUFGYVZYQy12U2s0U3dxMkpBVU5qeCIsIm1heGltdW1fdXNlZnVsX2RhdGUiOjE1MjM4MTAzMDMsImV4cGlyYXRpb25fZGF0ZSI6MTUyMTM5MTEwMywid2FybmluZ19leHBpcmF0aW9uX2RhdGUiOjE1MjEyMzYzMDN9.dB6uF8era7inAlQ9ftNj704w534MmeMXd4uarpnCCNY"
    
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
        let userLogged = AuthUser(sessionToken: token, id: 1)
        _sessionManager.login(user: userLogged)
    }
    
    func createLibraryRepository() -> LibraryRepository {
        return LibraryRepository(
            networkingConfiguration: networkingConfiguration,
            sessionManager: _sessionManager)
    }
    
    func createBookCommentsRepository() -> BookCommentsRepository {
        return BookCommentsRepository(
            networkingConfiguration: networkingConfiguration,
            sessionManager: _sessionManager)
    }
}
