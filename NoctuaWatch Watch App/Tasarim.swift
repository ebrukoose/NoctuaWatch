//
//  Tasarım.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 28.01.2025.
//
/*

import SwiftUI

struct Tasarim: View {
    var body: some View {
        HStack {
            // Sol ikon
            Image(systemName: "line.3.horizontal.decrease")
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
                .frame(width: 50, height: 8)
        }
        .padding()
        .background(Color(.white)) // Arka plan rengi düzeltildi
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4)
        .padding(.horizontal)
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
    
    // **SwiftUI Preview**
    struct Tasarim_Previews: PreviewProvider {
        static var previews: some View {
            Tasarim()
                .previewLayout(.sizeThatFits)
        }
    }
}
*/
