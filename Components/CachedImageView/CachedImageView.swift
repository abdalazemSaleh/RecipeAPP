//
//  CachedImageView.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

@IBDesignable
class CachedImageView: UIImageView {
    
    // MARK: - PROPERTYS
    
    var imageURL: URL? {
        didSet {
            if let url = imageURL {
                loadImage(from: url)
            }
        }
    }
    
    @IBInspectable var defaultImage: UIImage?
            
    private let activityIndicator = UIActivityIndicatorView(style: .medium)

    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImageView()
    }
    
    // MARK: - FUNCTIONS
    
    private func setupImageView() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Image Loading
    
    private func loadImage(from url: URL) {
        activityIndicator.startAnimating()
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)),
           let image = UIImage(data: cachedResponse.data) {
            self.image = image
            activityIndicator.stopAnimating()
            return
        }
        
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    self.image = image
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
                }
                activityIndicator.stopAnimating()
            } catch {
                print("Error downloading image: \(error)")
                self.image = defaultImage
                activityIndicator.stopAnimating()
            }
        }
    }
}
