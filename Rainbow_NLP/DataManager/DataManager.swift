//
//  DataManager.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 16.11.23.
//

import Foundation

struct MocUser: Codable {
    var name: String
    var age: Int
}

// some Codable or <T>
protocol DataManager {
    func save(_ data: [MocUser], by key: DataManagerImp.Keys)
    func load(by key: DataManagerImp.Keys) -> [MocUser]
}

class DataManagerImp: DataManager {
    // MARK: - Keys for UserDefaults
    enum Keys: String {
        case userSettingData
        case userResultData
    }
    
    // MARK: - Dependencies
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    // MARK: - init(_:)
    init(
        decoder: JSONDecoder = .init(),
        encoder: JSONEncoder = .init()
    ) {
        self.decoder = decoder
        self.encoder = encoder
    }
    
    // MARK: - Public Methods
    func save(_ data: [MocUser], by key: Keys) {
        guard let encodeData = try? encoder.encode(data) else {
            print("Failed encoded data, try again.")
            return
        }
        UserDefaults.standard.set(encodeData, forKey: key.rawValue)
    }
    
    func load(by key: Keys) -> [MocUser] {
        guard let data = UserDefaults.standard.object(forKey: key.rawValue) as? Data else {
            print("Failed loading data, try again.")
            return []
        }
        
        guard let decodedData = try? decoder.decode([MocUser].self, from: data) else {
            print("Failed decoded data, try again.")
            return []
        }
        return decodedData
    }
}
