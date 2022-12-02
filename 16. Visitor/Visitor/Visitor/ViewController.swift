//
//  ViewController.swift
//  Visitor
//
//  Created by 2lup on 01.12.2022.
//

import UIKit

// есть три кастомные ячейки с закрытой от нас реализацией, нам для каждой ячейки надо задать определенный размер

class FirstCell: UITableViewCell {/**/}
class SecondCell: UITableViewCell {/**/}
class ThirdCell: UITableViewCell {/**/}

// структура отчечающая за высоту ячеек
struct HeighResultVisitor {
    func visit(_ cell: FirstCell) -> CGFloat { return 20.0 }
    func visit(_ cell: SecondCell) -> CGFloat { return 40.0 }
    func visit(_ cell: ThirdCell) -> CGFloat { return 80.0 }
}

// создание паттерна, сначала создаем протокол
protocol heighResultVisitable {
    // принимает поситителем
    func accept(_ visitor: HeighResultVisitor) -> CGFloat
}

// теперь делаем что бы каждая ячейка знала о визитере, имела необходимые нам методы, что бы над ней мог поработаь визитерБ так как мы не можем реализовать протокол внутри ячейки то делаем это удаленно
extension FirstCell: heighResultVisitable {
    func accept(_ visitor: HeighResultVisitor) -> CGFloat {
        // передаем внутри саму ячейку визитору
        return visitor.visit(self)
    }
}

extension SecondCell: heighResultVisitable {
    func accept(_ visitor: HeighResultVisitor) -> CGFloat {
        // передаем внутри саму ячейку визитору
        return visitor.visit(self)
    }
}

extension ThirdCell: heighResultVisitable {
    func accept(_ visitor: HeighResultVisitor) -> CGFloat {
        // передаем внутри саму ячейку визитору
        return visitor.visit(self)
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // просто регистрируем ячейки
    func registerCell() {
        tableView.register(FirstCell.self, forCellReuseIdentifier: "FirstCell")
        tableView.register(SecondCell.self, forCellReuseIdentifier: "SecondCell")
        tableView.register(ThirdCell.self, forCellReuseIdentifier: "ThirdCell")
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // здесь просто код создания ячеек
        /**/ return FirstCell()
        /**/ return SecondCell()
        /**/ return ThirdCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // используем наш визитер
        // получаем ячейку кастя ее под протокол виитера, так как всех подписали
        let cell = tableView.cellForRow(at: indexPath) as! heighResultVisitable
        // и передаем визитера который вызовет ячейка передав в него себя
        return cell.accept(HeighResultVisitor())
    }
}
