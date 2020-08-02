//
//  ResourceCheckbox.swift
//  DnD5PartyTracker
//

import UIKit

internal final class ResourceCheckbox: UIView {

    // MARK: Properties

    internal var isSelected: Bool = false {
        willSet {
            backgroundColor = newValue ? .darkGray : .white
        }
    }

    // MARK: Initializers

    /// Initialize an instance.
    init() {
        super.init(frame: .zero)
        setupProperties()
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupProperties() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleUsage)))
    }

    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor),
            heightAnchor.constraint(equalToConstant: 16)
        ])
    }

    @objc private func toggleUsage() {
        isSelected.toggle()
    }
}
