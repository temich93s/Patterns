//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {

	var chair: Chair?
	var table: Table?
	var sofa: Sofa?

	// используем наши фабрики
	@IBAction func kithenOrder(_ sender: Any) {
		chair = KitchenFactory().createChair()
		table = KitchenFactory().createTable()
		sofa = KitchenFactory().createSofa()
	}
	
	@IBAction func bedRoomOrder(_ sender: Any) {
		chair = BedroomFactory().createChair()
		table = BedroomFactory().createTable()
		sofa = BedroomFactory().createSofa()
	}
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

