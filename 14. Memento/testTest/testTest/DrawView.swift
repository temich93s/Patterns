//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// кастамная вью на которой будем рисовать
class DrawView: UIView {
	// объявляем управленца
	var carriarSate: CarriarState!
	
	var lineWidth: CGFloat!
	var lineColor: UIColor!
	var starPoint: CGPoint!
	var endPoint: CGPoint!
	var path: UIBezierPath!
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
    override func layoutSublayers(of layer: CALayer) {
		lineWidth = 10.0
		let lines = LinesManager.shared
		carriarSate = CarriarState(linesManager: lines)
	}
	
	// определяем касание и рисуем
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
        starPoint = touch?.location(in: self)
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
        endPoint = touch?.location(in: self)
		// сохраняем линии
		carriarSate.linesManager.linesArray.append(LineModel(start: starPoint, end: endPoint, color: lineColor))
		
		// рисуем
		path = UIBezierPath()
		path.move(to: starPoint)
		path.addLine(to: endPoint)
		starPoint = endPoint
		drawShapeLayer()
	}

	private func drawShapeLayer() {
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.strokeColor = lineColor.cgColor
		shapeLayer.lineWidth = 10
		self.layer.addSublayer(shapeLayer)
		// перерисовываем вьюшки на экране
		self.setNeedsDisplay()
	}
}

