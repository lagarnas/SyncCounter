import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation

class SyncCounter {
    private var counter = 0
    private let queue = DispatchQueue(label: "queue")
    
    var count: String {
        get {
            var result = 0
            queue.sync { result = self.counter }
            return result
        }
        
        set {
            queue.async { self.counter = newValue }
        }
    }
}
