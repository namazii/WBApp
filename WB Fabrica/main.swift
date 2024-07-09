//
//  main.swift
//  WB Fabrica
//
//  Created by Назар Ткаченко on 22.06.2024.
//

import Foundation

// Класс, представляющий Паспорт
class Passport {
    var series: String
    var number: String
    var issueDate: Date
    weak var person: Person?

    init(series: String, number: String, issueDate: Date, person: Person?) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.person = person
        print("Паспорт \(series) \(number) был создан.")
    }

    deinit {
        print("Паспорт \(series) \(number) был деинициализирован.")
    }
}

// Класс, представляющий Человека
class Person {
    var fullName: String
    var age: Int
    var passport: Passport?

    init(fullName: String, age: Int, passport: Passport?) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        print("Человек \(fullName) был создан.")
    }

    deinit {
        print("Человек \(fullName) был деинициализирован.")
    }
}

// Функция для демонстрации создания и деинициализации объектов
func start() {
    let person: Person? = Person(fullName: "Иван Иванович Иванов", age: 30, passport: nil)
    let passport: Passport? = Passport(series: "ABCD", number: "123456", issueDate: Date(), person: person)

    // Связываем объекты
    person?.passport = passport

    // Деинициализируем объекты
    print("Завершаем работу функции start и деинициализируем объекты.")
}

start()
