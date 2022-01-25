//
//  CryptocurrencyModel.swift
//  cryptoTracker
//
//  Created by Dumitru Paraschiv on 25.01.2022.
//

import Foundation

// MARK: - WelcomeElement
struct CryptocurrencyElement: Codable {
	let id = UUID()
	let symbol, price: String
}

typealias Crypto = [CryptocurrencyElement]
