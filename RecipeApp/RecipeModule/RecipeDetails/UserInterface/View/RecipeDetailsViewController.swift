//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit
import Combine

protocol RecipeDetailsViewControllerDependenciesProtocol {
    var recipeDetailsViewModel: RecipeDetailsViewModel { get set }
}

class RecipeDetailsViewController: UIViewController {
    
    // MARK: - PROPERTYS
    
    private(set) var recipeDetailsViewModel: RecipeDetailsViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - INIT
    
    init(dependencies: RecipeDetailsViewControllerDependenciesProtocol) {
        recipeDetailsViewModel = dependencies.recipeDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBOutlet
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var recipeImageView: CachedImageView!
    @IBOutlet private var recipeLable: UILabel!
    @IBOutlet private var recipeCaloriesLabel: UILabel!
    @IBOutlet private var recipeWeightLabel: UILabel!
    @IBOutlet private var recipeTimeLabel: UILabel!
    @IBOutlet weak var dietLabelStackView: UIStackView!
    @IBOutlet var recipeDietLabelCollectionView: UICollectionView!
    @IBOutlet var recipeIngredientTableView: UITableView!
    @IBOutlet var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var activeIndicator: UIActivityIndicatorView!
    
    // MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpTableView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - FUNCTIONS
    
    private func updateUI(recipe: RecipeDetailsViewItem) {
        recipeImageView.imageURL = recipe.image.asURL
        recipeLable.text = recipe.label
        recipeCaloriesLabel.text = recipe.calories
        recipeWeightLabel.text = recipe.totalWeight
        recipeTimeLabel.text = recipe.totalTime
        if !recipeDetailsViewModel.recipeLabels.isEmpty {
            dietLabelStackView.isHidden = false
            recipeDietLabelCollectionView.reloadData()
        } else {
            dietLabelStackView.isHidden = true
        }
    }
    
    private func startLoading() {
        containerView.isHidden = true
        activeIndicator.startAnimating()
    }
    
    private func stopLoading() {
        containerView.isHidden = false
        activeIndicator.stopAnimating()
    }
}

// MARK: - RECIPE DETAILS DATA BINDE

extension RecipeDetailsViewController {
    private func bindViewModel() {
        recipeDetailsViewModel.recipeDetailsViewItem
            .receive(on: DispatchQueue.main)
            .sink { [weak self] recipeDetails in
                guard let self = self else { return }
                updateUI(recipe: recipeDetails)
            }
            .store(in: &cancellables)
        
        // isLoading
        
        recipeDetailsViewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                guard let self = self else { return }
                if isLoading {
                    startLoading()
                } else {
                    stopLoading()
                }
            }
            .store(in: &cancellables)
        
        // errorMessage
        
        recipeDetailsViewModel.errorMessagePassthroughSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                guard let self = self else { return }
                showAlert(
                    ofType: .error, message: "Error while geting recipes please try agine later.",
                    buttonTitle: "OK"
                )
            }
            .store(in: &cancellables)        
    }
}
