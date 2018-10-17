//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Malebo MTHOMBENI on 2018/10/12.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var modification_date: NSDate?
    
    override var description: String {
        return "\(self.title) \n \(self.content) \n \(self.language) \n \(self.creation_date) \n \(self.modification_date)"
    }

}
