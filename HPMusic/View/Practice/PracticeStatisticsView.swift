//
//  PracticeStatisticsView.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

import SwiftUI

struct PracticeStatisticsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("训练统计模块")
            }
            
            .navigationTitle("训练统计")
        }
    }
}

struct PracticeStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeStatisticsView()
    }
}
