//
//  News.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//


import Foundation
import FMDB
import RealmSwift

protocol ResultSet {
    init(resultSet rs: FMResultSet)
}

// MARK: - Welcome
struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    var articles: [Article]?
    
}

// MARK: - Article
class Article: Codable, ResultSet {
    let author: String?
    let title: String?
    let articleDescription: String?
    let urlToImage: String?
    var imageToData = Data()
    var id = 0
    
    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case urlToImage
    }
    
    init(author: String?, title: String?, articleDescription: String?, urlToImage: String?) {
        self.author = author
            self.title = title
            self.articleDescription = articleDescription
            self.urlToImage = urlToImage
        self.imageToData = urlToData(url: urlToImage ?? "") ?? Data()
    }
    
    required init(resultSet rs: FMResultSet) {
        self.author = rs.string(forColumn: "author")
        self.title = rs.string(forColumn: "title")
        self.articleDescription = rs.string(forColumn: "articleDescription")
        self.urlToImage = ""
        self.imageToData = rs.data(forColumn: "urlToImage") ?? Data()
        self.id = Int(rs.int(forColumn: "id"))
    }
    
    
    func storeArticle() {
        let availData: [Article] = DatabaseHandler.shared.fetch(from: "Article")

        if (availData.isEmpty) || !checkAvail(availData: availData, value: title ?? "") {
            
            let article = Article(author: author,
                                  title: title,
                                  articleDescription: articleDescription,
                                  urlToImage: urlToImage)

            guard let imageData = urlToData(url: urlToImage ?? "") else { return }
            
            DatabaseHandler.shared.save(article, imageData: imageData)
        }
        
    }
    
    
    func checkAvail(availData: [Article], value: String) -> Bool {
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


