//
//  Screen2.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 6.01.2025.
//

import SwiftUI

struct Screen2: View {
    @State private var rotation: Double = 0
    @State private var navigateToScreen3 = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Arka plan rengi
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    // Logo ve Başlık
                    HStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20) // Logo boyutu
                        
                        Text("Noctua")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
                    
                    // Dönme animasyonu olan resim
                    Image("circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .rotationEffect(.degrees(rotation)) // Dönüş etkisi
                        .onAppear {
                            // Sonsuz döngüde animasyonu başlatma
                            withAnimation(.linear(duration: 3)) {
                                rotation = 360
                            }
                            // 3 saniye sonra Screen3'e yönlendirme
                           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                navigateToScreen3 = true
                            }
                        }
                    
                    // Diğer metin alanı
                    Text("Checking selected areas")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                }
                .padding()
            }
            .background(
                NavigationLink("", destination: Screen3(), isActive: $navigateToScreen3)
                    .opacity(0) // Görünmeyen link
            )
        }
    }
}

#Preview {
    Screen2()
}
