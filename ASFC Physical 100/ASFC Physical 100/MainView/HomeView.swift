//
//  HomeView.swift
//  ASFC Physical 100
//
//  Created by Jack Liu on 4/6/25.
//

import SwiftUI




struct HomeView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("ASFC Physical 100")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            ClubInfoView()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}










    
    
#Preview {
    HomeView()
}
