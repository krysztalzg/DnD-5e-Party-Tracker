//
//  PertyTrackerView.swift
//  DnD5PartyTracker
//

import UIKit

internal final class PartyTrackerView: UIView {

    // MARK: Properties

    private lazy var statusBarHeight: CGFloat = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

    private let bottomPanelHeight: CGFloat = 32

    // MARK: Hierarchy

    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds.size
        flowLayout.itemSize = CGSize(width: screenSize.width / 2, height: screenSize.height / 2 - statusBarHeight - bottomPanelHeight)
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

    private let bottomPanel: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()

    private lazy var shortRestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Short Rest", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(doShortRest), for: .touchUpInside)
        return button
    }()

    private lazy var longRestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Long Rest", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(doLongRest), for: .touchUpInside)
        return button
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
        [shortRestButton, longRestButton].forEach(bottomPanel.addArrangedSubview)
        [collectionView, bottomPanel].forEach(addSubview)
    }

    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),

            bottomPanel.heightAnchor.constraint(equalToConstant: bottomPanelHeight),
            bottomPanel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomPanel.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            bottomPanel.bottomAnchor.constraint(equalTo: bottomAnchor),
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

    // MARK: Actions

    @objc private func doShortRest() {
        collectionView.visibleCells
            .compactMap { $0 as? CharacterCollectionViewCell }
            .forEach { $0.doShortRest() }
    }

    @objc private func doLongRest() {
        collectionView.visibleCells
            .compactMap { $0 as? CharacterCollectionViewCell }
            .forEach { $0.doLongRest() }
    }
}
