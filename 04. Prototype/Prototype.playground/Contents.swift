import  UIKit

var str = "Prototype"

// 1 варинат
/*
class Person {
    var name = ""
    
    // реализуем клонирование, по значению, а не по ссылки (глубокое копирование)
    func clone() -> Person() {
        let person = Person()
        person.name = name
        return person
    }
    
    // еще вариант
    
    
}

var person1 = Person()
person1.name = "Jim"

print(person1.name)

// глубокое не происходит, так как спокировали только указатель, а не содержимое значений
var person2 = person1
person2.name = "Jack"

print(person1.name)
print(person1 === person2)

// использование копирование по значению (глубокое копирование)
person2 = person1.clone
person2.name = "John"
print(person1 === person2)
*/

// 2 вариант (с инициализатором)
/*
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // реализуем клонирование, по значению, а не по ссылки (глубокое копирование)
    func clone() -> Person() {
        return person(name: self.name)
    }
}

var person1 = Person(name: "Jim")
person2 = person1.clone()
print(person1 === person2)
*/

// 3 вариант - NSCoping (из objective-C)

// создаем протокол с инициализатором
public protocol Copying {
    init(_ prototype: Self)
}

// добавляем функцию копирования
extension Copying {
    public func copy() -> Self {
        // type(of: self) - это наш self (маленький)
        // запись идентична return person(name: self.name), только абстрактна возвращает свой экземпляр
        return type(of: self).init(self)
    }
}

// создаем экземпляр выполняющий протокол
class Person: Copying {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // выполняем протокол
    required convenience init(_ prototype: Person) {
        self.init(name: prototype.name)
    }
}

var person1 = Person(name: "Jim")
var person2 = person1.copy()
print(person1 === person2)

// 4 пример расширения у массива где добавляется метод глубокого копирования. Принудительное копирование несмотря на copy-on-write
extension Array where Element: Copying {
    public func deepCopy() -> [Element] {
        return map { $0.copy() }
    }
}
