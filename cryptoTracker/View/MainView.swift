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
		VStack {
			List(vm.items) { item in
				Text(item.symbol)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
