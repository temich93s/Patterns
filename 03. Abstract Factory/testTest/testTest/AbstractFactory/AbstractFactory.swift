import Foundation

// устанавливает требования по созданию стул, стол, диван (возвращает именно тип объекта (в будущем наш объект класса)
protocol AbstractFactory {
	func createChair() -> Chair
	func createSofa() -> Sofa
	func createTable() -> Table
}