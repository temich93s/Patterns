//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// вспомогательные структуры
public struct User {
	public let email: String
	public let password: String
}

public struct Token {
	public let value: String
}

// создаем протокол сетевого вервиса - наш собственный, под который будем адаптировать
public protocol AuthenticationService {
	func login(
		email: String, 
		password: String, 
		success: @escaping (User, Token) -> Void, 
		failure: @escaping (Error?) -> Void)
}

