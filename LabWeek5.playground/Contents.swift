import UIKit

var greeting = "Hello, playground"


var list : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func doubleArray(array : Array<Int>) -> Array<Int>{
    var tempList: Array<Int> = [];
    for value in array {
        tempList.append(value * 2)
    }
    return tempList
}


func transformArray(array: Array<Int>, transform: (Array<Int>) -> Array<Int>) -> Array<Int>{
    return transform(array)
}


// print(transformArray(array: list, transform: doubleArray(list)))

transformArray(array: list) { array2 in
    return
}
