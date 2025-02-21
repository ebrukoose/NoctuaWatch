//
//  APIService.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 8.01.2025.
//

import Foundation


class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchOffices(completion: @escaping ([Office]) -> Void) {
        let alarmCategories = ["Fine", "Connection", "Critical", "Warning", "Alert", "Passive"]
        
        let offices: [Office] = [
                Office(
                    id: UUID(),
                    name: "Eskişehir Ofis",
                    alarms: generateAlarms(for: alarmCategories),
                    rooms: [
                        Room(id: UUID(), name: "System Room", alarms: generateAlarms(for: alarmCategories)),
                        Room(id: UUID(), name: "Service Room", alarms: generateAlarms(for: alarmCategories))
                    ]
                ),
                Office(
                    id: UUID(),
                    name: "İstanbul Ofis",
                    alarms: generateAlarms(for: alarmCategories),
                    rooms: [
                        Room(id: UUID(), name: "System Room", alarms: generateAlarms(for: alarmCategories)),
                        Room(id: UUID(), name: "Service Room", alarms: generateAlarms(for: alarmCategories))
                    ]
                ),
                Office(
                    id: UUID(),
                    name: "Ankara Ofis",
                    alarms: generateAlarms(for: alarmCategories),
                    rooms: [
                        Room(id: UUID(), name: "System Room", alarms: generateAlarms(for: alarmCategories)),
                        Room(id: UUID(), name: "Service Room", alarms: generateAlarms(for: alarmCategories))
                    ]
                )
            ]
        
        // Simülasyon için gecikme ekleniyor
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(offices)
        }
    }
    
    private func generateAlarms(for categories: [String]) -> [Alarm] {
        return categories.map { category in
            Alarm(id: UUID(), name: category, value: Int.random(in: 1...20))
        }
    }
}

