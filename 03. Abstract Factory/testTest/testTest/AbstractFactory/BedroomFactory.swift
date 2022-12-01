import Foundation

// фабрика определенного семейства, методы возвращает сам объект
class BedroomFactory: AbstractFactory {
	func createChair() -> Chair {
		print("стул для спальни создан")
		return ChairBedroom()
	}
	func createSofa() -> Sofa {
		print("диван для спальни создан")
		return SofaBedroom()
	}
	func createTable() -> Table {
		print("стол для спальни создан")
		return CoffeTableBedroom()
	}
}