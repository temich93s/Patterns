import Foundation

// фабрика определенного семейства, методы возвращает сам объект
class KitchenFactory: AbstractFactory {
	func createChair() -> Chair {
		print("стул для кухни создан")
		return ChairKitchen()
	}
	func createSofa() -> Sofa {
		print("диван для кухни создан")
		return SofaKitchen()
	}
	func createTable() -> Table {
		print("стол для кухни создан")
		return TableKitchen()
	}
}
