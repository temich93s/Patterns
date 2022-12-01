//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// наша панарамная крыша обертка для объекта мерседес
class PanframeRoof: MersDecorator {
	
	// получаем которые будем декарировать
	required init(decorator: MersProtocol) {
		super.init(decorator: decorator)
	}

	// переопределяем методы добавляя ему кастомные характеристики
	override func getTitle() -> String {
		return super.getTitle() + "premium roof"
	}
	
	override func getPrice() -> Double {
		return super.getPrice() + 2000
	}
}

