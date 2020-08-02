//
//  CharacterCollectionViewCell.swift
//  DnD5PartyTracker
//

import UIKit

internal final class CharacterCollectionViewCell: UICollectionViewCell {

    // MARK: Properties

    /// Reuse identifier for `Character Collection View Cell`.
    static internal let reuseIdentifier: String = "CharacterCell"

    private let attunementsLabelText = "Attunements: "
    private let ammoLabelText = "Ammuniton: "

    private var playerCharacter: PlayerCharacter?

    // MARK: Hierarchy

    private let characterPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        return label
    }()

    private let classLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Class Level"
        return label
    }()

    private lazy var shortRestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Short Rest", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        button.layer.cornerRadius = 4
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
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(doLongRest), for: .touchUpInside)
        return button
    }()

    private lazy var attunementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(attunementsLabelText)\(0)"
        return label
    }()

    private lazy var attunementStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.maximumValue = 3
        stepper.transform = CGAffineTransform(scaleX: 0.6, y: 0.8)
        stepper.addTarget(self, action: #selector(updateAttunementsLabel), for: .valueChanged)
        return stepper
    }()

    private lazy var ammoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(ammoLabelText)\(0)"
        return label
    }()

    private lazy var ammoStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.maximumValue = 50
        stepper.transform = CGAffineTransform(scaleX: 0.75, y: 0.9)
        stepper.addTarget(self, action: #selector(updateAmmoLabel), for: .valueChanged)
        return stepper
    }()

    private let resourcesContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()

    private let spellsContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    private let spellsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Spell Slots"
        label.textAlignment = .center
        return label
    }()

    private let featuresContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    private let featuresTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Features"
        label.textAlignment = .center
        return label
    }()

    private let spellSlotsLayoutGuide = UILayoutGuide()

    private let featureChargesLayoutGuide = UILayoutGuide()

    // MARK: Initializers

    /// - SeeAlso: UICollectionViewCell.init(frame:).
    override internal init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupViewHierarchy()
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupProperties() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    private func setupViewHierarchy() {
        spellsContainer.addArrangedSubview(spellsTitleLabel)
        featuresContainer.addArrangedSubview(featuresTitleLabel)
        [spellsContainer, featuresContainer].forEach(resourcesContainer.addArrangedSubview)
        [
            characterPhoto,
            nameLabel,
            classLabel,
            shortRestButton,
            longRestButton,
            attunementLabel,
            attunementStepper,
            ammoLabel,
            ammoStepper,
            resourcesContainer,
        ].forEach(contentView.addSubview)

        [spellSlotsLayoutGuide, featureChargesLayoutGuide].forEach(contentView.addLayoutGuide)
    }

    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate(
            [
                characterPhoto.heightAnchor.constraint(equalToConstant: 100),
                characterPhoto.widthAnchor.constraint(equalToConstant: 100),
                characterPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                characterPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),

                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                nameLabel.leadingAnchor.constraint(equalTo: characterPhoto.trailingAnchor, constant: 8),

                classLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                classLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                classLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),

                shortRestButton.heightAnchor.constraint(equalToConstant: 32),
                shortRestButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                shortRestButton.trailingAnchor.constraint(equalTo: longRestButton.leadingAnchor, constant: -8),

                longRestButton.heightAnchor.constraint(equalTo: shortRestButton.heightAnchor),
                longRestButton.topAnchor.constraint(equalTo: shortRestButton.topAnchor),
                longRestButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

                attunementLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 8),
                attunementLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

                attunementStepper.centerYAnchor.constraint(equalTo: attunementLabel.centerYAnchor),
                attunementStepper.leadingAnchor.constraint(equalTo: attunementLabel.trailingAnchor, constant: -8),

                ammoLabel.heightAnchor.constraint(equalTo: attunementLabel.heightAnchor),
                ammoLabel.centerYAnchor.constraint(equalTo: attunementLabel.centerYAnchor),
                ammoLabel.leadingAnchor.constraint(equalTo: attunementStepper.trailingAnchor),

                ammoStepper.centerYAnchor.constraint(equalTo: ammoLabel.centerYAnchor),
                ammoStepper.leadingAnchor.constraint(equalTo: ammoLabel.trailingAnchor, constant: -8),
                ammoStepper.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -4),

                resourcesContainer.topAnchor.constraint(equalTo: characterPhoto.bottomAnchor, constant: 8),
                resourcesContainer.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
                resourcesContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                resourcesContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

                spellSlotsLayoutGuide.topAnchor.constraint(equalTo: spellsContainer.topAnchor),
                spellSlotsLayoutGuide.bottomAnchor.constraint(equalTo: spellsContainer.bottomAnchor),
                spellSlotsLayoutGuide.trailingAnchor.constraint(equalTo: spellsContainer.trailingAnchor),

                featureChargesLayoutGuide.topAnchor.constraint(equalTo: featuresContainer.topAnchor),
                featureChargesLayoutGuide.bottomAnchor.constraint(equalTo: featuresContainer.bottomAnchor),
                featureChargesLayoutGuide.trailingAnchor.constraint(equalTo: featuresContainer.trailingAnchor),
            ]
        )
    }

    // MARK: Lifecycle

    internal func setup(with character: PlayerCharacter) {
        playerCharacter = character
        characterPhoto.image = character.photo
        nameLabel.text = character.name
        classLabel.text = character.characterClass.classString
        attunementStepper.value = character.attunementSlots
        attunementLabel.text = "\(attunementsLabelText)\(Int(attunementStepper.value))"
        ammoStepper.maximumValue = character.maximumAmmunition
        ammoStepper.value = character.currentAmmunition
        ammoLabel.text = "\(ammoLabelText)\(Int(ammoStepper.value))"
        character.spellSlots
            .map { [unowned self] resource in
                UsableResourceView(resource: resource, layoutGuide: self.spellSlotsLayoutGuide)
            }
            .forEach(spellsContainer.addArrangedSubview)
        spellsContainer.addArrangedSubview(UIView())
        character.features
            .map { [unowned self] resource in
                UsableResourceView(resource: resource, layoutGuide: self.featureChargesLayoutGuide)
            }
            .forEach(featuresContainer.addArrangedSubview)
        featuresContainer.addArrangedSubview(UIView())
    }

    // MARK: Actions

    @objc private func updateAttunementsLabel() {
        attunementLabel.text = "\(attunementsLabelText)\(Int(attunementStepper.value))"
        playerCharacter?.attunementSlots = attunementStepper.value
    }

    @objc private func updateAmmoLabel() {
        ammoLabel.text = "\(ammoLabelText)\(Int(ammoStepper.value))"
        playerCharacter?.currentAmmunition = ammoStepper.value
    }

    @objc internal func doShortRest() {
        resourcesContainer.arrangedSubviews
            .compactMap { $0 as? UIStackView }
            .flatMap { $0.arrangedSubviews }
            .compactMap { $0 as? UsableResourceView }
            .filter { $0.restType == .short }
            .forEach { $0.restoreAllCharges() }
    }

    @objc internal func doLongRest() {
        resourcesContainer.arrangedSubviews
            .compactMap { $0 as? UIStackView }
            .flatMap { $0.arrangedSubviews }
            .compactMap { $0 as? UsableResourceView }
            .forEach { $0.restoreAllCharges() }
    }
}
