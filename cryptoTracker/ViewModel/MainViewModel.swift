//
//  MainViewModel.swift
//  cryptoTracker
//
//  Created by Dumitru Paraschiv on 25.01.2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
	
	@Published var items = Crypto()
	
	init() {
		fetchData()
	}
	
	func fetchData() {
		let api = "https://api.binance.com/api/v3/ticker/price"
		guard let url = URL(string: api) else { return }
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			do {
				if let data = data {
					let result = try JSONDecoder().decode(Crypto.self, from: data)
					DispatchQueue.main.async {
						self.items = result
						print(result)
					}
				} else {
					print("No data")
				}
			} catch (let error) {
				print(error.localizedDescription)
			}
		}.resume()
	}
}

