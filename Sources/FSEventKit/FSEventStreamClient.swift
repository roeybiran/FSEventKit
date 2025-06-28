import Foundation
import Dependencies
import DependenciesMacros

@DependencyClient
public struct FSEventStreamClient: Sendable {
  public var events: @Sendable (_ paths: [String], _ latency: TimeInterval) -> FSEventAsyncStream = { _, _ in .finished() }
}

extension FSEventStreamClient: DependencyKey {
  public static let liveValue = Self(
    events: {
      FSEventStream.events(paths: $0, latency: $1)
    }
  )

  public static let testValue = Self()
}

extension DependencyValues {
  public var fsEventStreamClient: FSEventStreamClient {
    get { self[FSEventStreamClient.self] }
    set { self[FSEventStreamClient.self] = newValue }
  }
}
