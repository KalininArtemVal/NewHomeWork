//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()

func findEven(array: [Int]) -> (Int,Int) {
    
    var arrayOfEven = [Int]()
    var arrayOfNonEven = [Int]()

    for i in array {
        if i % 2 == 0{
            arrayOfEven.append(i)
        }
        else {
            arrayOfNonEven.append(i)
        }
    }
    let even = arrayOfEven.count
    let notEven = arrayOfNonEven.count
    return (even, notEven)
}

checker.checkFirstFunction(function: findEven)

/// Передайте в этот метод функцию, преобразующую массив окружностей по следующему алгоритму:
/// белые окружности должны быть первыми
/// радиус черных должен быть увеличен в 2 раза
/// красные нужно убрать из результата
/// зеленые перекрасить в синие
/// затем разместить синие в конце массива
/// Порядок окружностей ВНУТРИ СВОЕЙ ЦВЕТОВОЙ ГРУППЫ должен соответствовать тому порядку,
/// в котором эти окружности располагались внутри своей цветовой группы в исходном массиве.
/// Например: группа белых окружностей должна быть первой в итоговом массиве. При этом каждая
/// белая окружность должна сохранять ровно тот же порядок относительно других белых окружностей,
/// который был в исходном массиве.
/// Если ваше решение окажется правильным то в консоли вы увидите еще одну часть кодового слова.


// -------------------
func change(circle: [Checker.Circle]) -> [Checker.Circle] {


    var newRadius: Double = 0.0
    var color: Checker.Color = .black
    var newArray = [Checker.Circle]()
    
    for element in circle {
        switch element.color {
        case .green:
            color = .blue
            newRadius = element.radius
            newArray.append(element)
        case .blue:
            color = .blue
            newRadius = element.radius
            newArray.append(element)
        case .black:
            color = .black
            newRadius = element.radius * 2
            newArray.append(element)
        case .red:
            color = .red
            newRadius = element.radius
        case .white:
            color = .white
            newRadius = element.radius
            newArray.append(element)
        default:
            print("")
        }
    }
    
    return newArray
}

 checker.checkSecondFunction (function: change)

//---------------------
/// Передайте в этот метод функцию которая преобразует массив словарей в структуры Employee.
 /// Порядок сотрудников должен остаться тем же. При этом если формат данных не совпадает с
 /// указанным выше, то такой словарь должен отбрасываться. Если ваше решение окажется правильным
 /// то в консоли вы увидите еще одну часть кодового слова.


 

func changeArrayToStruct(array: [Checker.EmployeeData]) -> [Checker.Employee] {
    
    var valueArray = [Checker.Employee]()

    for element in array {
            if let name = element["fullName"],
                let salary = element["salary"],
                let company = element["company"] {
                let emp = Checker.Employee(fullName: name, salary: salary, company: company)
                valueArray.append(emp)
        }
    }
    return valueArray
}

/// Передайте в этот метод функцию которая преобразует массив словарей в структуры Employee.
/// Порядок сотрудников должен остаться тем же. При этом если формат данных не совпадает с
/// указанным выше, то такой словарь должен отбрасываться. Если ваше решение окажется правильным
/// то в консоли вы увидите еще одну часть кодового слова.


checker.checkThirdFunction(function: changeArrayToStruct)
//
//

func changeArrayOf(names: [String]) -> [String : [String]] {
    var dictOfNames = [String: [String]]()
    var arrayOfNames = [String]()
    var arrayOfChar = [Character]()

    for name in names {
        if let firstCharacter = name.first {
            arrayOfChar.append(firstCharacter)
        }
    }
    
    for letter in arrayOfChar {
        for name in names {
            let firstCharacter = name.first
            if firstCharacter == letter {
                arrayOfNames.append(name)
            }
        }
        let new = String(arrayOfChar)
        
        dictOfNames.updateValue(arrayOfNames, forKey: new)
        
        for i in dictOfNames {
            let sortedDict = i.value.sorted(by: <)
            for value in sortedDict {
                if value.count <= 2 {
                    dictOfNames.removeValue(forKey: i.key)
                }
            }
        }
    }
    
return dictOfNames
}

/// Передайте в этот метод функцию, принимающую массив имен и преобразующую его по алгоритму:
/// 1) Группирует имена в словарь, где ключом будет первая буква имен в виде String, а
/// значением - массив имен начинающихся с этой буквы.
/// Например: ["Вася", "Олег", "Вова"] -> ["В" : ["Вася", "Вова"], "О" : ["Олег"]]
/// 2) Убирает группы в которых меньше двух элементов.
/// 3) Сортирует элементы в каждой группе в обратном алфавитному порядке.
/// Если ваше решение окажется правильным, то в консоли вы увидите еще одну часть кодового слова.


checker.checkFourthFunction(function: changeArrayOf)
