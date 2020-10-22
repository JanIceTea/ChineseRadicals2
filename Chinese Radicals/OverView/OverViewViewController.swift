//
//  OverViewViewController.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 07/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit
import TagCellLayout

protocol OverViewDisplayLogic: class {
    func displayOverView(viewModel: OverView.FetchOverView.ViewModel)
}

class OverViewViewController: UIViewController, OverViewDisplayLogic, TagCellLayoutDelegate {
    
    var interactor: OverViewBusinessLogic?
    var router: (NSObjectProtocol & OverViewRoutingLogic & OverViewDataPassing)?
    
    private var viewModel: OverView.FetchOverView.ViewModel = OverView.FetchOverView.ViewModel(radicals:[])
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupVIPCycle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupVIPCycle()
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAccessibilityIdentifers()
        performRequest()
    }
    
    // MARK: Setup
    
    private func setupVIPCycle() {
        let viewController = self
        let interactor = OverViewInteractor()
        let presenter = OverViewPresenter()
        let router = OverViewRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupUI() {
        let tagCellLayout = TagCellLayout(alignment: .center, delegate: self)
        collectionView.collectionViewLayout = tagCellLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OverViewCollectionViewCell.nib(), forCellWithReuseIdentifier: OverViewCollectionViewCell.identifier)
    }
    
    private func setupAccessibilityIdentifers() {
    
    }
    
    // MARK: Perform an initial request
    
    func performRequest() {
        let request = OverView.FetchOverView.Request()
        interactor?.fetchOverView(request: request)
    }
    
    func displayOverView(viewModel: OverView.FetchOverView.ViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
}

extension OverViewViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToDetails(from: indexPath.item)
    }
    
    func tagCellLayoutTagSize(layout: TagCellLayout, atIndex index:Int) -> CGSize {
        return CGSize(width: 180, height: 180)
    }

}

extension OverViewViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.radicals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item >= viewModel.radicals.count {
            fatalError("Mismatch of number of items and titles")
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OverViewCollectionViewCell.identifier, for: indexPath) as! OverViewCollectionViewCell
        cell.title = viewModel.radicals[indexPath.item]

        return cell
    }
}

