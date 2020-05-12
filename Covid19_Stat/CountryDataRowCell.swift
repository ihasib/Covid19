//
//  CountryDataRowCell.swift
//  Covid19_Stat
//
//  Created by S. M. Hasibur Rahman on 5/12/20.
//  Copyright © 2020 S. M. Hasibur Rahman. All rights reserved.
//

import SwiftUI

struct CountryDataRowCell: View {
    var countryLatestData: CountryLatestUpdate
    
    var body: some View {
        HStack {
            Text(countryLatestData.country)
                .fontWeight(.medium)
                .frame(alignment: .leading)
                .padding(.leading,10)
            Spacer()
            Text(countryLatestData.confirmed.getFormattedString())
                .fontWeight(.medium)
                .frame(alignment: .leading)
            Spacer()
            Text(countryLatestData.deaths.getFormattedString())
                .fontWeight(.medium)
                .frame(alignment: .leading)
            Spacer()
            Text(countryLatestData.recovered.getFormattedString())
                .fontWeight(.medium)
                .frame(alignment: .leading)
                .padding(.trailing,10)
        }
    }
}

struct CountryDataRowCell_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowCell(countryLatestData: CountryLatestUpdate(country: "Bangladesh", confirmed: 100, recovered: 1, critical: 12, deaths: 2, latitude: 0.9, longitude: 9.6, lastChange: 4, lastUpdate: 4))
    }
}
