//
//  PartyTrackerViewModel.swift
//  DnD5PartyTracker
//

import Foundation

internal final class PartyTrackerViewModel {

    private let ezra = PlayerCharacter(
        name: "Ezra Akoridan",
        characterClass: .bard(6),
        attunementSlots: 3,
        maximumAmmunition: 40,
        spellSlots: [
            UsableResource(name: "LVL 1", maximumCharges: 4, restType: .long),
            UsableResource(name: "LVL 2", maximumCharges: 3, restType: .long),
            UsableResource(name: "LVL 3", maximumCharges: 3, restType: .long),
        ],
        features: [
            UsableResource(name: "Hit Dice (d8)", maximumCharges: 6, restType: .long),
            UsableResource(name: "Inspiration (d8)", maximumCharges: 4, restType: .short),
        ]
    )

    private let szelest = PlayerCharacter(
        name: "Szelest",
        characterClass: .ranger(6),
        attunementSlots: 1,
        maximumAmmunition: 50,
        spellSlots: [
            UsableResource(name: "LVL 1", maximumCharges: 4, restType: .long),
            UsableResource(name: "LVL 2", maximumCharges: 2, restType: .long),
        ],
        features: [
            UsableResource(name: "Hit Dice (d10)", maximumCharges: 6, restType: .long),
            UsableResource(name: "Levitate", maximumCharges: 1, restType: .long),
        ]
    )

    private let ceiyrius = PlayerCharacter(
        name: "Ceiyrius Nailo",
        characterClass: .paladin(6),
        attunementSlots: 2,
        maximumAmmunition: 20,
        spellSlots: [
            UsableResource(name: "LVL 1", maximumCharges: 4, restType: .long),
            UsableResource(name: "LVL 2", maximumCharges: 2, restType: .long),
        ],
        features: [
            UsableResource(name: "Hit Dice (d10)", maximumCharges: 6, restType: .long),
            UsableResource(name: "Divine Sense", maximumCharges: 3, restType: .long),
            UsableResource(name: "Fey Step", maximumCharges: 1, restType: .short),
            UsableResource(name: "Channel divinity", maximumCharges: 1, restType: .short),
            UsableResource(name: "Lay on Hands", maximumCharges: 30, restType: .long),
        ]
    )

    private let fargrim = PlayerCharacter(
        name: "Fargrim Bloodkith",
        characterClass: .cleric(6),
        attunementSlots: 2,
        maximumAmmunition: 20,
        spellSlots: [
            UsableResource(name: "LVL 1", maximumCharges: 4, restType: .long),
            UsableResource(name: "LVL 2", maximumCharges: 3, restType: .long),
            UsableResource(name: "LVL 3", maximumCharges: 3, restType: .long),
        ],
        features: [
            UsableResource(name: "Hit Dice (d8)", maximumCharges: 6, restType: .long),
            UsableResource(name: "Channel divinity", maximumCharges: 2, restType: .short),
            UsableResource(name: "Eyes of the grave", maximumCharges: 3, restType: .long),
            UsableResource(name: "At Deaths Door", maximumCharges: 3, restType: .long),
        ]
    )

    /// Collection of all tracked characters.
    internal lazy var dataSource: [PlayerCharacter] = [ceiyrius, szelest, fargrim, ezra]
}
