import Foundation

// протокол определяющий структуру упражнения
protocol Exercise {
	var name: String {get}
	var type: String {get}
	func start()
	func stop()
}
