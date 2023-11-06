//
//  ProductCell.swift
//  FakeStore
//
//  Created by Ameer Alkhazraji on 11/6/23.
//

import Foundation
import UIKit
import Kingfisher

class ProductCell: UITableViewCell, SelfConfiguringCell {
    static var reusableIdentifier: String {String(describing: Self.self)}
    private let name = UILabel()
    private let price = UILabel()
    private let rating = UILabel()
    private let ratingCount = UILabel()
    private let starIcon = UIImageView()
    private let productImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    private func setupUI() {
        // productImage
        productImage.layer.cornerRadius = 4
        productImage.clipsToBounds = true
        productImage.contentMode = .scaleAspectFill
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(100)
        }

        // name
        name.numberOfLines = 2
        contentView.addSubview(name)
        name.snp.makeConstraints { make in
            make.leading.equalTo(productImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(productImage)
        }

        // price
        contentView.addSubview(price)
        price.snp.makeConstraints { make in
            make.leading.equalTo(name)
            make.top.equalTo(name.snp.bottom).offset(8)
        }

        // starIcon
        starIcon.image = UIImage(named: "star")
        contentView.addSubview(starIcon)
        starIcon.snp.makeConstraints { make in
            make.leading.equalTo(name)
            make.top.equalTo(price.snp.bottom).offset(8)
            make.height.width.equalTo(17)
        }

        // rating
        contentView.addSubview(rating)
        rating.snp.makeConstraints { make in
            make.leading.equalTo(starIcon.snp.trailing).offset(4)
            make.centerY.equalTo(starIcon)
        }

        // ratingCount
        contentView.addSubview(ratingCount)
        ratingCount.snp.makeConstraints { make in
            make.leading.equalTo(rating.snp.trailing).offset(4)
            make.centerY.equalTo(starIcon)
        }
    }

    func configure(with data: Product) {
        productImage.kf.setImage(with: URL(string: data.image)!)
        name.text = data.title
        price.text = "$\(data.price)"
        rating.text = String(data.rating.rate)
        ratingCount.text = "(\(data.rating.count))"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
