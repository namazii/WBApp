import Foundation

// возвращает хеш строки используя встроенную функцию hash()
func getHash(from string: String) -> Int {
    return string.hash
}

let exampleString = "test"
let hashValue = getHash(from: exampleString)
print("Hash of \(exampleString) is value: \(hashValue)")


// -------------------------------- Part2 --------------------------------------

//Функция возвращает свой хеш 
func myCustomHash(_ string: String) -> Int {
    var hash = 0 // для значения хеша.

    for char in string {
        let unicodeScalar = char.unicodeScalars.first!.value // Получаем Unicode значение текущего символа.
        hash = Int(unicodeScalar) + (hash << 6) + (hash << 16) - hash //Обновляем значение хеша с учетом текущего символа
        /*
         Эта строка обновляет значение переменной hash по следующей формуле:
           `Int(unicodeScalar)` — преобразует значение Юникодного скаляра в целое число.
           (hash << 6) — сдвигает биты в hash влево на 6 позиций. По сути, это эквивалент умножения на 2^6 (или на 64).
           `(hash << 16)` — сдвигает биты в `hash` влево на 16 позиций. Эквивалент умножения на 2^16 (или на 65536).
           - hash — вычитает текущее значение hash из итогов предыдущих операций.
        - Все эти значения суммируются и присваиваются переменной hash. Таким образом, дорабатывается значение hash с учетом текущего символа строки.

         */
    }
    return abs(hash)
}

let exampleSecondString = "test"
let customHashValue = myCustomHash(exampleSecondString)
print("Custom hash of \(exampleString) is value: \(customHashValue)")
