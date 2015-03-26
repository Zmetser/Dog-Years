//
//  DogClass.swift
//  Dog years
//
//  Created by Oliver Kovacs on 11/03/15.
//
//

import Foundation

enum DogType: Printable {
    case Small
    case Medium
    case Large
    case Giant
    
    var description: String {
        switch self {
        case .Small:  return "Small"
        case .Medium: return "Medium"
        case .Large:  return "Large"
        case .Giant:  return "Giant"
        }
    }
    
    func getFromString(type: String) -> DogType {
        switch type {
        case "Small":  return .Small
        case "Medium": return .Medium
        case "Large":  return .Large
        case "Giant":  return .Giant
        default:       return .Medium
        }
    }
}

struct Dog {
    let expectedDogLifeSpan: Int

    private let humanYearsTable: Dictionary<DogType, Array<Int>> = [
        .Small:  [15, 23, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68,  72,  76,  80],
        .Medium: [15, 24, 29, 34, 37, 42, 47, 51, 56, 60, 65, 69, 74,  78,  83,  87],
        .Large:  [14, 22, 29, 34, 40, 45, 50, 55, 61, 66, 72, 77, 82,  88,  93,  99],
        .Giant:  [14, 20, 28, 35, 42, 49, 56, 64, 71, 78, 86, 93, 101, 108, 115, 123]
    ]
    
    init() {
        expectedDogLifeSpan = humanYearsTable[DogType.Small]?.endIndex ?? 0
    }
    
    // Return nil if array index is out of range.
    private func safeGet(index: Int, arr: Array<Int>) -> Int? {
        return index >= 0 && index < arr.endIndex ? arr[index] : nil
    }
    
    func ageForDog(dogType: DogType, age: Int) -> Int? {
        if let type = humanYearsTable[dogType] {
            return safeGet(age - 1, arr: type)
        }
        return nil
    }
}