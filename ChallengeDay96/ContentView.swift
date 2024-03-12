//
//  ContentView.swift
//  ChallengeDay96
//
//  Created by Kirill Baranov on 12/03/24.
//

import SwiftUI

struct ContentView: View {
	
	@State var newDiceEdges: DiceEdges = .four
	@State var dices: [Dice] = []
	
	let columns = [GridItem(.fixed(100)), GridItem(.fixed(100))]

    var body: some View {
		Picker("Count dice edges", selection: $newDiceEdges) {
			ForEach (DiceEdges.allCases, id: \.self) { edge in
				Text(edge.rawValue, format: .number)
			}
		}
		HStack {
			
			Button("Remove dice") {
				dices.removeLast()
			}
			Button("Add dice") {
				dices.append(Dice(edges: newDiceEdges))
			}
		}
		.buttonStyle(.bordered)
		Spacer()
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach (dices, id: \.id) { dice in
					DiceView(dice: dice)
				}
			}
		}
			
		
		Spacer()
		
		Button("Roll") {
			for dice in dices {
				Task {
					await dice.roll()
				}
			}
		}
		.buttonStyle(.bordered)

//		DiceView(dice: Dice(edges: .eight))
		
    }
}

#Preview {
    ContentView()
}
