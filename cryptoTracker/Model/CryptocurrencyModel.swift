//
//  CryptocurrencyModel.swift
//  cryptoTracker
//
//  Created by Dumitru Paraschiv on 25.01.2022.
//

import Foundation

// MARK: - CryptoElement
class CryptoElement: Codable, Identifiable {
	let symbol: String
	let price: String

	enum CodingKeys: String, CodingKey {
		case symbol = "symbol"
		case price = "price"
	}

	init(symbol: String, price: String) {
		self.symbol = symbol
		self.price = price
	}
}

// MARK: CryptoElement convenience initializers and mutators

extension CryptoElement {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(CryptoElement.self, from: data)
		self.init(symbol: me.symbol, price: me.price)
	}

	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		guard let data = json.data(using: encoding) else {
			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		}
		try self.init(data: data)
	}

	convenience init(fromURL url: URL) throws {
		try self.init(data: try Data(contentsOf: url))
	}

	func with(
		symbol: String? = nil,
		price: String? = nil
	) -> CryptoElement {
		return CryptoElement(
			symbol: symbol ?? self.symbol,
			price: price ?? self.price
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

typealias Crypto = [CryptoElement]

extension Array where Element == Crypto.Element {
	init(data: Data) throws {
		self = try newJSONDecoder().decode(Crypto.self, from: data)
	}

	init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		guard let data = json.data(using: encoding) else {
			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		}
		try self.init(data: data)
	}

	init(fromURL url: URL) throws {
		try self.init(data: try Data(contentsOf: url))
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
	let decoder = JSONDecoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		decoder.dateDecodingStrategy = .iso8601
	}
	return decoder
}

func newJSONEncoder() -> JSONEncoder {
	let encoder = JSONEncoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		encoder.dateEncodingStrategy = .iso8601
	}
	return encoder
}

