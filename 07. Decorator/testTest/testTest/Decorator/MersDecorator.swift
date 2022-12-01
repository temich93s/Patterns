//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// наш декоратор
class MersDecorator: MersProtocol {
	
	// создается экземпляр которому добавим свойства/поведение объекту
	private let decoratorType: MersProtocol
	
	required init(decorator: MersProtocol) {
		self.decoratorType = decorator
	}
	
	// теперь мы будем использовать/возвращать аттрибуты нашего кастомизированный объект
	func getTitle() -> String {
		return decoratorType.getTitle()
	}
	
	func getPrice() -> Double {
		return decoratorType.getPrice()
	}
}

