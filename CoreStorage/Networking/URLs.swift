//
//  URLs.swift
//  APICaller
//
//  Created by Hitarth Bhatt on 29/07/21.
//

import Foundation

let BaseUrl = "https://crudcrud.com/Dashboard/1d19457b7bb04a49a13f6c513c7ce392"

let GETUSER = "/user"
let CREATEUSER = "/user/"
let UPDATEUSER = "/user/"
let DELETEUSER = "/user/"


func getNewsApi(at pageNo: Int) -> String {
    
    let pageNo = String(pageNo)
    let NewsApi = "https://newsapi.org/v2/top-headlines?country=in&pageSize=10&page=\(pageNo)&apiKey=e15ba26e6bd44ba081b44ef5c082dac9"
    
    return NewsApi
}
