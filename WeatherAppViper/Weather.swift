//
//  Weather.swift
//  WeatherAppViper
//
//  Created by João Carreira on 26/05/2018.
//  Copyright © 2018 João Carreira. All rights reserved.
//

import Foundation


struct Weather: Decodable {
    
    let locationName: String
    let locationCountry: String
    let currentLastUpdated: String
    let currentTemperature: Double
    let currentIsDay: Int
    let currentConditionText: String
    let currentConditionIconUrl: String
    let currentWindSpeed: Double
    let currentWindDirection: String
    
    enum CodingKeys: String, CodingKey {
        case location
        case current
    }
    
    enum LocationCodingKeys: String, CodingKey {
        case name
        case country
    }
    
    enum CurrentCodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case temperature = "temp_c"
        case isDay = "is_day"
        case condition
        case windSpeed = "wind_kph"
        case windDirection = "wind_dir"
    }
    
    enum ConditionCodingKeys: String, CodingKey {
        case text
        case icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let locationData = try container.nestedContainer(
            keyedBy: LocationCodingKeys.self, forKey: .location)
        let currentData = try container.nestedContainer(
            keyedBy: CurrentCodingKeys.self, forKey: .current)
        let currentCondition = try currentData.nestedContainer(
            keyedBy: ConditionCodingKeys.self, forKey: .condition)
        
        
        locationName = try locationData.decode(String.self, forKey: .name)
        locationCountry = try locationData.decode(String.self, forKey: .country)
        currentLastUpdated = try currentData.decode(String.self, forKey: .lastUpdated)
        currentTemperature = try currentData.decode(Double.self, forKey: .temperature)
        currentIsDay = try currentData.decode(Int.self, forKey: .isDay)
        currentConditionText = try currentCondition.decode(String.self, forKey: .text)
        currentConditionIconUrl = try currentCondition.decode(String.self, forKey: .icon)
        currentWindSpeed = try currentData.decode(Double.self, forKey: .windSpeed)
        currentWindDirection = try currentData.decode(String.self, forKey: .windDirection)
    }
}


extension Weather: WeatherConditionEntityProtocol {
    
    var location: String {
        return "\(locationName), \(locationCountry)"
    }
    
    var isDay: Bool {
        return currentIsDay == 1
    }
    
    var condition: String {
        return currentConditionText
    }
    
    var wind: String {
        return "\(currentWindDirection) \(currentWindSpeed) km/h"
    }
    
    var temperature: String {
        return "\(currentTemperature) ºC"
    }
    
    var icon: String? {
        return String(String(currentConditionIconUrl.suffix(7)).prefix(3))
    }
}
