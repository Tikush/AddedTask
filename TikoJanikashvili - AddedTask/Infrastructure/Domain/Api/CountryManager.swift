//
//  CountryApiManager.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 17.12.22.
//

import Foundation

protocol CountryManagerProtocol: AnyObject {
    func fetchCountry(with endPoint: EndPoint, completion: @escaping(Country) -> Void)
}

class CountryManager: CountryManagerProtocol {
    
    func fetchCountry(with endPoint: EndPoint, completion: @escaping (Country) -> Void) {
        NetworkManager.shared.get(with: endPoint.rawValue) { (result: Result<Country, Error>) in
            switch result {
            case .success(let country):
                completion(country)
            case .failure(let error):
                print(error)
            }
        }
    }
}
