//
//  Model.swift
//  NoctuaWatch Watch App
//
//  Created by EBRU KÖSE on 8.01.2025.
//

import Foundation

struct Room: Identifiable {
    let id: UUID
    let name: String
    let alarms: [Alarm]
}
struct Office: Identifiable{
    let id: UUID
    let name: String
    let alarms: [Alarm]
    let rooms: [Room]
}

struct Alarm: Identifiable, Codable {
    let id: UUID
    let name: String
    let value: Int
}
