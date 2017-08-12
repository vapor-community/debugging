import CStack
import Foundation

internal struct StackTrace {
    static func get(maxStackSize: Int = 32) -> [String] {
        var count: Int32 = 0
        let maxStackSize = Int32(maxStackSize)
        guard let cStrings = get_stack_trace(maxStackSize, &count) else {
            return []
        }

        var result: [String] = []

        for i in 0..<Int(count) {
            guard let cString = cStrings[i] else {
                break
            }

            let string = String(cString: cString)
            result.append(string)
        }

        free(cStrings)
        return result
    }
}
