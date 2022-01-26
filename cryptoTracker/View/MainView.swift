//
//  ContentView.swift
//  cryptoTracker
//
//  Created by Dumitru Paraschiv on 25.01.2022.
//

import SwiftUI

struct MainView: View {
	@StateObject var vm = MainViewModel()
	@State var searchText = ""
	
	var body: some View {
		NavigationView {
			ScrollView {
				ForEach(vm.items.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }), id: \.id) { item in
					NavigationLink {
						NavigationItem(item: item)
					} label: {
						HStack {
							AsyncImage(url: URL(string: item.image)) { phase in
								switch phase {
								case .empty:
									ProgressView()
								case .success(let image):
									image
										.resizable()
										.scaledToFit()
										.shadow(color: Color.black, radius: 1, x: 1, y: 1)
										.shadow(color: Color.white, radius: 1, x: -1, y: -1)
								case .failure:
									Image(systemName: "photo")
								@unknown default:
									EmptyView()
								}
							}
							.frame(width: 20, height: 20)
							Text(item.name)
							Spacer()
							Text(String(format: "%.2f", item.currentPrice) + " $")
						}
						.font(.system(.title3, design: .rounded).weight(.regular))
						.foregroundColor(Color.black)
						.padding()
						.background(Color.white)
						.cornerRadius(20)
						.shadow(color: Color.black.opacity(0.1), radius: 3, x: 3, y: 3)
						.padding(.horizontal)
						.padding(.vertical, 2)
					}
				}
			}
			.navigationTitle("Crypto Prices")
			.searchable(text: $searchText)
		}
		.background(Color.purple)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}

struct NavigationItem: View {
	let item: CryptoElement
	
	var body: some View {
		VStack {
			AsyncImage(url: URL(string: item.image)) { phase in
				switch phase {
				case .empty:
					ProgressView()
				case .success(let image):
					image
						.resizable()
						.scaledToFit()
						.shadow(color: Color.black, radius: 1, x: 1, y: 1)
						.shadow(color: Color.white, radius: 1, x: -1, y: -1)
				case .failure:
					Image(systemName: "photo")
				@unknown default:
					EmptyView()
				}
			}
			.frame(width: 120, height: 120)
			Group {
				Text(item.name)
				Text(String(format: "%.2f", item.currentPrice) + " $")
			}
			.font(.system(.title3, design: .rounded).weight(.medium))
			.foregroundColor(Color.black)
			.padding(.bottom, 30)
			
			HStack {
				Spacer()
				VStack {
					HStack {
						Text("Market Cap Rank")
							.font(.system(.body, design: .rounded).weight(.medium))
						Spacer()
						Text("#\(item.marketCapRank)")
							.font(.system(.footnote, design: .rounded).weight(.medium))
					}
					HStack {
						Text("24H High")
							.font(.system(.body, design: .rounded).weight(.medium))
						Spacer()
						Text(String(format: "%.2f", item.high24H) + " $")
							.font(.system(.footnote, design: .rounded).weight(.medium))
					}
					HStack {
						Text("24H Low")
							.font(.system(.body, design: .rounded).weight(.medium))
						Spacer()
						Text(String(format: "%.2f", item.low24H) + " $")
							.font(.system(.footnote, design: .rounded).weight(.medium))
					}
					HStack {
						Text("24H Low")
							.font(.system(.body, design: .rounded).weight(.medium))
						Spacer()
						Text(String(format: "%.2f", item.low24H) + " $")
							.font(.system(.footnote, design: .rounded).weight(.medium))
					}
					HStack {
						Text("Market Cap")
							.font(.system(.body, design: .rounded).weight(.medium))
						Spacer()
						Text("\(item.marketCap) $")
							.font(.system(.footnote, design: .rounded).weight(.medium))
					}
					HStack {
						Text("Total volume")
							.font(.system(.body, design: .rounded).weight(.medium))
						Spacer()
						Text(String(format: "%.2f", item.totalVolume) + " $")
							.font(.system(.footnote, design: .rounded).weight(.medium))
					}
				}
				Spacer()
			}
		}
		.foregroundColor(Color.black)
		.padding()
	}
}
