//
//  CryptocurrencyModel.swift
//  cryptoTracker
//
//  Created by Dumitru Paraschiv on 25.01.2022.
//

import Foundation

// MARK: - CryptoElement
class CryptoElement: Codable {
	let id: String
	let symbol: String
	let name: String
	let image: String
	let currentPrice: Double
	let marketCap: Int
	let marketCapRank: Int
	let fullyDilutedValuation: Int?
	let totalVolume: Double
	let high24H: Double
	let low24H: Double
	let priceChange24H: Double
	let priceChangePercentage24H: Double
	let marketCapChange24H: Double
	let marketCapChangePercentage24H: Double
	let circulatingSupply: Double
	let totalSupply: Double?
	let maxSupply: Double?
	let ath: Double
	let athChangePercentage: Double
	let athDate: String
	let atl: Double
	let atlChangePercentage: Double
	let atlDate: String
	let roi: Roi?
	let lastUpdated: String

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case symbol = "symbol"
		case name = "name"
		case image = "image"
		case currentPrice = "current_price"
		case marketCap = "market_cap"
		case marketCapRank = "market_cap_rank"
		case fullyDilutedValuation = "fully_diluted_valuation"
		case totalVolume = "total_volume"
		case high24H = "high_24h"
		case low24H = "low_24h"
		case priceChange24H = "price_change_24h"
		case priceChangePercentage24H = "price_change_percentage_24h"
		case marketCapChange24H = "market_cap_change_24h"
		case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
		case circulatingSupply = "circulating_supply"
		case totalSupply = "total_supply"
		case maxSupply = "max_supply"
		case ath = "ath"
		case athChangePercentage = "ath_change_percentage"
		case athDate = "ath_date"
		case atl = "atl"
		case atlChangePercentage = "atl_change_percentage"
		case atlDate = "atl_date"
		case roi = "roi"
		case lastUpdated = "last_updated"
	}

	init(id: String, symbol: String, name: String, image: String, currentPrice: Double, marketCap: Int, marketCapRank: Int, fullyDilutedValuation: Int?, totalVolume: Double, high24H: Double, low24H: Double, priceChange24H: Double, priceChangePercentage24H: Double, marketCapChange24H: Double, marketCapChangePercentage24H: Double, circulatingSupply: Double, totalSupply: Double?, maxSupply: Double?, ath: Double, athChangePercentage: Double, athDate: String, atl: Double, atlChangePercentage: Double, atlDate: String, roi: Roi?, lastUpdated: String) {
		self.id = id
		self.symbol = symbol
		self.name = name
		self.image = image
		self.currentPrice = currentPrice
		self.marketCap = marketCap
		self.marketCapRank = marketCapRank
		self.fullyDilutedValuation = fullyDilutedValuation
		self.totalVolume = totalVolume
		self.high24H = high24H
		self.low24H = low24H
		self.priceChange24H = priceChange24H
		self.priceChangePercentage24H = priceChangePercentage24H
		self.marketCapChange24H = marketCapChange24H
		self.marketCapChangePercentage24H = marketCapChangePercentage24H
		self.circulatingSupply = circulatingSupply
		self.totalSupply = totalSupply
		self.maxSupply = maxSupply
		self.ath = ath
		self.athChangePercentage = athChangePercentage
		self.athDate = athDate
		self.atl = atl
		self.atlChangePercentage = atlChangePercentage
		self.atlDate = atlDate
		self.roi = roi
		self.lastUpdated = lastUpdated
	}
}

// MARK: CryptoElement convenience initializers and mutators

