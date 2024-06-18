//
//  ProductCell.swift
//  MVVMProductDemo
//
//  Created by Nitesh Sharma on 16/06/24.
//

import UIKit

class ProductCell: UITableViewCell {

    
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLable: UILabel!
    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Product?{
        didSet {
            productDetailsConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImageView.layer.cornerRadius = 10
        productBackgroundView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailsConfiguration() {
        guard let product else {return}
        productTitleLabel.text = product.title
        productCategoryLable.text = product.category
        descriptionLable.text = product.description
        priceLabel.text = "$ \(product.price)"
        ratingButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImage(with: product.image)
        
    }
    
}
