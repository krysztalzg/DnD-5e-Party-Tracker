//
//  PartyTrackerViewController.swift
//  DnD5PartyTracker
//

import UIKit

internal final class PartyTrackerViewController: UIViewController {

    // MARK: Properties

    private let viewModel = PartyTrackerViewModel()

    // MARK: Overrides

    /// - SeeAlso: UIViewController.loadView()
    internal override func loadView() {
        super.loadView()
        let typedView = PartyTrackerView()
        view.addSubview(typedView)
        NSLayoutConstraint.activate([
            typedView.topAnchor.constraint(equalTo: view.topAnchor),
            typedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            typedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            typedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

