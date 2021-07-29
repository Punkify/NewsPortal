//
//  MainViewModel.swift
//  newsDemo
//
//  Created by Hrishav on 29/7/21.
//

import Foundation

class MainViewModel : NSObject {
    
    
    
    private var apiService : APIService!
    
    private var model: MainModel?
    
  //  var session: URLSession
    
//    init(configuration: URLSessionConfiguration) {
//        self.session = URLSession(configuration: configuration)
//    }
//
    private(set) var newsData : MainModel! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    private(set) var countData : MainModel! {
        didSet {
            self.bindEmployeeViewModelToController()
           
          
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    var bindNewsCountToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
     
        callFuncToGetEmpData()
       
    }
    
    var numberOfSections = 40
    

//    var numberOfSections: Int? {
//        didSet{
//            self.bindNewsCountToController()
//        }
//    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeData { (newsData) in
            self.newsData = newsData
           // self.numberOfSections = newsData.articles!.count
        }
    }
    

  
}
