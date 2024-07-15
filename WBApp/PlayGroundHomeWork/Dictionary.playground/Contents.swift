import Foundation

// Создаем словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население)
var cityPopulation: [String: Int] = [
    "Tokyo": 37400068,
    "Delhi": 28514000,
    "Shanghai": 25582000
]
print("Initial dictionary: \(cityPopulation)")

// Добавляем несколько пар ключ-значение в словарь
cityPopulation["Sao Paulo"] = 21650000
cityPopulation["Mumbai"] = 20411000
print("Dictionary after addition: \(cityPopulation)")

// Удаляем одну пару ключ-значение
cityPopulation.removeValue(forKey: "Delhi")
print("Dictionary after removal: \(cityPopulation)")

// Обновляем значение для одного из ключей
cityPopulation["Tokyo"] = 37500000
cityPopulation.updateValue(25582111, forKey: "Shanghai")
print("Dictionary after updating Tokyo: \(cityPopulation)")

// Получаем значение для одного из ключей
let populationOfCity = cityPopulation["Shanghai"]
print(populationOfCity ?? "All people of this city dead :(")
