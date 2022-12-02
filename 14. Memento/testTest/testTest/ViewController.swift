//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var viewBoard: DrawView!

	var carriarState: CarriarState!

    override func viewDidLoad() {
        super.viewDidLoad()
        
		viewBoard.lineColor = UIColor.black
		
		// создаем управленца
		let lines = LinesManager.shared
		carriarState = CarriarState(linesManager: lines)
    }

	@IBAction func saveAction(_ sender: Any) {
		carriarState.saveLine()
	}
	
	@IBAction func loadAction(_ sender: Any) {
		carriarState.loadLine()
		carriarState.linesManager.printLines(in: viewBoard)
	}
	
	@IBAction func blueAction(_ sender: Any) {
		viewBoard.lineColor = UIColor.blue
	}
	
	@IBAction func orangeAction(_ sender: Any) {
		viewBoard.lineColor = UIColor.orange
	}
	
	@IBAction func greenAction(_ sender: Any) {
		viewBoard.lineColor = UIColor.green
	}
	
}