extension CryptoElement {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(CryptoElement.self, from: data)
		self.init(id: me.id, symbol: me.symbol, name: me.name, image: me.image, currentPrice: me.currentPrice, marketCap: me.marketCap, marketCapRank: me.marketCapRank, fullyDilutedValuation: me.fullyDilutedValuation, totalVolume: me.totalVolume, high24H: me.high24H, low24H: me.low24H, priceChange24H: me.priceChange24H, priceChangePercentage24H: me.priceChangePercentage24H, marketCapChange24H: me.marketCapChange24H, marketCapChangePercentage24H: me.marketCapChangePercentage24H, circulatingSupply: me.circulatingSupply, totalSupply: me.totalSupply, maxSupply: me.maxSupply, ath: me.ath, athChangePercentage: me.athChangePercentage, athDate: me.athDate, atl: me.atl, atlChangePercentage: me.atlChangePercentage, atlDate: me.atlDate, roi: me.roi, lastUpdated: me.lastUpdated)
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
		id: String? = nil,
		symbol: String? = nil,
		name: String? = nil,
		image: String? = nil,
		currentPrice: Double? = nil,
		marketCap: Int? = nil,
		marketCapRank: Int? = nil,
		fullyDilutedValuation: Int?? = nil,
		totalVolume: Double? = nil,
		high24H: Double? = nil,
		low24H: Double? = nil,
		priceChange24H: Double? = nil,
		priceChangePercentage24H: Double? = nil,
		marketCapChange24H: Double? = nil,
		marketCapChangePercentage24H: Double? = nil,
		circulatingSupply: Double? = nil,
		totalSupply: Double?? = nil,
		maxSupply: Double?? = nil,
		ath: Double? = nil,
		athChangePercentage: Double? = nil,
		athDate: String? = nil,
		atl: Double? = nil,
		atlChangePercentage: Double? = nil,
		atlDate: String? = nil,
		roi: Roi?? = nil,
		lastUpdated: String? = nil
	) -> CryptoElement {
		return CryptoElement(
			id: id ?? self.id,
			symbol: symbol ?? self.symbol,
			name: name ?? self.name,
			image: image ?? self.image,
			currentPrice: currentPrice ?? self.currentPrice,
			marketCap: marketCap ?? self.marketCap,
			marketCapRank: marketCapRank ?? self.marketCapRank,
			fullyDilutedValuation: fullyDilutedValuation ?? self.fullyDilutedValuation,
			totalVolume: totalVolume ?? self.totalVolume,
			high24H: high24H ?? self.high24H,
			low24H: low24H ?? self.low24H,
			priceChange24H: priceChange24H ?? self.priceChange24H,
			priceChangePercentage24H: priceChangePercentage24H ?? self.priceChangePercentage24H,
			marketCapChange24H: marketCapChange24H ?? self.marketCapChange24H,
			marketCapChangePercentage24H: marketCapChangePercentage24H ?? self.marketCapChangePercentage24H,
			circulatingSupply: circulatingSupply ?? self.circulatingSupply,
			totalSupply: totalSupply ?? self.totalSupply,
			maxSupply: maxSupply ?? self.maxSupply,
			ath: ath ?? self.ath,
			athChangePercentage: athChangePercentage ?? self.athChangePercentage,
			athDate: athDate ?? self.athDate,
			atl: atl ?? self.atl,
			atlChangePercentage: atlChangePercentage ?? self.atlChangePercentage,
			atlDate: atlDate ?? self.atlDate,
			roi: roi ?? self.roi,
			lastUpdated: lastUpdated ?? self.lastUpdated
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - Roi
class Roi: Codable {
	let times: Double
	let currency: Currency
	let percentage: Double

	enum CodingKeys: String, CodingKey {
		case times = "times"
		case currency = "currency"
		case percentage = "percentage"
	}

	init(times: Double, currency: Currency, percentage: Double) {
		self.times = times
		self.currency = currency
		self.percentage = percentage
	}
}

// MARK: Roi convenience initializers and mutators

extension Roi {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(Roi.self, from: data)
		self.init(times: me.times, currency: me.currency, percentage: me.percentage)
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
		times: Double? = nil,
		currency: Currency? = nil,
		percentage: Double? = nil
	) -> Roi {
		return Roi(
			times: times ?? self.times,
			currency: currency ?? self.currency,
			percentage: percentage ?? self.percentage
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

enum Currency: String, Codable {
	case btc = "btc"
	case eth = "eth"
	case usd = "usd"
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
