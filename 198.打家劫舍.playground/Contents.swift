class Solution {
    
    func rob(_ nums: [Int]) -> Int {
        var dp:[Int] = [Int].init(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        for i in 1..<nums.count {
            if i == 1 {
                dp[i] = max(nums[0], nums[1])
            } else {
                dp[i] = max(dp[i-1], dp[i-2] + nums[i])
            }
        }

        return dp[nums.count - 1]
    }
}

Solution().rob([1,2,3,1])
