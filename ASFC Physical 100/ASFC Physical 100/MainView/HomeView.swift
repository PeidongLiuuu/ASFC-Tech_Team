//
//  HomeView.swift
//  ASFC Physical 100
//
//  Created by Jack Liu on 4/6/25.
//

import SwiftUI




//struct HomeView: View {
//    var body: some View {
//        
//        // Header
//        VStack {
//            HStack {
//                Text("ASFC Physical 100")
//                    .font(.largeTitle)
//                    .bold()
//                
//                Spacer()
//                        .frame(width: 18)
//                
//                Image(systemName: "person.crop.circle")
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .foregroundColor(.gray)
//            }
//            .padding()
//            
//            
//            // Middle Section for real time
//            ClubInfoView()
//                .frame(width: 400, height: 300)
//                .padding()
//        }
//        .frame(maxWidth: .infinity, alignment: .topLeading)
//        
//        Spacer()
//        
//        VStack {
//            HStack(spacing: 16) {
//                // Attendance Button
//                Button(action: {
//                    print("Attendance button was tapped!")
//                }) {
//                    Text("Attendance")
//                        .frame(width: 100, height: 50)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(12)
//                }
//
//                // Event Schedule Button
//                Button(action: {
//                    print("Event Schedule button was tapped!")
//                }) {
//                    Text("Event Schedule")
//                        .frame(width: 100, height: 50)
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(12)
//                        //.font(.jockyone)
//                }
//            }
//            .padding()
//        }
//
//        
//        Spacer()
//        
//        HStack(spacing: 20) {
//            Link(destination: URL(string: "https://www.instagram.com/yourclubhandle")!) {
//                Image("ins-logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 40, height: 40)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding(6)
//            }
//
//            Link(destination: URL(string: "https://www.yourclubwebsite.com")!) {
//                Image("link-logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 40, height: 40)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding(6)
//                
//            }
//        }
//        .padding()
//        
//        
//    }
//}


struct HomeView: View {
    var body: some View {
        ZStack {
            // 🟤 Background
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color(red: 0.1, green: 0.1, blue: 0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                
                // 🔴 Header
                HStack {
                    Text("ASFC Physical 100")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // 🔶 Club Info Card (Already styled like a card)
                ClubInfoView()
                    .frame(width: 400, height: 300)
                    .padding()
                
                // 🔵 Action Buttons
                HStack(spacing: 16) {
                    Button(action: {
                        print("Attendance button tapped")
                    }) {
                        Text("Attendance")
                            .fontWeight(.bold)
                            .frame(width: 130, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: .red.opacity(0.6), radius: 6, x: 0, y: 3)
                    }

                    Button(action: {
                        print("Event Schedule button tapped")
                    }) {
                        Text("Event Schedule")
                            .fontWeight(.bold)
                            .frame(width: 130, height: 50)
                            .background(Color.orange)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(color: .orange.opacity(0.6), radius: 6, x: 0, y: 3)
                    }
                }
                .padding(.top, 10)

                Spacer()

                // 🟣 Social Media Links
                HStack(spacing: 20) {
                    Link(destination: URL(string: "https://www.instagram.com/yourclubhandle")!) {
                        Image("ins-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .white.opacity(0.3), radius: 4, x: 0, y: 2)
                    }

                    Link(destination: URL(string: "https://www.yourclubwebsite.com")!) {
                        Image("link-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .white.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.bottom)
            }
        }
    }
}








    
    
#Preview {
    HomeView()
}
