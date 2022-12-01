import  UIKit

var str = "Adapter"

// наш код
protocol BirdProtocol {
    func sing()
    func fly()
}

class Bird: BirdProtocol {
    func sing() {
        print("пою")
    }
    func fly() {
        print("летаю")
    }
}

// посторонняя библиотека, несовместимая, которую мы не можем поменять, нет доступа, не хочем лезть
class Raven {
    func flySearchAndDestroy() {
        print("летаю в поисках истребления")
    }
    
    func voice() {
        print("кар-кар")
    }
}

// метод где натыкаемся на несовместимые интерфейсы

func makeTheBirdTest(bird: BirdProtocol) {
    bird.sing()
    bird.fly()
}

// наш код - все хорошо
let simpleBird = Bird()
makeTheBirdTest(bird: simpleBird)

// несовместимый код
let simpleRaven = Raven()
// makeTheBirdTest(bird: simpleRaven) // ошибка

// создаем адаптер
class RavenAdater: BirdProtocol {
    // надо сделать приватный экземпляр
    private var raven: Raven
    
    // наш adaptee что адаптируем
    init(adaptee: Raven) {
        raven = adaptee
    }
    
    func sing() {
        raven.voice()
    }
    func fly() {
        raven.flySearchAndDestroy()
    }
}

// используем наш адаптер
let ravenAdater = RavenAdater(adaptee: simpleRaven)
makeTheBirdTest(bird: ravenAdater)
