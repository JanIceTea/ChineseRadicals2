//
//  DetailViewController.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright (c) 2018 teatracks. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {
    func displayDetail(viewModel: Detail.FetchDetail.ViewModel)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var examplesTextView: UITextView!

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupVIPCycle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupVIPCycle()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
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
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupUI() {
        
    }
    
    private func setupAccessibilityIdentifers() {
    
    }
    
    // MARK: Perform an initial request
    
    func performRequest() {
        let request = Detail.FetchDetail.Request()
        interactor?.fetchDetail(request: request)
    }
    
    func displayDetail(viewModel: Detail.FetchDetail.ViewModel) {
        textView.text = viewModel.description
        headerLabel.text = viewModel.header
        examplesTextView.text = viewModel.exampleWordsDescription
    }
}
