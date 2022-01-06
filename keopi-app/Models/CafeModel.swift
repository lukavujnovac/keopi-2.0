//
//  CafeModel.swift
//  keopi-app
//
//  Created by Luka Vujnovac on 06.01.2022..
//

import Foundation

struct CafeModel: Hashable, Codable, Identifiable {
    var id: String
    let address: String
    let billiards: Bool
    let bio: String
    let cityId: String
    let name: String
    let capacity: String
    let betting: Bool
    let latitude: Float
    let longitude: Float
    let areaId: String
    let location: String
    let music: String
    let dart: Bool
    let startingWorkTime: Int
    let age: String
    let smoking: Bool
    let picture: String
    let endingWorkTime: Int
    let terrace: Bool
    let hookah: Bool
    let playground: Bool
    let instagram: String
    let facebook: String
}

struct CafeListModel: Hashable, Codable {
    static let cafes: [CafeModel] 
    let currentPage: Int
    let totalPages: Int
    let pageSize: Int
    let hasPrevious: Bool
    let hasNext: Bool
}
