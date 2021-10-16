//
//  SplashProvider.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import Foundation

protocol SplashProviderProtocol {
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> (),
                   failure: @escaping (NetworkError) -> ())
}

final class SplashProvider: SplashProviderProtocol {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> (),
                   failure: @escaping (NetworkError) -> ()) {
        
        self.networkService.requestGeneric(requestObject: SplashProviderRequest.requestData(data: "\(10)"),
                                           entityClass: MusicServerModel.self) { [weak self] musicServerModel in
            guard self != nil else { return }
            guard let musicServerModelDes = musicServerModel else { return }
            completionHandler(.success(musicServerModelDes))
        } failure: { [weak self] networkError in
            guard self != nil else { return }
            failure(networkError)
        }
    }
}

struct SplashProviderRequest {
    
    static func requestData(data numeroItems: String) -> RequestDTO {
        let arguments: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: arguments)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
}

