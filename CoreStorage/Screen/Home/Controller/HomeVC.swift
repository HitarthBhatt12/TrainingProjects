//
//  HomeVC.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 02/08/21.
//

import UIKit

class HomeVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var coordinator: HomeCoordinator?
    let homeModel = HomeViewModel()
    var refreshController: UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        self.homeModel.fetchNews()
        bindViewModel()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 150
        
        self.refreshController = UIRefreshControl()
        self.refreshController?.tintColor = .white
        tableView.refreshControl = refreshController
        refreshController?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        let nib = UINib(nibName: "UserViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserViewCell")
    }
    
    func bindViewModel() {
        homeModel.onSuccess.bind { _ in
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.tableFooterView = UIView(frame: .zero)
        }
        homeModel.onError.bind { error in
            print(error)
        }
        
        
    }
    
    
    @IBAction func didTapAdd(_ sender: Any) {
//        self.coordinator?.goToAddUser()
        let indexPath = IndexPath(row: self.tableView.numberOfRows(inSection: 0) - 1, section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        
    }
    
    @objc func refresh() {
        self.homeModel.fetchNews()
    }
    
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeModel.newsArticles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell", for: indexPath) as? UserViewCell {
        
            guard let data = self.homeModel.newsArticles?[indexPath.row] else { return cell}
            
            cell.configure(title: data.title ?? "",
                           desc: data.articleDescription ?? "",
                           image: data.urlToImage ?? Data(),
                           authorName: data.author ?? "")
            
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            guard let data = (self.homeModel.newsArticles?[indexPath.row]) else { return }
            DatabaseHandler.shared.delete(data)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.image = UIImage(systemName: "trash")
        action.backgroundColor = .systemRed
        
        return action
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let data = self.homeModel.newsArticles else {return}
        guard let limit = self.homeModel.limit else {return}
        
        if (indexPath.row == data.count - 1), (data.count < limit)  {
            self.tableView.tableFooterView = loadingView()
            self.homeModel.currentIndex += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.homeModel.fetchNews(isPaginating: true)
            }
        }
    }
    
    func loadingView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        spinner.color = .white
        spinner.style = .medium
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    
}
