//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// Вьюконтроллер который будет отображен на экране каталога
class CatalogViewController: UIViewController {
	// принимает интерактор, который уже будет соединен с презентером
    var interactor: Interactor! = nil
	
	init(title: String, interactor: Interactor) {
        self.interactor = interactor
		// супер инит что бы создался вьюконтроллер и реализовались все родительские методы
        super.init(nibName: nil, bundle: nil)
		self.title = title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		// отличительные признаки нашего вьюконтроллера что бы увидеть что это именно этот контроллер
		view.backgroundColor = UIColor.blue
    }
	
}

