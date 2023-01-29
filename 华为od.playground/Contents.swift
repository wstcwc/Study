import UIKit

class Solution {
    func sortString(_ input: String) -> String {
        if input.isEmpty {
            return ""
        }
        
        let inputs = input.components(separatedBy: " ")
        // 出现次数字典
        var countDic: [String: Int] = [:]
        
        for string in inputs {
            countDic[string] = 1 + (countDic[string] ?? 0)
        }
        
        var pules: [(key: String, value: Int)] = []
        for key in countDic.keys {
            let pule: (String, Int) = (key, countDic[key] ?? 0)
            
            pules.append(pule)
        }
        
        pules = pules.sorted(by: {
            $0.value > $1.value
        })
        
        var resultStr = ""
        while pules.count > 0 {
            var results = pules.filter({ $0.value == (pules.first?.value ?? 0) })
            
            results = results.sorted(by: {
                if $0.key.count == $1.key.count {
                    return String($0.key.first ?? Character("")) < String($1.key.first ?? Character(""))
                } else {
                    return $0.key.count < $1.key.count
                }
            })
            
            for result in results {
                for _ in 0..<result.value {
                    resultStr += result.key.sorted(by: { $0 < $1 }) + " "
                }
            }

            for i in 0..<results.count {
                pules.remove(at: 0)
            }
        }
        
        var temp = resultStr.map({String($0)})
        
        if temp.first == " "{
            temp.removeFirst()
        } else if temp.last == " "{
            temp.removeLast()
        }
        
        while temp.first == "" {
            
        }
        
        resultStr = ""
        for val in temp {
            resultStr += val
        }
        
        return  resultStr
    }
    
    class Version: Comparable {
        static func == (lhs: Solution.Version, rhs: Solution.Version) -> Bool {
            if lhs.main == rhs.main, lhs.second == rhs.second, lhs.add == rhs.add, lhs.beta == rhs.beta {
                return true
            }
            
            return false
        }
        
        static func < (lhs: Solution.Version, rhs: Solution.Version) -> Bool {
            if lhs.main < rhs.main {
                return true
            } else if lhs.second < rhs.second {
                return true
            } else if lhs.add < rhs.add {
                return true
            }
            
            return false
        }
        
        var main: Int = 0
        var second: Int = 0
        var add: Int = -1
        var beta: String = ""
        
        var originStr: String = ""
    }
    
    func sortVersion(version1: String, version2: String) -> String {
        let ver1 = createVersionModel(with: version1)
        let ver2 = createVersionModel(with: version2)
        
        if ver1.main != ver2.main {
            if ver1.main > ver2.main {
                return ver1.originStr
            } else {
                return ver2.originStr
            }
        }
        
        if ver1.second != ver2.second {
            if ver1.second > ver2.second {
                return ver1.originStr
            } else {
                return ver2.originStr
            }
        }
        
        if ver1.add != ver2.add {
            if ver1.add > -1, ver2.add == -1 {
                return ver1.originStr
            } else if ver1.add == -1, ver2.add > -1 {
                return ver2.originStr
            } else if ver1.add != -1, ver2.add != -1 {
                if ver1.add > ver2.add {
                    return ver1.originStr
                } else {
                    return ver2.originStr
                }
            }
        }
        
        let v1 = ver1.beta.map({ String($0) })
        let v2 = ver2.beta.map({ String($0) })
        for i in 0..<min(ver1.beta.count, ver2.beta.count) {
            if v1[i] < v2[i] {
                return ver2.originStr
            } else {
                return ver1.originStr
            }
        }
        
        return ver1.originStr
    }
    
    func createVersionModel(with versionStr: String) -> Version {
        var version = Version()
        version.originStr = versionStr
        
        var results: [String] = []
        var versions = versionStr.components(separatedBy: ".")
//        for (index, string) in versions.enumerated() {
//            if index == versions.count - 1 {
//
//            }
//            if string.contains(try! Regex("-")) {
//                print(string)
//            }
//        }
        
        if versions.count == 2 {
            version.main = Int(versions[0]) ?? 0
            version.second = Int(versions[1]) ?? 0
            
        } else if versions.count == 3 {
            version.main = Int(versions[0]) ?? 0
            version.second = Int(versions[1]) ?? 0
            
            if versions[2].contains(where: { $0 == "-" }) {
                let temps = versions[2].components(separatedBy: "-")
                
                version.add = Int(temps[0]) ?? -1
                
                for i in 1..<temps.count {
                    let end = i == temps.count - 1 ? "" : "-"
                    version.beta += temps[i] + end
                }
                
            } else {
                version.add = Int(versions[2]) ?? -1
            }
        }
        print(version)
        return version
    }
}

print("star+\(Solution().sortString(" My sister is in the house not in the yard "))+end")
//Solution().sortVersion(version1: "1.5.1-A", version2: "1.5.1-a")
