//
//  NewsArticle+CoreDataProperties.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 04/08/21.
//
//

import Foundation
import CoreData


extension NewsArticle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsArticle> {
        return NSFetchRequest<NewsArticle>(entityName: "NewsArticle")
    }

    @NSManaged public var articleDescription: String?
    @NSManaged public var author: String?
    @NSManaged public var title: String?
    @NSManaged public var urlToImage: Data?
    @NSManaged public var parent: NewsData?

}

extension NewsArticle : Identifiable {

}
