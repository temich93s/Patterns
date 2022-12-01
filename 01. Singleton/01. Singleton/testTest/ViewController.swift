//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
		// Это все встроенные от Apple синглтоны
		// UIApplication.shared.applicationlconBadgeNumber = 1 
		// UserDefaults.standard 
		// URLSession.shared
		
		// свойства экземпляра синглтона моджно изменять
        Settings.shared.volumeLevel = 2.0
		print(Settings.shared.volumeLevel)
    }


}

