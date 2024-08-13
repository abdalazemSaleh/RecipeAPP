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
    
    private var cancellables: Set<AnyCancellable> = []
    private var searchViewModel: SearchViewModel
    
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
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var healthFilterCollectionView: UICollectionView!
    @IBOutlet private var recipesTableView: UITableView!
    
    // MARK: - VIEW MODEL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpCollectionView()
        setUpTableView()
    }
    
    // MARK: - FUNCTIONS
    
    private func setUpUI() {
        headerView.layer.cornerRadius = 24
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func setUpCollectionView() {
        healthFilterCollectionView.dataSource = self
        healthFilterCollectionView.delegate = self
        healthFilterCollectionView.register(
            UINib(
                nibName: HealthFilterCollectionViewCell.identifire,
                bundle: nil
            ),
            forCellWithReuseIdentifier: HealthFilterCollectionViewCell.identifire
        )
    }
    
    private func setUpTableView() {
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        recipesTableView.separatorStyle = .none
        recipesTableView.register(
            UINib(
                nibName: RecipeTableViewCell.identifire,
                bundle: nil
            ),
            forCellReuseIdentifier: RecipeTableViewCell.identifire
        )
    }
    
    func bindViewModel() {
    }
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HealthFilter.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HealthFilterCollectionViewCell.identifire, for: indexPath) as! HealthFilterCollectionViewCell
        let title = HealthFilter.allCases[indexPath.row]
        cell.set(with: title.rawValue)
        
        let isSelected = (indexPath == selectedIndexPath)
        cell.updateAppearance(isSelected: isSelected)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndexPath = selectedIndexPath {
            let previousCell = collectionView.cellForItem(at: previousIndexPath) as? HealthFilterCollectionViewCell
            previousCell?.updateAppearance(isSelected: false)
        }
        
        selectedIndexPath = indexPath
        let cell = collectionView.cellForItem(at: indexPath) as? HealthFilterCollectionViewCell
        cell?.updateAppearance(isSelected: true)
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return RecipeViewItem.mockData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifire, for: indexPath) as! RecipeTableViewCell
        let recipe = RecipeViewItem.mockData[indexPath.section]
        cell.set(with: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
}
