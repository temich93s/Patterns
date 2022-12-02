import  UIKit

var str = "Iterator"

var array = [1, 2, 3, 4, 5]

// встроенный итератор у массива
let iteratot = array.makeIterator()

for i in array {
    print(i)
}

// своя структура данных - связанный список
struct LinkedList<T> {
    // первый элемент
    var head: LinkedListNode<T>
    // инициализация
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

// отвечает за сам элемент
indirect enum LinkedListNode<T> {
    //текущий элемент + ссылка на следующий
    case value(element: T, next: LinkedListNode<T>)
    // конечный элемент без ссылки
    case end
}

// элементы связанного списока
let element4 = LinkedListNode.value(element: 4, next: .end)
let element3 = LinkedListNode.value(element: 4, next: element4)
let element2 = LinkedListNode.value(element: 4, next: element3)
let element1 = LinkedListNode.value(element: 4, next: element2)
// сам список из 4 элементов
let list = LinkedList(head: element1)

// этот связынный список не можем использовать в цикле

// расширяем что бы работал цикл, объединяем объекты в последовательность
extension LinkedList: Sequence {
    // метод что требует протокол, он требует итератор
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}

// сам итератор, подписываемся под протокол
struct LinkedListIterator<T>: IteratorProtocol {
    // текущий элемент
    var current: LinkedListNode<T>
    // реализуем фукцию некст
    mutating func next() -> T? {
        switch current {
        // получаем элемент LinkedListNode
        case let .value(element, next):
            // устанавливаем следующий
            current = next
            // возвращаем значение
            return element
        case .end:
            return nil
        }
    }
}

// вызываем
for i in list {
    print(i)
}
