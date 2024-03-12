//
//  DiceView.swift
//  ChallengeDay96
//
//  Created by Kirill Baranov on 12/03/24.
//

import SwiftUI

struct DiceView: View {
	@State var dice: Dice
	
	var body: some View {
		VStack {
			Text("\(String(dice.edges.rawValue))-side dice")
			VStack {
				Text(dice.result, format: .number)
			}
			.frame(width: 100, height: 100)
			.background {
				RoundedRectangle(cornerRadius: 25)
					.foregroundStyle(.thinMaterial)
					.shadow(radius: 10)
			}
			Text("Total rolls: \(dice.totalRoll)")
		}
		.sensoryFeedback(.impact, trigger: dice.result)
	}
}

#Preview {
	DiceView(dice: Dice(edges: DiceEdges.eight))
}
