//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// управленец который управляет и менеджерем линий и ханителем линий
class CarriarState {
	var state: StateLinesMemento?
	var linesManager: LinesManager
	
	init(linesManager: LinesManager) {
		self.linesManager = linesManager
	}
	
	// сохраняет линии
	public func saveLine() {
		// при сохранении так же создается и StateLinesMemento
		state = linesManager.save()
	}
	
	// загружаем линии
	func loadLine() {
		guard state != nil else { return }
		linesManager.load(state: state!)
	}
}

