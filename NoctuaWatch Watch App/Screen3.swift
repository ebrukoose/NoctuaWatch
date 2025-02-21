//
//  Screen3.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 6.01.2025.
//


import SwiftUI

struct Screen3: View {
    @State private var randomOffice: Office? // Rastgele seçilecek ofis
    @State private var offices: [Office] = [] // Ofisler dizisi
    @State private var isLoading = true // Yüklenme durumu
    @State private var index = 0 // Ofis dizisinde seçilen index
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
            if let office = offices.indices.contains(index) ? offices[index] : nil {
                HStack {
                    Button(action: {
                        // Sol ok butonuna basıldığında ofis listesinin bir öncekine geç
                        if index > 0 {
                            index -= 1
                        }
                    }) {
                        Image("arrow_backward")
                            .foregroundColor(.black)
                            .font(.system(size: 15)) // Simgeyi küçültme
                            .frame(width: 10, height: 10)
                    }.buttonStyle(.plain)

                    VStack(spacing: 10) {
                        Image("business")
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
                    
                    Button(action: {
                        // Sağ ok butonuna basıldığında ofis listesinin bir sonrakine geç
                        if index < offices.count - 1 {
                            index += 1
                        }
                    }) {
                        Image("arrow_forward")
                            .foregroundColor(.black)
                            .frame(width: 5, height: 5)
                    }.buttonStyle(.plain)
                }
                
            } else if isLoading {
                ProgressView(UserMessages.loadingMessage)
                    .font(.body)
                    .foregroundColor(.gray)
            } else {
                Text(
                    UserMessages.noOfficeMessage)
                    .font(.body)
                    .foregroundColor(.red)
            }

            VStack {
                HStack(spacing: 10) {
                    NavigationLink(destination: Screen7()) {
                        VStack {
                            Image("monitor")
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
                    }

                    NavigationLink(destination: Screen4()) {
                        VStack {
                            Image("data_usage")
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
            fetchOffices()
        }
    }

    // Ofisleri çekme işlevi
    func fetchOffices() {
        isLoading = true
        APIService.shared.fetchOffices { fetchedOffices in
            if !fetchedOffices.isEmpty {
                offices = fetchedOffices
                randomOffice = offices.first // İlk ofisi seçiyoruz
            }
            isLoading = false
        }
    }
}

#Preview {
    Screen3()
}

