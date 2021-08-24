//
//  HomeViewModel.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit

class HomeViewModel {
    
    var limit: Int?
    var newsArticles: [Article]?
    var onSuccess = Dynamic<Void>(())
    var onError = Dynamic<String>("")
    var currentIndex = 1
    
    func fetchNews(isPaginating: Bool = false) {
        
        isPaginating ? (currentIndex = currentIndex) : (currentIndex = 1)

        Network.shared.getNews(at: currentIndex) { result in
            switch result {
            case .success(let data):
                
                self.limit = data.totalResults
                guard  let newArticles = data.articles else { return }
                newArticles.forEach { $0.storeArticle() }
                
                self.fetchLocalData()
                self.onSuccess.fire()
            case .failure(let error):
                self.onError.value = error.localizedDescription
            }
        }
    }
    
    func fetchLocalData() {
        self.newsArticles = DatabaseHandler.shared.fetch(from: "Article")
        print(newsArticles?.count ?? 0)
    }
}
