//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import Foundation

// создаем протокол презентер по правилам инкапсуляции
protocol Interactor {
	// принимает презентер
	init(presenter: Presenter)
}

// наш интерактор, для соединения объектов из вне и для тестирования объектов
class CatalogInteractor: Interactor {
	var presenter: Presenter!

	// описывается в классе бизнесс логика

	required init(presenter: Presenter) {
		self.presenter = presenter
	}
}

