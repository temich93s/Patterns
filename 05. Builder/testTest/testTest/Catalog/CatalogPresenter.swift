//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import Foundation

// создаем протокол спрезентер по правилам инкапсуляции
protocol Presenter {
    var messageInfo: String { get }
}

// Создаем презентер, который будет делать презентацию
class CatalogPresenter: Presenter {
	// объявляем вьюконтроллер для передачи из вьюмодели полномочия контроллеру
	// презентить на экран будет презентер, а не вью контроллер, поэтому ему нужны полномочью вьюконтроллера
	weak var viewController: CatalogViewController? 
	
	var messageInfo = "В этом классе можно создавать viewModel для представления"
}
