import UIKit
import Foundation

let input = "gjo%%CGP-A+@-krz~dhxWb$qVev+!W^)~--U+ysdA^ZA~y^SxF!PUu&k"

class Solution {
    func sortString(_ input: String) -> String {
        // 英文字符
        var englishArr: [String] = []
        // 非英文字符(标点)
        var symbolDic: [Int: String] = [:]
        
        for (index, char) in input.enumerated() {
            let current = String(char)
            if !current.isEnglish {
                symbolDic[index] = current
            } else {
                englishArr.append(current)
            }
        }
        
//        for i in 0..<englishArr.count {
//            for j in 0..<englishArr.count - 1 - i {
//                let current = englishArr[j]
//                let last = englishArr[j+1]
//                
//                if current.uppercased() > last.uppercased() {
//                    englishArr.swapAt(j, j+1)
//                }
//            }
//        }
        
        englishArr = englishArr.sorted { a, b in
            a.uppercased() < b.uppercased()
            
        }
        
        let allKeys = symbolDic.keys.sorted(by: { $0 < $1 })
        
        for key in allKeys {
            englishArr.insert(symbolDic[key] ?? "", at: key)
        }
        
        var result = ""
        for char in englishArr {
            result += char
        }
        
        return result
    }
    
    func checkPassword(_ pw: String) {
        for (index, char) in pw.enumerated() {
            let string = String(char)
            
            var low, up, number, symbol: Int = 0
            
            
            
        }
    }
}

extension String {
    var isEnglish: Bool {
        get {
            if self >= "a", self <= "z" {
                return true
            }
            
            if self >= "A", self <= "Z" {
                return true
            }
            
            return false
        }
    }
    
    var isLow: Bool {
        if self >= "a", self <= "z" {
            return true
        }
        
        return false
    }
    
    var isUp: Bool {
        if self >= "A", self <= "Z" {
            return true
        }
        return false
    }
    
    var isNumber: Bool {
        let value = Int(self) ?? -1
        
        return value >= 0
    }
}

Solution().sortString(input)


Solution().checkPassword("021Abc9Abc1")
