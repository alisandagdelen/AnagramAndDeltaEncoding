//
//  AnagramAndDeltaEncoding .swift
//  
//
//  Created by alisandagdelen on 18.02.2018.
//

import UIKit

// 1- Anagrams
typealias dictStringArray = [String:[String]]

func findAnagrams(words:[String]) -> dictStringArray {
    var anagrams:dictStringArray = [:]
    
    for word in words {
        let formatedWord = word.replacingOccurrences(of: " ", with: "").lowercased().sorted()
        let formatedString = String(formatedWord)
        
        if let _ = anagrams[formatedString] {
            anagrams[formatedString]?.append(word)
        } else {
            anagrams[formatedString] = [word]
        }
    }
    return anagrams
}

// Anagram test
let anagrams = findAnagrams(words: ["pear", "amleth", "dormitory", "tinsel", "dirty", "room", "hamlet", "listen", "silent"])
for anagram in anagrams {
    print(anagram.value)
}

// 2- Delta encoding

func deltaEncode(elements:[Int],escapeToken:Int) -> [Int]{
    var encodedElements:[Int] = []
    
    for (index, element) in elements.enumerated() {
        if index == 0 {
            encodedElements.append(element)
            continue
        }
        let diffrence = element - elements[index - 1]
        if diffrence <= -127 || diffrence >= 127 {
            encodedElements.append(contentsOf: [escapeToken, diffrence])
        } else {
            encodedElements.append(diffrence)
        }
    }
    return encodedElements
}

let elements = [25626, 25757, 24367, 24267, 16, 100, 2, 7277]
print(deltaEncode(elements: elements, escapeToken: -128))

