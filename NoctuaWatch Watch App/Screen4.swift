//
//  Screen4.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 8.01.2025.
//


import SwiftUI

struct Screen4: View {
    @State private var offices: [Office] = [] // Ofis listesi
    @State private var currentIndex: Int = 0 // Mevcut ofis indeksi
    @State private var isLoading: Bool = true // Yüklenme durumu
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                // Başlık ve ofis adı
                if isLoading {
                    ProgressView("Loading...")
                        .font(.headline)
                } else if offices.isEmpty {
                    Text("No offices available.")
                        .font(.headline)
                } else {
                    VStack {
                        // Geri butonu ve başlık
                        HStack() {
                            NavigationLink(destination: Screen3()){
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15)) // Simgeyi küçültme
                                .frame(width: 10, height: 10) }
                            .buttonStyle(.plain)
                            // Tamamen sola hizalama
                            // Mevcut ofis adı
                            Text(offices[currentIndex].name)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .frame(maxWidth: .infinity) // Bu, başlık kısmının genişlemesine izin veriyor
                            // Building iconu
                            Image("business")
                                .foregroundColor(.black)
                                .font(.system(size: 18)) // Simgeyi küçültme yaptım
                                .frame(width: 30, height: 30) // Sabit genişlik ve yükseklik verdim
                        }
                        .padding()
                        .frame(maxWidth: .infinity) }// HStack'in tamamının ekran genişliğini kullanmasına izin verdim
                    
                    // Alarm listesi (3 sola, 3 sağa hizalı)
                    VStack(spacing: 10) {
                        HStack(alignment: .top, spacing: 10) {
                            // Sol sütun
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(0..<3, id: \.self) { index in
                                    let alarm = offices[currentIndex].alarms[index]
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
                                        Spacer()}}}
                            // Sağ sütun
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(3..<6, id: \.self) { index in
                                    let alarm = offices[currentIndex].alarms[index]
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
                                        Spacer()}}}}}
                    
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                    // Önceki ve Sonraki düğmeleri
                    HStack(spacing:30) {
                        NavigationLink(destination: Screen6()){
                            VStack{
                                Text("Previous")
                                    .font(.body)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 60, height: 20)
                                    .background(.colorWhite)
                                    .cornerRadius(5)
                            }.padding(.top, 0)
                        }.buttonStyle(.plain)
                        NavigationLink(destination: Screen5()){
                            VStack {
                                Text("Next")
                                    .font(.body)
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .frame(width: 60, height: 20)
                                    .background(.shade3)
                                .cornerRadius(5)}
                            .padding(.top, 0)
                        }.buttonStyle(.plain)
                    }
                }
            }
            .padding()
            .background(Color.white) // Arka plan beyaz
            .onAppear {
                APIService.shared.fetchOffices { fetchedOffices in
                    self.offices = fetchedOffices
                    self.isLoading = false}}}}}
         
    // Alarm isimlerine göre renk döndürme fonksiyonu
private func getColor(for alarmName: String) -> Color {
    switch alarmName {
    case "Fine": return .colorGreen
    case "Connection": return .colorBlue
    case "Critical": return .colorRed
    case "Warning": return .colorYellow
    case "Alert": return .colorOrange
    case "Passive": return .colorBrown
        default: return .black}}
    



#Preview {
    Screen4()
}

