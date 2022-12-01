import Foundation

// экземпляр упражнения, выполняет протокол
class SwingPress: Exercise { 
	var name: String = "Жим штанги"
	var type: String = "Упражнение для рук"
	func start() { 
		print("Начать жим штанги")
	}
	func stop() { 
		print("закончить жим штанги")
	}
}
