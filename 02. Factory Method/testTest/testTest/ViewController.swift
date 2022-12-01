//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {
	
	// массив упражнений
	var exerciseArray = [Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createExercise(exName: .jumping)
        createExercise(exName: .squarts)
		createExercise(exName: .swingPress)
		runExercise()
    }
	
	// методы создания упражения и добавления его в массив
	func createExercise(exName: Exercises) {
		// используем нашу фабрику
		let newExercise = FactoryExercises.defaultFactory.createExercise(name: exName)
		exerciseArray.append(newExercise)
	}
	
	// методы создания и запуска упражения 
	func runExercise() {
		for ex in exerciseArray {
			ex.start()
			ex.stop()
		}
	}
}

