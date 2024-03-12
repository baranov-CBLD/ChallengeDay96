//
//  Dice.swift
//  ChallengeDay96
//
//  Created by Kirill Baranov on 12/03/24.
//

import Foundation
import Observation

@Observable
class Dice: Identifiable {
	
	var id = UUID()
	var edges: DiceEdges
	var result: Int
	var totalRoll: Int = 0
	
	init(edges: DiceEdges) {
		self.edges = edges
		self.result = 1
	}
	
	func roll() async {
		for _ in 1...10 {
			try? await Task.sleep(for: .seconds(0.1))
			self.result = Int.random(in: 1...edges.rawValue)
		}
		for time in 1...5 {
			try? await Task.sleep(for: .seconds(Double(time) / 7))
			self.result = Int.random(in: 1...edges.rawValue)
		}
		totalRoll += 1
	}
}

enum DiceEdges: Int, CaseIterable {
	case four = 4, six = 6, eight = 8, ten = 10, twelve = 12, twenty = 20, hundred = 100
}
