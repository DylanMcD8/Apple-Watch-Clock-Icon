//
//  ContentView.swift
//  Clock Icon Watch App
//
//  Created by Dylan McDonald on 4/4/24.
//

import SwiftUI

struct ContentView: View {
	@State private var currentDate = Date()
	
	let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMMM d, yyyy"
		return formatter
	}()
	
	let timeFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "h:mm a"
		return formatter
	}()
	
	var body: some View {
		VStack(alignment: .center) {
			Image(systemName: "clock")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 50, height: 50)
				.font(.system(size: 50, weight: .semibold))
			Text("\(timeFormatter.string(from: currentDate))")
				.font(.title) // Adjust font size as needed
			
			Text("\(dateFormatter.string(from: currentDate))")
				.font(.title3) // Adjust font size as needed
		}
		.onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
			currentDate = Date()
		}
		.padding(8)
	}
}

#Preview {
    ContentView()
}
