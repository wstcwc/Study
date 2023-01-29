import UIKit

class Solution {
    func maxPrice(with bagV: Int, goods: [[Int]]) -> Int {
        // 商品总数
        let goodsCount = goods.count
        
        // 定义: 前i个物品, 背包容量j下的最优解
        let temp: [Int] = [Int].init(repeating: 0, count: bagV)
        var priceForBag: [[Int]] = Array(repeating: temp, count: goods.count)
        
        for i in 1..<goodsCount {
            for j in 1..<bagV {
                /// 装不下了
                if j < goods[i][0] {
                    priceForBag[i][j] = priceForBag[i - 1][j]
                } else {
                    // 装的下,就进行决策, 不选和选里面,挑个最大的
                    priceForBag[i][j] = max(priceForBag[i-1][j], priceForBag[i - 1][j - goods[i][0]] + goods[i][1])
                }
            }
        }
        
        print(priceForBag)
        
        return priceForBag[goodsCount - 1][bagV - 1]
    }
}

// [重量, 价值]
var goods = [[3,1], [4,2], [1,4], [4,5]]

Solution().maxPrice(with: 6, goods: goods)
