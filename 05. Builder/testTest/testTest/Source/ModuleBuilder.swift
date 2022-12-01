//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// Абстрактный Билдер - протокол который будет собирать любые модули и возвращать вьюконтроллер
protocol ModuleBuilder {
	func build() -> UIViewController
	
}

// Билдер конкретного каталога


