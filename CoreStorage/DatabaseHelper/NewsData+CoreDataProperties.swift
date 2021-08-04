//
//  NewsData+CoreDataProperties.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//
//

import Foundation
import CoreData


extension NewsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsData> {
        return NSFetchRequest<NewsData>(entityName: "NewsData")
    }

    @NSManaged public var status: String?
    @NSManaged public var totalResults: Int64
    @NSManaged public var articles: Set<NewsArticle>?

}

// MARK: Generated accessors for articles
extension NewsData {

    @objc(addArticlesObject:)
    @NSManaged public func addToArticles(_ value: NewsArticle)

    @objc(removeArticlesObject:)
    @NSManaged public func removeFromArticles(_ value: NewsArticle)

    @objc(addArticles:)
    @NSManaged public func addToArticles(_ values: NSSet)

    @objc(removeArticles:)
    @NSManaged public func removeFromArticles(_ values: NSSet)

}

extension NewsData : Identifiable {

}
