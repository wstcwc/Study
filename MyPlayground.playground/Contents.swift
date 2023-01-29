import Foundation
import UIKit

public enum MoveDirection: String {
    case up    = "W"
    case left  = "A"
    case right = "D"
    case down  = "S"
}

class Solution {
    func getPoint(_ inputText: String) -> (x: Int, y: Int) {
        let parts = inputText.components(separatedBy: ";").filter({ !$0.isEmpty })
        
        var originX = 0
        var originY = 0
        
        for part in parts {
            
            var part = part
            let direct = part.first ?? "x"
            part.removeFirst()
            
            let value = Int(String(part)) ?? 0
            
            print("direct: \(direct) value: \(value)")
            
            if let direction = MoveDirection(rawValue: String(direct)) {
                
                switch direction {
                case .up:
                    originY += value
                case .left:
                    originX -= value
                case .right:
                    originX += value
                case .down:
                    originY -= value
                }
            }
        }
        
        return (originX, originY)
    }
}

Solution().getPoint("A10;S20;W10;D30;X;A1A;B10A11;;A10;")


