//
//  News.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//


import Foundation
import RealmSwift


// MARK: - Welcome
struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    var articles: [Article]?
    
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title: String?
    let articleDescription: String?
    let urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case urlToImage
    }
    
    func storeArticle() {
        guard let availData = DatabaseHandler.shared.fetch(NewsArticle.self) else { return }

        if (availData.isEmpty) || !checkAvail(availData: availData, value: title ?? "") {
            guard let article = DatabaseHandler.shared.add(NewsArticle.self) else { return }
            article.title = title
            article.articleDescription = articleDescription
            article.author = author

            guard let imageData = urlToData(url: urlToImage ?? "") else { return }
            article.urlToImage = imageData
            DatabaseHandler.shared.save(article)
        }
        
    }
    
    
    func checkAvail(availData: Results<NewsArticle>, value: String) -> Bool {
        for data in availData {
            if data.title == title {
                return true
            }
        }
        return false
    }
    
    
    func urlToData(url: String) -> Data? {
        if let stringUrl = URL(string: url), let data = try? Data(contentsOf: stringUrl) {
                return data
            }
        return Data()
        }
    
}


