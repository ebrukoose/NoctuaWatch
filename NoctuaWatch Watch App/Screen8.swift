//
//  Screen8.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 28.01.2025.
//



import SwiftUI
import WatchConnectivity

struct Screen8: View {
    @State private var showAreasBelow = true
    @State private var rotationAngle: Double = 0
    @State private var navigateToScreen7 = false // Yeni durum değişkeni

    var body: some View {
        
        NavigationView {
            VStack(spacing: 10) {
                // Dönen Çark
                ZStack {
                    Circle()
                        .hidden()
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
                                showAreasBelow = false
                                navigateToScreen7 = true // Speedometer butonuna basıldığında Screen7'ye git
                            } else {
                                showAreasBelow = true
                                navigateToScreen7 = false
                            }
                        }) {
                            VStack {
                                Image(systemName: index % 2 == 0 ? "speedometer" : "line.3.horizontal.decrease")
                                    .font(.title)
                                    .foregroundColor(index % 2 == 0 ? .white : .white)
                            }
                        }
                        .frame(width: 50, height: 50) // Buton boyutu
                        .background(Color(.darkGray))
                        .clipShape(Capsule())
                        .position(x: 100 + xOffset, y: 100 + yOffset) // Çemberin merkezine göre konumlandır
                    }
                }
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(rotationAngle)) // Çarkın dönüş açısını uygula
                .animation(.easeInOut(duration: 0.5), value: rotationAngle) // Animasyon
                
                // Alt Kısım
                if showAreasBelow {
                    HStack {
                        Text("Areas Below")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Image("sort")
                            .foregroundColor(.gray)
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(0..<2, id: \.self) { _ in
                                SensorCardViewSecond()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                NavigationLink(destination: Screen7(), isActive: $navigateToScreen7) {
                    EmptyView()
            }.hidden().frame(width: 0, height: 0)
            }
            .background(Color.white).edgesIgnoringSafeArea(.all)
        }
    }
}



struct SensorCardViewSecond: View {
    var body: some View {
        
        HStack {
            // Sol ikon
            Image("storage")
                .font(.title3)
                .foregroundColor(.gray)
            
            // Orta Başlık
            Text("Service Room")
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            // Sağdaki sayı
            Text("15 ")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // İlerleme çubuğu
            ProgressBarViewfourth(progress: 0.75) // %75 dolu bir ilerleme çubuğu
                .frame(width: 30, height: 10)
        }
        .padding()
        .background(Color(.white)) // Arka plan rengi düzeltildi
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4)
        .padding(.horizontal)
        .frame(width:200, height: 70)
        
    }
}

struct ProgressBarViewSecond: View {
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


// 🔹 **Renkli İlerleme Çubuğu**
struct ProgressBarViewfourth: View {
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 8)
                    .foregroundColor(Color.gray.opacity(0.3)) // Arka plan
                
                HStack(spacing: 0) {
                    Color.blue.frame(width: geometry.size.width * 0.25) // %25 Mavi
                    Color.red.frame(width: geometry.size.width * 0.25) // %25 Kırmızı
                    Color.orange.frame(width: geometry.size.width * 0.50) // %50 Turuncu
                }
                .cornerRadius(4)
                .frame(width: geometry.size.width * progress) // Progres oranı kadar dolsun
            }
        }
    }
}
#Preview {
    Screen8()
}

