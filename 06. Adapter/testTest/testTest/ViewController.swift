//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {

	// сервис предоставляющий регистрацию через адаптер
	var authService: AuthenticationService = GoogleAuthenticatorAdapter()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUser(email: "email", password: "pass")
    }
	
	func createUser(email: String, password: String) {
		authService.login(email: email, 
			password: password, 
			success: { (user, token) in 
					print("Auth success: \(user), \(token.value)")
				}) { (error) in 
					if let error = error {
						print(error)
					}
				}
	}
}
		

