import Foundation

// экземпляр упражнения, выполняет протокол
class Jumping: Exercise { 
	var name: String = "Прыжки"
	var type: String = "Упражнение для ног"
	func start() { 
		print("Начать прыжки")
	}
	func stop() { 
		print("закончить прыжки")
	}
}