//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// закрыта недоступная структура
public struct GoogleUser {
	public var email: String
	public var password: String
	public var token: String
}

// закрыта недоступная либа
public class GoogleAuthenticator {
	
	public func login(
        email: String,
		password: String,
		completion: @escaping (GoogleUser?, Error?) -> Void) {
			let token = "token-GOOGLE"
			let user = GoogleUser(email: email, password: password, token: token)
			completion(user, nil)
		}		
}

