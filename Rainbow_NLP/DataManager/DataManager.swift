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
    var raund: String
}

final class DataManager<T: Codable> {
    
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
    func save(_ data: T, by key: Keys) throws {
        guard let encodeData = try? encoder.encode(data) else {
            throw DataManagerError.failedEncoded("Failed encoded data, try again.")
        }
        UserDefaults.standard.set(encodeData, forKey: key.rawValue)
    }
    
    func load(by key: Keys) throws -> T {
        guard let data = UserDefaults.standard.object(forKey: key.rawValue) as? Data else {
            throw DataManagerError.failedLoading("Failed loading data, try again.")
        }
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            throw DataManagerError.failedDecoded("Failed decoded data, try again.")
        }
        return decodedData
    }
}

// MARK: - DataManagerError
enum DataManagerError: Error {
    case failedEncoded(String)
    case failedDecoded(String)
    case failedLoading(String)
}
