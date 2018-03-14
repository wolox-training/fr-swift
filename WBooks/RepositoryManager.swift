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
    
    fileprivate static let sessionToken: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDksInZlcmlmaWNhdGlvbl9jb2RlIjoiZkNmQWJ1bmpfS0xmVkp6cjhIeWQ3dHc1VlJSa1ZNQi1iNFhZWnlHd0pYc3NMenpUVm1uY3RHLTVGcFBxRHhocyIsInJlbmV3X2lkIjoiUmt5UzRpei1QaGl4ZnNfMlE0VWFIdXY2UTVqNDZ6RHlBdk1OS1BMTjF6M3g4c3RObnNTcjl3d3pYRm5qWTdKcCIsIm1heGltdW1fdXNlZnVsX2RhdGUiOjE1MjM2MzQzOTksImV4cGlyYXRpb25fZGF0ZSI6MTUyMTIxNTE5OSwid2FybmluZ19leHBpcmF0aW9uX2RhdGUiOjE1MjEwNjAzOTl9.mMknliLcakk_UOupTojGf87NOGEW6ApqPG84OLZYCxE"
    
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
