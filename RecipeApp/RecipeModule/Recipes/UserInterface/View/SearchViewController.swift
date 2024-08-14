//
//  SearchViewController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit
import Combine

protocol SearchViewControllerDependenciesProtocol {
    var searchViewModel: SearchViewModel { get set }
}

class SearchViewController: UIViewController {
    
    // MARK: - PROPERTYS
    
    var selectedIndexPath: IndexPath?
    var isDefaultSelection = true
    
    private var cancellables: Set<AnyCancellable> = []
    private(set) var searchViewModel: SearchViewModel
    
    // MARK: - INIT
    
    init(dependencies: SearchViewControllerDependenciesProtocol) {
        self.searchViewModel = dependencies.searchViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var welcomeLabel: UILabel!
    @IBOutlet private(set) var searchTextField: UITextField!
    @IBOutlet private(set) var healthFilterCollectionView: UICollectionView!
    @IBOutlet private(set) var recipesTableView: UITableView!
    @IBOutlet private(set) weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet private(set) weak var emptyStateView: EmptyStateView!
    
    // MARK: - VIEW MODEL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpCollectionView()
        setUpTableView()
        setUpTextField()
        bindViewModel()
        emptyStateView.buttonAction = { [weak self] in
            guard let self = self else { return }
            self.searchButtonAction()
        }
    }
    
    // MARK: - FUNCTIONS
    
    private func setUpUI() {
        headerView.layer.cornerRadius = 24
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func bindViewModel() {
        
        // recipesArray
        
        searchViewModel.$recipesArray
            .receive(on: DispatchQueue.main)
            .sink { [weak self] recipes in
                guard let self = self else { return }
                if !recipes.isEmpty {
                    reloadTableView()
                } else {
                    showEmptyState()
                }
            }
            .store(in: &cancellables)
        
        // isLoading
        
        searchViewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                guard let self = self else { return }
                if isLoading {
                    startLoading()
                } else {
                    activeIndicator.stopAnimating()
                }
            }
            .store(in: &cancellables)
        
        // errorMessage
        
        searchViewModel.errorMessagePassthroughSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                guard let self = self else { return }
                showAlert(
                    ofType: .error, message: "Error while geting recipes please try agine later.",
                    buttonTitle: "OK"
                )
            }
            .store(in: &cancellables)
        
        // warningMessage
        
        searchViewModel.warningMessagePassthroughSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] warningMessage in
                guard let self = self else { return }
                showAlert(
                    ofType: .warning,
                    message: warningMessage,
                    buttonTitle: "Search") { [weak self] in
                        guard let self = self else { return }
                        self.searchButtonAction()
                    }
            }
            .store(in: &cancellables)
    }
    
    private func searchButtonAction() {
        self.searchTextField.becomeFirstResponder()
    }
    
    private func reloadTableView() {
        emptyStateView.isHidden = true
        recipesTableView.isHidden = false
        recipesTableView.reloadData()
    }
    
    private func showEmptyState() {
        emptyStateView.isHidden = false
        recipesTableView.isHidden = true
        recipesTableView.reloadData()
    }
    
    private func startLoading() {
        emptyStateView.isHidden = true
        recipesTableView.isHidden = true
        activeIndicator.startAnimating()
    }
}
