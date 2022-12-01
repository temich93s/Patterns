//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// Билдер конкретного каталога
class CatalogBulder: ModuleBuilder {
	// название вьюконтроллера
	var title: String?
	
	// возвращает собственный экземпляр с установленным именем
	func setTitle(_ title: String) -> CatalogBulder {
		self.title = title
		return self
	}
	
	// сам билдер который собирает все что есть в каталоге вместе
	func build() -> UIViewController {
		guard let title = title else { fatalError("нужно добавить тайтл") }
		// реализовываем презенташн слой
		let presenter = CatalogPresenter()
		// в интерактор передем презентер, тем самым осуществляем депенденси энкженкшн
		let interactor = CatalogInteractor(presenter: presenter)
		let controller = CatalogViewController(title: title, interactor: interactor)
		// передаем презентеру полномочия вьюконтроллер, передав зависимости из вне
		presenter.viewController = controller
		return controller
	}
}

