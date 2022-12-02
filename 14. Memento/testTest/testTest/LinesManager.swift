//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// менеджер линий, на основе синглтона, берет кладет линии из хранителя
class LinesManager {
	static let shared = LinesManager()
	var linesArray = [LineModel]()
	
	// сохранение линий
	func save() -> StateLinesMemento {
		return StateLinesMemento(lines: self.linesArray)
	}
	
	// загрузка линий из хранителя
	func load(state: StateLinesMemento) {
		self.linesArray = state.linesArray
	}
	
	// печать линий
	func printLines(in view: UIView) {
		// массив слоев очищаем сначала
		for v in view.layer.sublayers! {
			v.removeFromSuperlayer()
		}
		// рисуем линии
		for line in linesArray {
			let path = UIBezierPath()
			path.move(to: line.start)
			path.addLine(to: line.end)
			drawShapeLayer(path, line.color, view)
		}

	}
	
	// показываем линии 
	private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.strokeColor = lineColor.cgColor
		shapeLayer.lineWidth = 10
		view.layer.addSublayer(shapeLayer)
		// перерисовываем вьюшки на экране
		view.setNeedsDisplay()
	}
}

