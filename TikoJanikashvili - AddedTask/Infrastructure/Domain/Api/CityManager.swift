//
//  CityManager.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 19.12.22.
//

import Foundation

protocol CityManagerProtocol: AnyObject {
    func fetchCity(with endPoint: EndPoint, countryName: String, completion: @escaping(City) -> Void)
}

class CityManager: CityManagerProtocol {

    func fetchCity(with endPoint: EndPoint, countryName: String, completion: @escaping (City) -> Void) {
        NetworkManager.shared.post(with: endPoint.rawValue, countryName: countryName) { (result: Result<City, Error>) in
            switch result {
            case .success(let cities):
                completion(cities)
            case .failure(let error):
                print(error)
            }
        }
    }
}
