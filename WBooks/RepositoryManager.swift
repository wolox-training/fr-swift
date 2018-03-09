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
    
    static let sessionToken: String? = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDksInZlcmlmaWNhdGlvbl9jb2RlIjoiZkNmQWJ1bmpfS0xmVkp6cjhIeWQ3dHc1VlJSa1ZNQi1iNFhZWnlHd0pYc3NMenpUVm1uY3RHLTVGcFBxRHhocyIsInJlbmV3X2lkIjoiWmVOSlNpcG1pZUVuclVlZER5bVVSRlRtOTVOdHhGNktuaUV5dDlHN215ekdCOWhzaHhzb1NKcFNZTC1jWG5UUCIsIm1heGltdW1fdXNlZnVsX2RhdGUiOjE1MjMxMDUzNjMsImV4cGlyYXRpb25fZGF0ZSI6MTUyMDY4NjE2Mywid2FybmluZ19leHBpcmF0aW9uX2RhdGUiOjE1MjA1MzEzNjN9.mh6G7AvKvgH2ywKyvKbfhHyvYBVnrGg0_D1P3BdohXM"
    
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
        let token = RepositoryManager.sessionToken!
        let userLogged = User(sessionToken: token, id: 1)
        _sessionManager.login(user: userLogged)
    }
    
    func createBibliotecaRepository() -> BibliotecaRepository {
        return BibliotecaRepository(
            networkingConfiguration: networkingConfiguration,
            sessionManager: _sessionManager)
    }
    
}
