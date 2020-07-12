//
//  CharacterClass.swift
//  DnD5PartyTracker
//

import Foundation

/// Avaialble character classes.
internal enum CharacterClass {
    case artificier(Int)
    case barbarian(Int)
    case bard(Int)
    case cleric(Int)
    case druid(Int)
    case fighter(Int)
    case monk(Int)
    case paladin(Int)
    case ranger(Int)
    case rogue(Int)
    case sorcerer(Int)
    case warlock(Int)
    case wizard(Int)
    case multiclass([CharacterClass])

    /// Name of class with level.
    internal var classString: String {
            switch self {
                case let .artificier(level): return "Artificier \(level)"
                case let .barbarian(level): return "Barbarian \(level)"
                case let .bard(level): return "Bard \(level)"
                case let .cleric(level): return "Cleric \(level)"
                case let .druid(level): return "Druid \(level)"
                case let .fighter(level): return "Fighter \(level)"
                case let .monk(level): return "Monk \(level)"
                case let .paladin(level): return "Paladin \(level)"
                case let .ranger(level): return "Ranger \(level)"
                case let .rogue(level): return "Rogue \(level)"
                case let .sorcerer(level): return "Sorcerer \(level)"
                case let .warlock(level): return "Warlock \(level)"
                case let .wizard(level): return "Wizard \(level)"
            case let .multiclass(classes): return classes.map { $0.classString }.joined(separator: ", ")
        }
    }
}
