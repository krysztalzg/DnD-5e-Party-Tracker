//
//  UsableRescource.swift
//  DnD5PartyTracker
//

import Foundation

internal struct UsableResource {

    // MARK: Types

    /// Type of rest needed to recover to max charges.
    internal enum ResourceRestType {
        case short
        case long
    }

    // MARK: Properties

    /// Name of resource.
    internal let name: String

    /// Value of maximum uses.
    internal let maximumCharges: Int

    /// Value of already consumed uses.
    internal var usedCharges: Int = 0

    /// Type of rest needed to recover to max charges.
    internal let restType: ResourceRestType
}
