//
//  RecentView.swift
//  Covid19_Stat
//
//  Created by S. M. Hasibur Rahman on 5/12/20.
//  Copyright © 2020 S. M. Hasibur Rahman. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    @ObservedObject var fetchObj = CovidFetchRequest()
    var body: some View {
        Text("\(fetchObj.totalCount.confirmed)")
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
