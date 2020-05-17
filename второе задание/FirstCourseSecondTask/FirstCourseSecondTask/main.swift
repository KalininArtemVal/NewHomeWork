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
func change(circles: [Checker.Circle]) -> [Checker.Circle] {


    var changeCircle = [Checker.Circle]()
    
    for circle in circles {
        if circle.color == .white {
            let whiteCircle = circle
            changeCircle.append(whiteCircle)
        } else if circle.color == .black {
            var blackCircle = circle
            let blackRadius = blackCircle.radius * 2
            blackCircle.radius = blackRadius
            changeCircle.append(blackCircle)
        }
    }
    
    for circle in circles {
    if circle.color == .blue {
        let blueCircle = circle
        if let _ = changeCircle.first, let _ = changeCircle.last {
            changeCircle.append(blueCircle)
        }
    } else if circle.color == .green {
        var greenCircle = circle
        let blue = Checker.Color.blue
        greenCircle.color = blue
        if let _ = changeCircle.first, let _ = changeCircle.last {
            changeCircle.append(greenCircle)
        }
    }
}
    
    return changeCircle
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
    
    for name in names {
        let charName = name.first
        for i in arrayOfChar {
            if charName == i {
                
            }
        }
        arrayOfNames.append(name)
    }
    
    for i in arrayOfChar {
      var newArray = [String]()
        for name in arrayOfNames {
            
            if let first = name.first {
                if i == first {
                    
                    newArray.append(name)
                    let new = String(i)
                    dictOfNames.updateValue(newArray, forKey: new)
                }
            }
        }
    }

        var sortedDict = [String: [String]]()
        for i in dictOfNames {
                if i.value.count < 2 {
                    dictOfNames.removeValue(forKey: i.key)
                } else {
                    let sortedValue = i.value.sorted{ $0 > $1 }
                    sortedDict.updateValue(sortedValue, forKey: i.key)
            }
        }
    
return sortedDict
}

checker.checkFourthFunction(function: changeArrayOf)
