import Foundation

public struct FSEvent: Sendable, Identifiable {
  public let path: String
  public let flag: Flag
  public let id: ID

  public struct Flag: OptionSet, Hashable, Sendable, CustomDebugStringConvertible {
    // MARK: Lifecycle

    public init(rawValue: FSEventStreamEventFlags) {
      self.rawValue = rawValue
    }

    public init(rawValue: Int) {
      self.rawValue = FSEventStreamEventFlags(truncatingIfNeeded: rawValue)
    }

    // MARK: Public

    public let rawValue: FSEventStreamEventFlags

    public static let none = Self(rawValue: kFSEventStreamEventFlagNone)
    public static let mustScanSubDirs = Self(rawValue: kFSEventStreamEventFlagMustScanSubDirs)
    public static let userDropped = Self(rawValue: kFSEventStreamEventFlagUserDropped)
    public static let kernelDropped = Self(rawValue: kFSEventStreamEventFlagKernelDropped)
    public static let eventIdsWrapped = Self(rawValue: kFSEventStreamEventFlagEventIdsWrapped)
    public static let historyDone = Self(rawValue: kFSEventStreamEventFlagHistoryDone)
    public static let rootChanged = Self(rawValue: kFSEventStreamEventFlagRootChanged)
    public static let mount = Self(rawValue: kFSEventStreamEventFlagMount)
    public static let unmount = Self(rawValue: kFSEventStreamEventFlagUnmount)
    public static let itemCreated = Self(rawValue: kFSEventStreamEventFlagItemCreated)
    public static let itemRemoved = Self(rawValue: kFSEventStreamEventFlagItemRemoved)
    public static let itemInodeMetaMod = Self(rawValue: kFSEventStreamEventFlagItemInodeMetaMod)
    public static let itemRenamed = Self(rawValue: kFSEventStreamEventFlagItemRenamed)
    public static let itemModified = Self(rawValue: kFSEventStreamEventFlagItemModified)
    public static let itemFinderInfoMod = Self(rawValue: kFSEventStreamEventFlagItemFinderInfoMod)
    public static let itemChangeOwner = Self(rawValue: kFSEventStreamEventFlagItemChangeOwner)
    public static let itemXattrMod = Self(rawValue: kFSEventStreamEventFlagItemXattrMod)
    public static let itemIsFile = Self(rawValue: kFSEventStreamEventFlagItemIsFile)
    public static let itemIsDir = Self(rawValue: kFSEventStreamEventFlagItemIsDir)
    public static let itemIsSymlink = Self(rawValue: kFSEventStreamEventFlagItemIsSymlink)
    public static let ownEvent = Self(rawValue: kFSEventStreamEventFlagOwnEvent)
    public static let itemIsHardlink = Self(rawValue: kFSEventStreamEventFlagItemIsHardlink)
    public static let itemIsLastHardlink = Self(rawValue: kFSEventStreamEventFlagItemIsLastHardlink)
    public static let itemCloned = Self(rawValue: kFSEventStreamEventFlagItemCloned)

    public var debugDescription: String {
      [
        (Self.none, "none"),
        (.mustScanSubDirs, "mustScanSubDirs"),
        (.userDropped, "userDropped"),
        (.kernelDropped, "kernelDropped"),
        (.eventIdsWrapped, "eventIdsWrapped"),
        (.historyDone, "historyDone"),
        (.rootChanged, "rootChanged"),
        (.mount, "mount"),
        (.unmount, "unmount"),
        (.itemCreated, "itemCreated"),
        (.itemRemoved, "itemRemoved"),
        (.itemInodeMetaMod, "itemInodeMetaMod"),
        (.itemRenamed, "itemRenamed"),
        (.itemModified, "itemModified"),
        (.itemFinderInfoMod, "itemFinderInfoMod"),
        (.itemChangeOwner, "itemChangeOwner"),
        (.itemXattrMod, "itemXattrMod"),
        (.itemIsFile, "itemIsFile"),
        (.itemIsDir, "itemIsDir"),
        (.itemIsSymlink, "itemIsSymlink"),
        (.ownEvent, "ownEvent"),
        (.itemIsHardlink, "itemIsHardlink"),
        (.itemIsLastHardlink, "itemIsLastHardlink"),
        (.itemCloned, "itemCloned"),
      ]
        .filter { contains($0.0) }
        .map { $0.1 }
        .joined(separator: ", ")
    }
  }

  public struct ID: RawRepresentable, Hashable, Sendable, CustomStringConvertible {
    // MARK: Lifecycle

    public init(rawValue: FSEventStreamEventId) {
      self.rawValue = rawValue
    }

    public init(_ value: UInt) {
      rawValue = FSEventStreamEventId(UInt32(truncatingIfNeeded: value))
    }

    // MARK: Public

    public let rawValue: FSEventStreamEventId

    public var description: String {
      "\(rawValue)"
    }

    public static let now = Self(kFSEventStreamEventIdSinceNow)
  }
}
