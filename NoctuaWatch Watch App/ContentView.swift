//
//  ContentView.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 6.01.2025.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Logo and Title
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15) // Logo boyutu
                    Text("Noctua")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                }
                .padding(.top, 10)

                // Instruction Card
                NavigationLink(destination: Screen2()) {
                    VStack(spacing: 10) {
                        Image( "nearby_error")
                            .font(.body)
                            .foregroundColor(.gray)
                        VStack(spacing: 3) {
                            Text("Use your mobile device")
                                .minimumScaleFactor(0.7)
                                .font(.body)
                                .foregroundColor(.black)
                            Text("to select areas.")
                                .minimumScaleFactor(0.7)
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: 600)
                    .frame(height: 60) // Boyutu belirledim
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                }

                // Buttons (Disabled)
                VStack{
                    HStack(spacing: 10) {
                        VStack {
                            Image(systemName: "desktopcomputer")
                                .font(.body)
                                .foregroundColor(.gray)
                            Text("Monitor")
                                .font(.body)
                                .foregroundColor(.gray)
                        }.frame(maxWidth: 500)
                            .frame(height:60)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                        VStack {
                            Image(systemName:"circle.dashed" /*"arrow.clockwise"*/)
                                .font(.body)
                                .foregroundColor(.gray)
                            Text("Summary")
                                
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: 500)
                        .frame(height:60)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    }
                    .disabled(true)
                }

                Spacer()
            }
            .padding()
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    ContentView()
}


