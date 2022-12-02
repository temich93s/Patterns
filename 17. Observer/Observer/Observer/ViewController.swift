//
//  ViewController.swift
//  Observer
//
//  Created by 2lup on 01.12.2022.
//

import UIKit

// создаем обсервер через протокол
protocol Observer: AnyObject {
    // передаем объект который будет оповещать, а функция выполняет оповещание подписчиков
    func update(subject: NotificationCenters)
}

// сам оповещатор
class NotificationCenters {
    var state: Int = {
        // рандомно генерит число
        return Int(arc4random_uniform(10))
    }()
    
    // хранит всех подписчиков
    private lazy var observers = [Observer]()
    
    // подписка
    func subscribe(_ observer: Observer) {
        print("podpiska")
        observers.append(observer)
    }
    
    // отписка
    func unsubscribe(_ observer: Observer) {
        if let index = observers.index(where: {$0 === observer}) {
            observers.remove(at: index)
            print("otpiska")
        }
        observers.append(observer)
    }
    
    // отправка уведомления
    func notify() {
        print(#function)
        // у каждого вызываем подписчика метод о событии передав в него сам обсервер
        observers.forEach({$0.update(subject: self)})
    }
    
    // бизнес логика
    func someBusinessLogic() {
        // работа с итогом
        state = Int(arc4random_uniform(10))
        // оповещение всех
        notify()
    }
}

// еще подписчик помимо вьюконтроллера
class ConreteObserverA: Observer {
    func update(subject: NotificationCenters) {
        print("ConreteObserverA ", subject.state)
    }
}


class ViewController: UIViewController, Observer {

    @IBOutlet weak var outOneLabel: UILabel!
    
    // создаем объект нотиф. центра
    let notificationCenters = NotificationCenters()
    // создаем еще одного обсервера
    let observer1 = ConreteObserverA()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateAction(_ sender: UIButton) {
        // срабатывание бизнес логики
        notificationCenters.someBusinessLogic()
    }
    
    @IBAction func subscribeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            notificationCenters.subscribe(self)
            notificationCenters.subscribe(observer1)
        } else {
            notificationCenters.unsubscribe(self)
            notificationCenters.unsubscribe(observer1)
        }
    }
    
    // выполняем протокол, указывая что мы будем выполнять по приходу события от нотификатора
    func update(subject: NotificationCenters) {
        outOneLabel.text = "VC: \(subject.state)"
    }
    
}

