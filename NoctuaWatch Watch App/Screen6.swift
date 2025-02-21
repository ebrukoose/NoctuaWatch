//
//  Screen6.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 8.01.2025.
//

import SwiftUI

struct Screen6: View {
    @State private var offices: [Office] = [] // Ofis listesi
    @State private var currentIndex: Int = 0 // Mevcut ofis indeksi
    @State private var isLoading: Bool = true // Yüklenme durumu
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                // Başlık ve ofis adı
                if isLoading {
                    ProgressView(UserMessages.loadingMessage)
                        .font(.headline)
                } else if offices.isEmpty {
                    Text(UserMessages.loadingMessage)
                        .font(.headline)
                } else {
                    VStack {
                        // Geri butonu ve başlık
                        HStack() {
                            NavigationLink(destination: Screen3()){
                                
                                    
                                    Image(systemName: "arrow.backward")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15)) // Simgeyi küçültme
                                        .frame(width: 10, height: 10) // Tamamen sola hizalama
                                      
                                
                            }.buttonStyle(.plain)
                            
                            // Mevcut ofis adı
                            Text(offices[currentIndex].rooms[1].name)
                                                       .font(.subheadline)
                                                       .foregroundColor(.black)
                                                       .multilineTextAlignment(.center)
                                                       .lineLimit(1)
                                                       .minimumScaleFactor(0.5)
                                                       .frame(maxWidth: .infinity) // Bu, başlık kısmının genişlemesine izin verir

                            
                            // Building iconu
                                  Image(systemName: "line.3.horizontal")
                                 .foregroundColor(.black)
                                  .font(.system(size: 18)) // Simgeyi küçültme
                                .frame(width: 30, height: 30) // Sabit genişlik ve yükseklik
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                           
                        
                    }
                    
                    // Alarm listesi (3 sola, 3 sağa hizalı)
                    VStack(spacing: 10) {
                        HStack(alignment: .top, spacing: 10) {
                            // Sol sütun
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(0..<3, id: \.self) { index in
                                    let alarm = offices[currentIndex].rooms[1].alarms[index]
                                    HStack {
                                        Rectangle()
                                            .fill(getColor(for: alarm.name))
                                            .frame(width:6, height: 18)
                                            .cornerRadius(2)
                                        Text("\(alarm.value) \(alarm.name)")
                                            .font(.body)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                        Spacer()
                                    }
                                }
                            }
                            
                            // Sağ sütun
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(3..<6, id: \.self) { index in
                                    let alarm = offices[currentIndex].rooms[1].alarms[index]
                                    HStack {
                                        Rectangle()
                                            .fill(getColor(for: alarm.name))
                                            .frame(width:6, height: 18)
                                            .cornerRadius(2)
                                        Text("\(alarm.value) \(alarm.name)")
                                            .font(.body)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                    // Önceki ve Sonraki düğmeleri
                    HStack(spacing:30) {
                        NavigationLink(destination: Screen5()){
                            VStack{
                                Text(ButtonNames.previousButtonName)
                                    .font(.body)
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.shade3)
                                    .padding()
                                    .frame(width: 60, height: 20)
                                    .background(.colorWhite)
                                    .cornerRadius(5)
                            }.padding(.top,0)
                            
                        }.buttonStyle(.plain)
                        
                        
                            VStack {
                                Text(ButtonNames.nextButtonName)
                                    .font(.body)
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .frame(width: 60, height: 20)
                                    .background(.shade3)
                                    .cornerRadius(5)
                            }
                            .padding(.top, 0)
                        
                    }
                }}
            .padding()
            .background(Color.white) // Arka plan beyaz
            .onAppear {
                APIService.shared.fetchOffices { fetchedOffices in
                    self.offices = fetchedOffices
                    self.isLoading = false
                }
            }
            
         
           
            }
        }
        
    }
    
    // Alarm isimlerine göre renk döndürme fonksiyonu
    private func getColor(for alarmName: String) -> Color {
        switch alarmName {
        case "Fine": return .green
        case "Connection": return .blue
        case "Critical": return .red
        case "Warning": return .yellow
        case "Alert": return .orange
        case "Passive": return .gray
        default: return .black
        }
    }

#Preview {
    Screen6()
}
