//
//  Model.swift
//  Covid19_Stat
//
//  Created by S. M. Hasibur Rahman on 5/10/20.
//  Copyright © 2020 S. M. Hasibur Rahman. All rights reserved.
//

import Foundation

struct TotalCount {
    let confirmed: Int
    let recovered: Int
    let critical: Int
    let deaths: Int
    let lastChange: Int
    let lastUpdate: Int
    
    var fatalityRate: Double {
        return 100.0 * Double(deaths) / Double(confirmed)
    }
    
    var recoveryRate: Double {
        return 100.0 * Double(recovered) / Double(confirmed)
    }
    
    enum CodingKeys: String {
        case confirmed = "confirmed"
        case recovered = "recovered"
        case critical = "critical"
        case deaths = "deaths"
        case lastChange = "lastChange"
        case lastUpdate = "lastUpdate"
    }
}

struct Country {
    let name: String
    let alpha2code: String
    let alpha3code: String
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String {
        case name = "name"
        case alpha2code = "alpha2code"
        case alpha3code = "alpha3code"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

let testTotalCount = TotalCount(confirmed: 100, recovered: 100, critical: 100, deaths: 100, lastChange: 100, lastUpdate: 100)


