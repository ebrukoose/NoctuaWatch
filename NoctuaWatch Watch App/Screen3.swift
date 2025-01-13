//
//  Screen3.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 6.01.2025.
//

import SwiftUI

struct Screen3: View {
    @State private var randomOffice: Office? // Rastgele seçilecek ofis
    @State private var isLoading = true // Yüklenme durumu
    
    var body: some View {
        
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
                if let office = randomOffice {
                     
                        VStack(spacing: 10) {
                            Image(systemName: "building.2") 
                                .font(.body)
                                .foregroundColor(.black)
                            VStack(spacing: 3) {
                                Text(office.name) // Rastgele ofis adı
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: 600)
                        .frame(height: 60)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    }
                 else if isLoading {
                    ProgressView("Yükleniyor...")
                        .font(.body)
                        .foregroundColor(.gray)
                } else {
                    Text("Ofis bulunamadı.")
                        .font(.body)
                        .foregroundColor(.red)
                }

               
                VStack {
                    HStack(spacing: 10) {
                        VStack {
                            Image(systemName: "desktopcomputer")
                                .font(.body)
                                .foregroundColor(.black)
                            Text("Monitor")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: 500)
                        .frame(height: 60)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)

                        NavigationLink(destination: Screen4()) {
                                                   VStack {
                                                       Image(systemName: "circle.dashed")
                                                           .font(.body)
                                                           .foregroundColor(.black)
                                                       Text("Summary")
                                                           .font(.body)
                                                           .foregroundColor(.black)
                                                   }
                                                   .frame(maxWidth: 500)
                                                   .frame(height: 60)
                                                   .background(Color.white)
                                                   .cornerRadius(12)
                                                   .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                                               }
                    }
                }

                Spacer()
            }
            .padding()
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                fetchRandomOffice()
            }
        }
    

    // Rastgele bir ofis getirme işlevi
    func fetchRandomOffice() {
        isLoading = true
        APIService.shared.fetchOffices { offices in
            if !offices.isEmpty {
                randomOffice = offices.randomElement() // Rastgele bir ofis seçiliyor
            }
            isLoading = false
        }
    }
}


#Preview {
    Screen3()
}
