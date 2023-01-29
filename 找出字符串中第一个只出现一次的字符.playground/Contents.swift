import Foundation

class Solution {
    func fineFirst(_ text: String) -> String {
        var dic: [String: Int] = [:]
        
        for (_, char) in text.enumerated() {
            let key = String(char)
            dic[key] = (dic[key] ?? 0) + 1
        }
        
        for (_, char) in text.enumerated() {
            let key = String(char)
            if dic[String(char)] == 1 {
                return key
            }
        }
        
        return "-1"
    }
}

Solution().fineFirst("asdfasdfo")
