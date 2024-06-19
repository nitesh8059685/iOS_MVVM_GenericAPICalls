//
//  ProductListViewController.swift
//  MVVMProductDemo
//
//  Created by Nitesh Sharma on 15/06/24.
//

import UIKit

class ProductListViewController: UIViewController {

    private var viewModel = ProductViewModel()
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    @IBAction func addProductButtonTapped(_ sender: UIBarButtonItem) {
        let product = AddProduct(title: "BMW")
        viewModel.addProduct(parameters: product)
    }
}

extension ProductListViewController {
    
    func configuration() {
        productTableView.register(UINib(nibName: Constant.API.productCell, bundle: nil), forCellReuseIdentifier: Constant.API.productCell)
        
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    // It will Obsorve data Binding event  -  Communication
    func observeEvent() {
        
        viewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading: break
            case .stopLoading: break
            case .dataLoaded:
//                UI Works Well in main Queue
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                    print(self.viewModel.products)
                }
            case .error(let error):
                print(error)
            case .newProductAdded(let newProduct):
                print(newProduct)
            }
        }
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.API.productCell, for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        
        cell.product = product
        return cell
    }
    
    
}
