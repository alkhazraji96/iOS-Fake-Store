//
//  ProductAPI.swift
//  FakeStore
//
//  Created by Ameer Alkhazraji on 11/6/23.
//

import Foundation

class ProductAPI {
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            let nsErorr = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(nsErorr))
            return
        }

        // handle network request
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            // decoding response data
            do {
                let products = try JSONDecoder().decode([Product].self, from: data!)
                completion(.success(products))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
