class Solution {
    func numDecodings(_ s: String) -> Int {
        var dp:[Int] = [Int].init(repeating: 0, count: s.count)
        
        for (i, char) in s.enumerated() {
            let char = String(char)
            
            if i == 0 {
                dp[0] = char == "0" ? 0 : 1
            } else {
                if char == "0" {
                    dp[i] = dp[i - 1]
                } else if char {
                    
                }
            }
        }
    }
}
