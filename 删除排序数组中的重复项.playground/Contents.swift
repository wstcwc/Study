import Cocoa

var str = "Hello, playground"

/************************************
给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长。
不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

示例 1:

给定数组 nums = [1,1,2],

函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。

你不需要考虑数组中超出新长度后面的元素。
示例 2:

给定 nums = [0,0,1,1,1,2,2,3,3,4],

函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。

你不需要考虑数组中超出新长度后面的元素。
*/


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var index = 1
        var tempValue = nums[0]
        while index < nums.count {
//            print("----\(nums)")
            
            if tempValue == nums[index] {
                nums.remove(at: index)
            } else {
                tempValue = nums[index]
                index += 1
            }
        }
        
        return nums.count
    }
}

let test = Solution()
//var nums: [Int] = [0,0,1,1,1,2,2,3,3,4]
var nums: [Int] = [-2,-2,-1,2, 6]
test.removeDuplicates(&nums)
