
//
//  TableHeaderView.swift
//  Covid19_Stat
//
//  Created by S. M. Hasibur Rahman on 5/12/20.
//  Copyright © 2020 S. M. Hasibur Rahman. All rights reserved.
//

import SwiftUI

struct TableHeaderView: View {
    var body: some View {
        HStack {
            Text("Country")
                .fontWeight(.bold)
                .frame(alignment: .leading)
                .padding(.leading,10)
            Spacer()
            Text("Conf.")
                .fontWeight(.bold)
                .frame(alignment: .leading)
            Spacer()
            Text("Death")
                .fontWeight(.bold)
                .frame(alignment: .leading)
            Spacer()
            Text("Recovered")
                .fontWeight(.bold)
                .frame(alignment: .leading)
                .padding(.trailing,10)
        }.background(Color.gray)
    }
}

struct TableHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TableHeaderView()
    }
}
