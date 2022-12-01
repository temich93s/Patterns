//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {

	@IBAction func catalogButtonDidTapped(_ sender: Any) {
		// вызываем билдер
		let controller = CatalogBulder().setTitle("Catalog").build()
        self.present(controller, animated: true, completion: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

