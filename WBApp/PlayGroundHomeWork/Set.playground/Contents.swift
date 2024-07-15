import Foundation

// Создаем множество из целых чисел
var numbers: Set<Int> = [2, 4, 6, 8]
print("Initial set: \(numbers)")

// Добавляем несколько элементов в это множество
numbers.insert(10)
numbers.insert(12)
print("Set after insertion: \(numbers)")

// Удаляем один элемент
numbers.remove(4)
print("Set after removal: \(numbers)")

// Проверяем, существует ли определенный элемент в множестве
let exists = numbers.contains(6)
let exists2 = numbers.contains(4)
print("Does 6 exist in the set? \(exists)")
print("Does 6 exist in the set? \(exists2)")

// Создаем множества для более наглядных операций

let emoje1: Set<String> = ["😎", "🤓", "🧐", "🥳"]
let emoje2: Set<String> = ["😦", "😧", "😲", "🥳"]

// Операции объединения, пересечения и разности
let unionSet = emoje1.union(emoje2)
print("Union of sets: \(unionSet)")

let intersectionSet = emoje1.intersection(emoje2)
print("Intersection of sets: \(intersectionSet)")

let differenceSet = emoje1.subtracting(emoje2)
print("Difference of sets: \(differenceSet)")
