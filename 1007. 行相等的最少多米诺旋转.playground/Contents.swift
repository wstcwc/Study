//在一排多米诺骨牌中，A[i] 和 B[i] 分别代表第 i 个多米诺骨牌的上半部分和下半部分。（一个多米诺是两个从 1 到 6 的数字同列平铺形成的 —— 该平铺的每一半上都有一个数字。）
//
//我们可以旋转第 i 张多米诺，使得 A[i] 和 B[i] 的值交换。
//
//返回能使 A 中所有值或者 B 中所有值都相同的最小旋转次数。
//
//如果无法做到，返回 -1.

//输入：A = [2,1,2,4,2,2], B = [5,2,6,2,3,2]
//输出：2
//解释：
//图一表示：在我们旋转之前， A 和 B 给出的多米诺牌。
//如果我们旋转第二个和第四个多米诺骨牌，我们可以使上面一行中的每个值都等于 2，如图二所示。
//示例 2：
//
//输入：A = [3,5,1,2,3], B = [3,6,3,3,4]
//输出：-1
//解释：
//在这种情况下，不可能旋转多米诺牌使一行的值相等。

class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        if tops.count != bottoms.count {
            return -1
        }
        
//        1.将上面的牌全部变成上面的第一张牌对应的点数
        var topChange = 0
        
        for index in 1..<tops.count  {
            if tops[0] == tops[index] {
                
            } else if tops[0] == bottoms[index] {
                topChange += 1
            } else {
                topChange = Int.max
                break
            }
        }
        
//        2.将下面的牌全部变成下面的第一张牌对应的点数；
        var bottomChange = 0
        for index in 1..<bottoms.count {
            if bottoms[0] == bottoms[index] {
                
            } else if bottoms[0] == tops[index] {
                bottomChange += 1
            } else {
                bottomChange = Int.max
                break
            }
        }
        
//        3.将上面的牌全部变成下面的第一张牌对应的点数；
        var top = 0
        for index in 0..<tops.count  {
            if tops[0] == bottoms[index] {
                
            } else if tops[0] == tops[index] {
                top += 1
            } else {
                top = Int.max
                break
            }
        }
        
//        4.将下面的牌全部变成上面的第一张牌对应的点数
        var bottom = 0
        for index in 0..<bottoms.count {
            if bottoms[0] == tops[index] {
                
            } else if bottoms[0] == bottoms[index] {
                bottom += 1
            } else {
                bottom = Int.max
                break
            }
        }
        
        let result = min(min(topChange, bottomChange), min(top, bottom))
        
        return result == Int.max ? -1 : result
    }
}

Solution().minDominoRotations([1,2,2,2,2,2,2,2] , [2,1,1,1,1,1,1,1])
