//
//  PartyTrackerViewController.swift
//  DnD5PartyTracker
//

import UIKit

internal final class PartyTrackerViewController: UIViewController {

    // MARK: Properties

    private let viewModel = PartyTrackerViewModel()

    private let typedView = PartyTrackerView()

    // MARK: Initializers

    init() {
        super.init(nibName: nil, bundle: nil)
        setupProperties()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupProperties() {
        typedView.setupCollectionView(self)
        view.backgroundColor = .white
    }

    // MARK: Overrides

    /// - SeeAlso: UIViewController.loadView()
    internal override func loadView() {
        super.loadView()
        view.addSubview(typedView)
        NSLayoutConstraint.activate([
            typedView.topAnchor.constraint(equalTo: view.topAnchor),
            typedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            typedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            typedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension PartyTrackerViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier, for: indexPath) as! CharacterCollectionViewCell

        return cell
    }


}

