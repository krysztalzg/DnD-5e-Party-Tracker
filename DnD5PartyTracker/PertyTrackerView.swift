//
//  PertyTrackerView.swift
//  DnD5PartyTracker
//

import UIKit

internal final class PartyTrackerView: UIView {

    // MARK: Properties

    private lazy var statusBarHeight: CGFloat = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

    // MARK: Hierarchy

    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds.size
        flowLayout.itemSize = CGSize(width: screenSize.width / 2, height: screenSize.height / 2 - statusBarHeight)
        flowLayout.sectionInset = .zero
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        return flowLayout
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = .clear
        return collection
    }()

    // MARK: Initializers

    init() {
        super.init(frame: .zero)
        setupProperties()
        setupViewHierarchy()
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupProperties() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupViewHierarchy() {
        addSubview(collectionView)
    }

    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    // MARK: Lifecycle

    /// Setups collection view delegate and data source.
    ///
    /// - Parameters:
    ///     - viewController: `Party Tracker View Controller` object used as data source and delegate of collection view.
    internal func setupCollectionView(_ viewController: PartyTrackerViewController) {
        collectionView.dataSource = viewController
        collectionView.delegate = viewController
    }

}
