//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var priceLabel: UILabel! {
		didSet {
			priceLabel.text = String(mersedes.getPrice()) + "$"
		}
	}
	@IBOutlet weak var comentLabel: UILabel!

	// создали экземпляр класса
	var mersedes: MersProtocol = MersCLA()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func menuCarSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
		case 0:
			mersedes = MersCLA()
			priceLabel.text = String(mersedes.getPrice()) + "$"
            comentLabel.text = mersedes.getTitle()
		case 1:
			mersedes = MersCLA()
			// добавляем декоратор
			mersedes = AlloyWheels(decorator: mersedes)
			priceLabel.text = String(mersedes.getPrice()) + "$"
            comentLabel.text = mersedes.getTitle()
		case 2:
			mersedes = MersCLA()
			// добавляем декоратор
			mersedes = PanframeRoof(decorator: mersedes)
			priceLabel.text = String(mersedes.getPrice()) + "$"
            comentLabel.text = mersedes.getTitle()
		default:
			break
		}
	}

}

