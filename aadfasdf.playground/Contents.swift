import Foundation

class Solution {
    func fetchMid(_ positions: [[Int]]) -> Int {
        var pointArr:[(x: Int, y: Int)] = []
        var sum: Int = 0
        for position in positions {
            let first = position.first!
            let last = position.last!
            
            let mid = (first + last) / 2
            pointArr.append((first, last))
            
            sum += mid
        }
        
        let shop = Int(floor(CGFloat(sum) / CGFloat(positions.count)))
        var sumDistant: Int = 0
        
        for point in pointArr {
            if shop > point.y {
                sumDistant += (shop - point.y)
            } else if shop < point.x {
                sumDistant += (point.x - shop)
            }
        }
        
        return sumDistant
    }
}



Solution().fetchMid([[1,2], [3, 4], [10, 20]])
