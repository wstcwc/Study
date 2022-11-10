//70. 爬楼梯
//简单
//2.7K
//相关企业
//假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
//
//每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

import Foundation

class Solution {
    var dic = [Int: Int]()
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
            
        if n == 2 {
            return 2
        }
        
        if dic[n] != nil {
            return dic[n]!
            
        } else {
            dic[n] = (climbStairs(n-1) + climbStairs(n-2)) % 1000000007
            return dic[n]!
        }
        
    }
}

Solution().climbStairs(10)
