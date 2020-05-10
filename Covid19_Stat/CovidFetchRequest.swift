//
//  CovidFetchRequest.swift
//  Covid19_Stat
//
//  Created by S. M. Hasibur Rahman on 5/9/20.
//  Copyright © 2020 S. M. Hasibur Rahman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject {
    @Published var totalCount = testTotalCount
    var countries: [Country] = []
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "0f5307b012msh3e6473a2e20e692p16c354jsnf0bb51e630c2"
    ]
    
    init() {
        getCurrentTotal();
        sleep(4)//probably server allows me to hit at most once per 2 to 4 seconds, without this force delay data will be fetched only for first api
        getAllCountries();
    }
    
    func getCurrentTotal() {
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            
            if let result = response.data {
                let json = JSON(result)
                print(json)
                let confirmed = json[0][TotalCount.self.CodingKeys.confirmed.rawValue].intValue
                let recovered = json[0][TotalCount.self.CodingKeys.recovered.rawValue].intValue
                let critical = json[0][TotalCount.self.CodingKeys.critical.rawValue].intValue
                let deaths = json[0][TotalCount.self.CodingKeys.deaths.rawValue].intValue
                let lastChange = json[0][TotalCount.self.CodingKeys.lastChange.rawValue].intValue
                let lastUpdate = json[0][TotalCount.self.CodingKeys.lastUpdate.rawValue].intValue
                
                self.totalCount = TotalCount(confirmed: confirmed, recovered: recovered, critical: critical, deaths: deaths, lastChange: lastChange, lastUpdate: lastUpdate)
            } else {
                self.totalCount =  testTotalCount
                print("data acquisition failed, dummy data provided")
            }
        }
    }
    
    func getAllCountries() {
        AF.request("https://covid-19-data.p.rapidapi.com/help/countries?format=json", headers: headers).responseJSON { response in
            if let result = response.value {
                let jsonCountries = result as! [Dictionary<String, AnyObject>]
                print(jsonCountries)
                var countries: [Country] = []
                for jsonCountry in jsonCountries {
                    let name = jsonCountry[Country.self.CodingKeys.name.rawValue] as? String ?? "NIL"
                    let alpha2code = jsonCountry[Country.self.CodingKeys.alpha2code.rawValue] as? String ?? "NIL"
                    let alpha3code = jsonCountry[Country.self.CodingKeys.alpha3code.rawValue] as? String ?? "NIL"
                    let latitude = jsonCountry[Country.self.CodingKeys.latitude.rawValue] as? Double ?? 0.0
                    let longitude = jsonCountry[Country.self.CodingKeys.longitude.rawValue] as? Double ?? 0.0
                    
                    let country = Country(name: name, alpha2code: alpha2code, alpha3code: alpha3code, latitude: latitude, longitude: longitude)
                    countries.append(country)
                }
                self.countries = countries
            } else {
                print("data acquisition failed")
            }
        }
    }
}

