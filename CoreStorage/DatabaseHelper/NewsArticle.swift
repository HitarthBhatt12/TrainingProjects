//
//  NewsArticle.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 04/08/21.
//
//

import Foundation
import RealmSwift


class NewsArticle: Object {

    @objc dynamic var articleDescription: String?
    @objc dynamic var author: String?
    @objc dynamic var title: String?
    @objc dynamic var urlToImage: Data?
}

class NewsData: Object {
    @objc dynamic var status: String = ""
    @objc dynamic var totalResults: Int = 0
}
