
class Solution {
    func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        let sorted = asteroids.sorted { $0 < $1 }
        var mass = mass
        for value in sorted {
            if mass >= value {
                mass += value
            } else {
                return false
            }
        }
        
        return true
    }
}

Solution().asteroidsDestroyed(10, [3,9,19,5,21])
