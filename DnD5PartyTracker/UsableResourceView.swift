//
//  UsableResourceView.swift
//  DnD5PartyTracker
//

import UIKit

internal final class UsableResourceView: UIView {

    // MARK: Properties

    /// Number of resource checkboxes per row.
    private let checkboxesPerRow: Int = 5

    private var resource: UsableResource

    private var checkboxesLayoutGuide: UILayoutGuide

    internal var restType: UsableResource.ResourceRestType {
        resource.restType
    }

    // MARK: Hierarchy

    private let titleUseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .right
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()

    private let resourcesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()

    private var resourceCheckboxes: [ResourceCheckbox] {
        Array(
            resourcesStackView.arrangedSubviews
                .compactMap { $0 as? UIStackView }
                .compactMap { $0.arrangedSubviews
                    .compactMap { $0 as? ResourceCheckbox }
                }
                .joined()
        )
    }

    // MARK: Initializers

    /// Initialize an instance.
    ///
    /// - Parameters:
    ///     - resource: `Usable Resource` to setup for.
    ///     - layoutGuide: layout guide used to align all resources chekboxes.
    init(resource: UsableResource, layoutGuide: UILayoutGuide) {
        self.resource = resource
        self.checkboxesLayoutGuide = layoutGuide
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
        setContentHuggingPriority(.required, for: .vertical)
        titleUseButton.setTitle(resource.name, for: .normal)
        resourceCheckboxes.enumerated().forEach { index, checkbox in
            checkbox.isSelected = index < resource.usedCharges
        }
        setNeedsLayout()

        titleUseButton.addTarget(self, action: #selector(useCharge), for: .touchUpInside)
    }

    private func setupViewHierarchy() {
        let rowsCount: Int = Int(ceil(Double(resource.maximumCharges) / Double(checkboxesPerRow)))
        (1...rowsCount).forEach { row in
            let checkboxCount = row == rowsCount ? resource.maximumCharges - (row - 1) * checkboxesPerRow : checkboxesPerRow
            let checkboxViews = (0..<checkboxCount).map { _ in ResourceCheckbox() }
            let stackView = UIStackView(arrangedSubviews: checkboxViews)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 2
            if checkboxCount < checkboxesPerRow {
                stackView.addArrangedSubview(UIView())
            }
            resourcesStackView.addArrangedSubview(stackView)
        }

        [titleUseButton, resourcesStackView].forEach(addSubview)
    }

    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleUseButton.heightAnchor.constraint(equalToConstant: 32),
            titleUseButton.centerYAnchor.constraint(equalTo: resourcesStackView.arrangedSubviews.first!.centerYAnchor),
            titleUseButton.leadingAnchor.constraint(equalTo: leadingAnchor),

            resourcesStackView.topAnchor.constraint(equalTo: topAnchor),
            resourcesStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            resourcesStackView.leadingAnchor.constraint(equalTo: titleUseButton.trailingAnchor, constant: 8),
            resourcesStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    // MARK: Overrides

    /// - SeeAlso: UIView.didMoveToSuperview()
    override func didMoveToSuperview() {
        checkboxesLayoutGuide.leadingAnchor.constraint(equalTo: resourcesStackView.leadingAnchor).isActive = true
    }

    // MARK: Lifecycle

    internal func restoreAllCharges() {
        resource.usedCharges = 0
        resourceCheckboxes.forEach { $0.isSelected = false }
    }

    // MARK: Private

    @objc private func useCharge() {
        resourceCheckboxes[resource.usedCharges].isSelected = true
        resource.usedCharges = min(resource.usedCharges + 1, resource.maximumCharges - 1)
    }
}
