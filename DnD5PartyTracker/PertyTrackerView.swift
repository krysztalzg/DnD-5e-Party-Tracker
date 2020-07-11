//
//  PertyTrackerView.swift
//  DnD5PartyTracker
//

import UIKit

internal final class PartyTrackerView: UIView {

    // MARK: Properties

    // MARK: Hierarchy

    private let characterPhoto: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let classLabel: UILabel = {
        let label = UILabel()
        return label
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

    }

    private func setupLayoutConstraints() {

    }

}
