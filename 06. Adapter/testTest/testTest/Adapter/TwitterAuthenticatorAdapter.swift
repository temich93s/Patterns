//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// наш адаптер
public class TwitterAuthenticatorAdapter: AuthenticationService {
	
	private var authenticator = GoogleAuthenticator()
	
	// наша функция которую будет использовать пользователь
	public func login(
		email: String,
		password: String,
		success: @escaping (User, Token) -> Void,
		failure: @escaping (Error?) -> Void) {
		
			authenticator.login(
				email: email,
				password: password) { (currentUser, error) in
					guard let currentUser = currentUser else { 
						failure(error)
						return
					}
				let user = User(email: currentUser.email, password: currentUser.password)
				let token = Token(value: currentUser.token)
				success(user, token)
				}
		}
}

