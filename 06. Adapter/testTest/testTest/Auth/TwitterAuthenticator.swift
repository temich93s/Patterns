//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// закрыта недоступная структура
public struct TwitterUser {
	public var email: String
	public var password: String
	public var token: String
}

// закрыта недоступная либа
public class TwitterAuthenticator {
	
	public func login(
        email: String,
		password: String,
		completion: @escaping (TwitterUser?, Error?) -> Void) {
			let token = "token-TWITTER"
			let user = TwitterUser(email: email, password: password, token: token)
			completion(user, nil)
		}		
}

