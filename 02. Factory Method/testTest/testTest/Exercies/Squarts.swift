import Foundation

// экземпляр упражнения, выполняет протокол
class Squarts: Exercise { 
	var name: String = "Приседания"
	var type: String = "Упражнение для ног"
	func start() { 
		print("Начать приседания")
	}
	func stop() { 
		print("закончить приседания")
	}
}