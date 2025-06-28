import FSEventKit
import Foundation

Task {
  do {
//    let p = FileManager
//      .default
//      .homeDirectoryForCurrentUser
//      .appendingPathComponent("_FSEventKitTest")
//      .path
//
    let p = "/Users/roey/Library/Application Scripts/com.roeybiran.Finbar/"
    for try await events in FSEventStream.events(
      paths: [p],
      queue: .global(),
      latency: 1)
    {
//      events.forEach { print($0) }
      print(events.last)
    }
  } catch {
    print(error)
  }
}

RunLoop.main.run()
