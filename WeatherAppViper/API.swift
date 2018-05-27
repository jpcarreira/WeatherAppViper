//
//  API.swift
//  WeatherAppViper
//
//  Created by João Carreira on 25/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import Foundation


protocol ApiProtocol: WeatherDisplayAPIProtocol { }


final class API {
    
    private static let baseUrl = "https://api.apixu.com/v1/current.json"
    private static let apiKey = "af6d9b9891ce410c868190219181705"
}

extension API: ApiProtocol {
    
    func getCurrentWeather(
            for location: String,
            completionHandler: @escaping (Bool, WeatherConditionEntityProtocol?) -> Void) {
        HTTPClient.get(from: buildUrl(given: location)) { (json, error) in
            if error == nil {
                do {
                    let data = try JSONSerialization.data(withJSONObject: json as Any, options: [])
                    if let string = String(
                        data: data, encoding: String.Encoding.utf8)?.data(using: .utf8) {
                            let weather = try JSONDecoder().decode(Weather.self, from: string)
                            completionHandler(true, weather)
                    }
                } catch {
                    completionHandler(false, nil)
                }
            }
        }
    }
    
    private func buildUrl(given location: String) -> URL {
        return URL(string: "\(API.baseUrl)?key=\(API.apiKey)&q=\(location)")!
    }
}


final class MockAPI: ApiProtocol {
    
    func getCurrentWeather(
            for location: String,
            completionHandler: @escaping (Bool, WeatherConditionEntityProtocol?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            MockAPI.loadJsonDataFromFile("mock", completion: { json in
                if let json = json {
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: json)
                        completionHandler(true, weather)
                    }
                    catch let error as NSError {
                        print(error)
                    }
                }
            })
        }
    }
    
    private static func loadJsonDataFromFile(_ withPath: String, completion: (Data?) -> Void) {
        if let fileUrl = Bundle.main.url(forResource: withPath, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl, options: [])
                completion(data as Data)
            } catch (let error) {
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
