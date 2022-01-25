//
//  ContentView.swift
//  cryptoTracker
//
//  Created by Dumitru Paraschiv on 25.01.2022.
//

import SwiftUI

struct MainView: View {
	@StateObject var vm = MainViewModel()
	
	var body: some View {
		ZStack {
			VStack {
				List(vm.items, id: \.id) { item in
					HStack {
						Text(item.symbol)
							.font(.system(.body, design: .rounded).weight(.semibold))
							.foregroundColor(Color.black)
						
						Spacer()
						
						Text(item.price)
							.font(.system(.body, design: .rounded).weight(.light))
							.foregroundColor(Color.black)
					}
				}
			}
			.onAppear {
				vm.fetchData()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
