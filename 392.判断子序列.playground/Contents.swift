
import Foundation
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        
        var firstStr = NSString(string: s)
        var secondStr = NSString(string: t)
        
        if firstStr == secondStr {
            return true
        }
        
        let i = 0
        let aaa = firstStr.substring(to: 1)
        print("aaaa:\(aaa)")
//        while i < s.count && j < t.count {
//            if s.suffix(from: i) == t[j] {
//                j += 1
//            } else {
//                i += 1
//            }
//        }\\
        return false
    }
}

Solution().isSubsequence("abc", "ababc")
