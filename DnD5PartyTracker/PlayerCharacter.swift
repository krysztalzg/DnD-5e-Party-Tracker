//
//  PlayerCharacter.swift
//  DnD5PartyTracker
//

import UIKit

/// Model representing a Player Character.
internal final class PlayerCharacter {

    /// Optional photo of the character.
    internal let photo: UIImage?

    /// Name of the character.
    internal let name: String

    /// Current class and level of the character.
    internal let characterClass: CharacterClass

    /// Available attunement slots of the character.
    internal var attunementSlots: Double

    /// Currently available ammunution of the character.
    internal var currentAmmunition: Double

    /// Maximum amount of ammunition of the character.
    internal var maximumAmmunition: Double

    /// Available spell slots of the character.
    internal var spellSlots: [UsableResource]

    /// Available usable feature reasources of the character.
    internal var features: [UsableResource]

    /// Initializes instance with given value.
    internal init(
        photo: UIImage? = #imageLiteral(resourceName: "photo-placeholder"),
        name: String,
        characterClass: CharacterClass,
        attunementSlots: Double,
        maximumAmmunition: Double,
        spellSlots: [UsableResource],
        features: [UsableResource]
    ) {
        self.photo = photo
        self.name = name
        self.characterClass = characterClass
        self.attunementSlots = attunementSlots
        self.currentAmmunition = maximumAmmunition
        self.maximumAmmunition = maximumAmmunition
        self.spellSlots = spellSlots
        self.features = features
    }
}
