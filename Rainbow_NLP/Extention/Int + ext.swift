//
//  Int + ext.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 18.11.23.
//

import Foundation

extension Int {
    func toStringTimeFormat() -> String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
