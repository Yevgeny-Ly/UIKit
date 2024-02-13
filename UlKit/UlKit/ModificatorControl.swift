// ModificatorControl.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Компонент в виде квадратной кнопки с картинкой и текстом
final class ModificatorControl: UIView {
    // MARK: - Visual Components

    private lazy var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 32, y: 17, width: 100, height: 100))
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var modificatorLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 117, width: bounds.width, height: 38))
        label.font = UIFont.verdana14()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - Public Properties

    var isSelected = false {
        didSet {
            layer.borderColor = isSelected ? UIColor.specialGreen.cgColor : UIColor.grayLight.cgColor
        }
    }

    var tapHandler: ((_ control: ModificatorControl) -> Void)? {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectModificator))
            tapGesture.numberOfTapsRequired = 1
            addGestureRecognizer(tapGesture)
        }
    }

    @objc private func selectModificator() {
        tapHandler?(self)
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Public Methods

    func setImage(_ image: UIImage) {
        imageView.image = image
    }

    func setLabelText(_ text: String) {
        modificatorLabel.text = text
    }

    func addTapHandler(target: Any, action: Selector) {}

    // MARK: - Private Methods

    private func setupView() {
        isUserInteractionEnabled = true

        frame.size = CGSize(width: 165, height: 165)
        isUserInteractionEnabled = true
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayLight.cgColor
        backgroundColor = .grayLight

        addSubview(imageView)
        addSubview(modificatorLabel)
    }
}
