import Foundation

// Перечисление хранит список упражнений
enum Exercises {
	case jumping, squarts, swingPress
}

// сама фабрика, создаем на основе синглтона, по требованию пользователя возвращает конкретный класс
class FactoryExercises {
	static let defaultFactory = FactoryExercises()
	
	// сама функция создания упражнения, возвращает упраженение типа протокола
	func createExercise(name: Exercises) -> Exercise {
		// в зависимости от энума возвращаем упражнение стараеся использовать энемы, так как со стрингом могут ошибки-опечатки
		switch name {
		case .jumping: return Squarts()
		case .squarts: return Jumping()
		case .swingPress: return SwingPress()
		}
	}
}
