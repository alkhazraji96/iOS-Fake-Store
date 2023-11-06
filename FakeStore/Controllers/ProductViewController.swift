//
//  ProductViewController.swift
//  FakeStore
//
//  Created by Ameer Alkhazraji on 11/6/23.
//

import UIKit
import SwiftMessages

class ProductViewController: UIViewController {
    private let service = ProductAPI()
    private var tableView: UITableView!
    private var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        requestAPI()
    }

    private func setupUI() {
        // navigation
        title = "Products"
        navigationController?.navigationBar.prefersLargeTitles = true

        // tableView
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reusableIdentifier)
        view.addSubview(tableView)
    }

    // request products API
    private func requestAPI() {
        service.fetchProducts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.products = data
                    self?.tableView.reloadData()

                case .failure(let error):
                    self?.showSwiftMessage(config: .init(title: "Error", body: error.localizedDescription, theme: .error))
                }
            }
        }
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reusableIdentifier, for: indexPath) as! ProductCell
        cell.configure(with: products[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = products[indexPath.row].title
        showSwiftMessage(config: SwiftMessageConfig(title: "Product", body: name, theme: .info))
    }

}

