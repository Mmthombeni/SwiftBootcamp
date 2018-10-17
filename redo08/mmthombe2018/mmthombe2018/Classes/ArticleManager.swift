//
//  ArticleManager.swift
//  
//
//  Created by Malebo MTHOMBENI on 2018/10/12.
//

import UIKit

class ArticleManager: NSManagedObjectContext, AppDelegate, Article{
    //let bundle = Bundle(for: AmazingView.self)
    //NSBundle(forClass: AnyClass)
    
    func newArticle() -> Article {
        let article = Article()
        article.title = self.title
        article.content = self.content
        article.language = self.language
        article.image = self.image
        article.creation_date = self.creation_date
        article.modification_date = self.modification_date
        
        return (article)
    }
    
    func getAllArticles() -> [Article] {
        
        return ([])
    }
    
    func getArticles(lang: String) -> [Article] {
        return ([])
    }
    
    func getArticles(str: String) -> [Article] {
        return ([])
    }
    
    func removeArticle(article: Article) {
        
    }
    
    func save(article: Article) {
        
    }
}
