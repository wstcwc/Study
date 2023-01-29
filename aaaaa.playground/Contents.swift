//记账本上记买了若干资多国好历我额，需要转總吐人民历分 rer)，汇台后粉出。
//每行记灵一突金颜，金啟劳有货而华位，俗式为数字＋型位，可能是华独元，或者华雄分，时者元与分的组合。
//要求特这些货历主品快算独人民历分 (renl 后进行汇总，汇总结果代保留遭数，小数部分君
//奔

import Foundation

class Solution {
    func fetchPoint(str: String) -> Int {
        let arr: [String] = str.components(separatedBy: " ")
        var sum: Int = 0
        for item in arr {
            var value: Int = Int(item)!
            
            if value < 0 {
                value = 0
            } else if value > 255 {
                value = 255
            }
            
            sum += value
        }
        let result : CGFloat = 128 - CGFloat(sum) /
        CGFloat(arr.count)
        
        let floor = Int(floor(result))
        let ceil = Int(ceil(result))
        
        let floorCount = CGFloat(floor * arr.count + sum) / CGFloat(arr.count)
        let ceilCont = CGFloat(ceil * arr.count + sum) / CGFloat(arr.count)
        
        let floorMid = abs(floorCount - 128)
        let ceilMid = abs(ceilCont - 128)
        
        if floorMid == ceilMid {
            return floorCount < ceilCont ? floor : ceil
        } else if floorMid < ceilMid {
            return floor
        } else {
            return ceil
        }
        
    }
}

Solution().fetchPoint(str: "0 0 0 1")
