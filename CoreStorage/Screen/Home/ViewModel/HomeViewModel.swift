//
//  HomeViewModel.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit
import CoreData

class HomeViewModel {
    
    var newsData: [NewsData]?
    var newsArticles: [NewsArticle]?
    var onSuccess = Dynamic<Void>(())
    var onError = Dynamic<String>("")
    var currentIndex = 1
    
    func fetchNews(isPaginating: Bool = false) {
        
        isPaginating ? (currentIndex = currentIndex) : (currentIndex = 1)

        Network.shared.getNews(at: currentIndex) { result in
            switch result {
            case .success(let data):
                
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
//        let newsResult = DatabaseHandler.shared.fetch(NewsData.self)
//        let articleResult = DatabaseHandler.shared.fetch(NewsArticle.self)
//        newsArticles = articleResult
//        newsData = newsResult
        print(newsArticles?.count ?? 0)
    }
    
    
    
    func deleteArticle() {
        
    }
    
    
}
