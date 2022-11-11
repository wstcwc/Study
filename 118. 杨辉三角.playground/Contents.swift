//118. 杨辉三角
//简单
//868
//相关企业
//给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。
//
//在「杨辉三角」中，每个数是它左上方和右上方的数的和。
//
//
//
//
//
//示例 1:
//
//输入: numRows = 5
//输出: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
//示例 2:
//
//输入: numRows = 1
//输出: [[1]]

import Foundation

class Solution {
    var results: [[Int]] = []
    
    func generate(_ numRows: Int) -> [[Int]] {

        for i in 1...numRows {
            let arr = createOneLine(i)
            results.append(arr)
        }
        
        return results
    }
    
    func createOneLine(_ num: Int) -> [Int] {
        if num <= 1 {
            return [1]
        }
        
        if num == 2 {
            return [1, 1]
        }
        
        var arr: [Int] = []
        for i in 0..<num {
            if i == 0 {
                arr.append(1)
                
            } else if i == num - 1 {
                arr.append(1)
                
            } else {
                // 获取前一个数组
                let lastarr = results[num - 2]
                // 规律
                arr.append(lastarr[i] + lastarr[i-1])
            }
        }
        
        return arr
    }
}


Solution().generate(6)
