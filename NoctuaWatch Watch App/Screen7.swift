//
//  Screen7.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 22.01.2025.
//


import SwiftUI
import WatchConnectivity

struct Screen7: View {
    @State private var showDirectSensors = true
    @State private var rotationAngle: Double = 0
    @State private var navigateToScreen8: Bool = false
    var body: some View {
        
        NavigationView {
            VStack(spacing: 10) {
                // Dönen Çark
                ZStack {
                    Circle()
                        .hidden()
                    //.stroke(Color.gray.opacity(0.5), lineWidth: 2)
                        .frame(width: 200, height: 200)
                    
                    ForEach(0..<4) { index in
                        let angle = Double(index) * 90 // Her buton için açıyı hesapla
                        let radius: CGFloat = 50 // Çemberin yarıçapı
                        let xOffset = cos(angle * .pi / 180) * radius // X pozisyonu
                        let yOffset = sin(angle * .pi / 180) * radius // Y pozisyonu
                        
                        Button(action: {
                            // Çarkı döndür
                            rotationAngle += 90
                            
                            // Sensör gösterme veya gizleme
                            if index % 2 == 0 {
                                showDirectSensors = true
                                navigateToScreen8 = false
                            } else {
                                showDirectSensors = false
                                navigateToScreen8 = true // çizgili butonuna basıldığında Screen8'ye git
                            }
                        }) {
                            VStack {
                                
                                Image(systemName: index % 2 == 0 ? "speedometer" : "line.3.horizontal.decrease")
                                    .font(.title)
                                    .foregroundColor(index % 2 == 0 ? .white : .white)
                                
                                    .font(.caption)
                                    .foregroundColor(index % 2 == 0 ? .white : .white)
                            }
                        }
                        .frame(width: 50, height:50) // Buton boyutu
                        .background(Color(.darkGray))
                        .clipShape(Capsule())
                        // .shadow(color: .white.opacity(0.2), radius: 2, x: 0, y: 2)
                        .position(x: 100 + xOffset, y: 100 + yOffset) // Çemberin merkezine göre konumlandır
                    }
                }
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(rotationAngle)) // Çarkın dönüş açısını uygula
                .animation(.easeInOut(duration: 0.5), value: rotationAngle) // Animasyon
                
                // Alt Kısım
                if showDirectSensors {
                    
                    //
                    
                    HStack {
                        Text("Direct Sensors")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        
                        Image("speed")
                            .foregroundColor(.gray)
                            .padding()
                            .background(Circle())
                        
                    }  .background(.white)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    
                    
                    //
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(0..<2, id: \.self) { _ in
                                SensorCardView()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                NavigationLink(destination: Screen8(), isActive: $navigateToScreen8) {
                                    EmptyView()
                }.hidden().frame(width: 0, height: 0)
                   
            }
            .background(Color.white).edgesIgnoringSafeArea(.all)
        }
    }
}



struct SensorCardView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "thermometer")
                        .foregroundColor(.gray)
                    Text("Temperature 1")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                Text("İki Eylül Kampüsü / Office")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("25.9")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                Text("%RH")
                    .font(.footnote)
                    .foregroundColor(.gray)
                ProgressBarViewThird(progress: 0.5)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct ProgressBarViewThird: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 4)
                    .cornerRadius(2)
                    .foregroundColor(Color.gray.opacity(0.3))
                Rectangle()
                    .frame(width: geometry.size.width * progress, height: 4)
                    .cornerRadius(2)
                    .foregroundColor(.orange)
            }
        }
        .frame(height: 4)
    }
}

#Preview {
    Screen7()
}

