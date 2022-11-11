//121. 买卖股票的最佳时机
//简单
//2.7K
//相关企业
//给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
//
//你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
//
//返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
//
//
//
//示例 1：
//
//输入：[7,1,5,3,6,4]
//输出：5
//解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。

class Solution {
    /// 暴力法,会超时
//    func maxProfit(_ prices: [Int]) -> Int {
//
//        var result = 0
//
//        for i in 0..<prices.count {
//
//            let minNum = prices[i]
//            var maxNum = prices[i]
//
//            for j in i..<prices.count {
//                if prices[j] > maxNum {
//                    maxNum = prices[j]
//                }
//            }
//
//            let value = maxNum - minNum
//
//            result = value > result ? value : result
//        }
//
//        return result
//    }
    
//    可以看做一种动态规划，只不过对空间复杂度进行了优化。考虑每次如何获取最大收益？第i天的最大收益只需要知道前i天的最低点就可以算出来了。而第i天以前（包括第i天）的最低点和i-1天的最低点有关，至此我们的动态方程就出来了。
//
//    dp[i] = min(d[i-1],prices[i])
//    其中dp[0]=prices[0],然后动态计算之后的就可以了。 得到了前i天的最低点以后，只需要维护一个max用来保存最大收益就可以了
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        var mindp = 0
        var maxPrice = 0
        
        for index in 0..<prices.count {
            if index == 0 {
                mindp = prices[index]
                
            } else {
                mindp = min(mindp, prices[index])
                
                maxPrice = max(prices[index] - mindp, maxPrice)
            }
        }
        
        return maxPrice
    }
}

Solution().maxProfit([3,3,5,0,0,3,1,4])
