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
    init() {
        getCurrentTotal();
    }
    
    func getCurrentTotal() {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": "0f5307b012msh3e6473a2e20e692p16c354jsnf0bb51e630c2"
        ]

        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            
            if let result = response.data {
                let json = JSON(result)
                print(json)
                let confirmed = json[0]["confirmed"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
                let deaths = json[0]["deaths"].intValue
                let lastChange = json[0]["lastChange"].intValue
                let lastUpdate = json[0]["lastUpdate"].intValue
                
                self.totalCount = TotalCount(confirmed: confirmed, critical: critical, deaths: deaths, lastChange: lastChange, lastUpdate: lastUpdate, recovered: recovered)
            } else {
                self.totalCount =  testTotalCount
                print("data acquisition failed, dummy data provided")
            }
        }
    }
}

