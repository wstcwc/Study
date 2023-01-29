//746. 使用最小花费爬楼梯
//简单
//1K
//相关企业
//给你一个整数数组 cost ，其中 cost[i] 是从楼梯第 i 个台阶向上爬需要支付的费用。一旦你支付此费用，即可选择向上爬一个或者两个台阶。
//
//你可以选择从下标为 0 或下标为 1 的台阶开始爬楼梯。
//
//请你计算并返回达到楼梯顶部的最低花费。

 

//示例 1：
//
//输入：cost = [10,15,20]
//输出：15
//解释：你将从下标为 1 的台阶开始。
//- 支付 15 ，向上爬两个台阶，到达楼梯顶部。
//总花费为 15 。

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var cost = cost
        return cast(cost, cost.count)
    }
    
    /// 爬上n阶 需要的花费
    /// - Parameters:
    ///   - cost: <#cost description#>
    ///   - n: <#n description#>
    /// - Returns: <#description#>
    private func cast(_ cost: [Int], _ n: Int) -> Int {
        if n == 1 {
            return Int.max
        }
        
        if n == 2 {
            return Int.max
        }
        
        if n == 3 {
            return min(cost[2], cost[1])
        }
        
        if n == 4 {
            return min(cast(cost, n - 1) + cost[3], cast(cost, n - 2))
        }
        
        return min(cast(cost, n - 1) + cost[n - 1], cast(cost, n - 2))
    }
}

Solution().minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])
