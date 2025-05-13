//
//  NetworkManager.swift
//  Countries
//
//  Created by Maksym Horobets on 13.05.2025.
//

import Foundation

@objc
final class NewNetworkManager: NSObject {
    
    private let baseAPIEndpoint: String = "https://restcountries.com/v3.1/region/"
    
    @objc(sendRequestForCountriesForWorldRegion:completionHandler:)
    func sendRequestForCountriesForWorldRegion(_ worldRegion: WorldRegion,
                                               completion: @Sendable @escaping ([NameOnlyCountry]?, Error?) -> Void) {
        print("Swift method invoked!")
        let regionString = NSStringFromWorldRegion(worldRegion)
        let endingString = String(stringLiteral: "?fields=name")
        let resultString = baseAPIEndpoint + regionString + endingString
        
        guard let url = URL(string: resultString) else { completion(nil, NSError()); return }
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            // Check response
            let responseCode = response as! HTTPURLResponse
            guard responseCode.statusCode == 200 else { completion(nil, NSError()); return }
            
            guard let data else { completion(nil, NSError()); return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                guard let array = json as? [[String:Any]] else {
                  completion(nil, NSError()) ; return
                }
                let countries = array.compactMap { dict in
                  NameOnlyCountry(dictionary: dict)
                }
                completion(countries, nil)
                print("Success!: \(countries)")
            } catch {
                completion(nil, NSError()) ; return
            }
            
        }
        task.resume()
    }
    
    
}
