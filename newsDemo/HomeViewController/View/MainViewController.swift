//
//  ViewController.swift
//  newsDemo
//
//  Created by Hrishav on 27/7/21.
//

import UIKit

protocol PaginationProtocol:AnyObject{
    func loadData()
    func setupCell(tableView: UITableView, indexPath: IndexPath)
}
class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    private var mainViewModel: MainViewModel!
    
    let mainTableView = UITableView()

    var numbers=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,19,20,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    var sum:Int!=0
    
  
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row ==  numbers.count - 1 {
            loadData()
        }
    }
    
    var number:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
      //  setupView()
     
      //  numberForSection()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(mainTableView)
        callToViewModelForUIUpdate()
        setUpTable()
 
      
        // Do any additional setup after loading the view.
    }
    
    func callToViewModelForUIUpdate(){
        self.mainViewModel =  MainViewModel()
        self.mainViewModel.bindEmployeeViewModelToController = {
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
       
    }
    
    func numberForSection() -> Int {
        
        if self.mainViewModel == mainViewModel {
        self.mainViewModel.bindNewsCountToController = {
            let count = self.mainViewModel.numberOfSections
            print("the count is: ", count)
            self.number = count
            
        }
            return number!
        }
            return 0
        
    }
    
    func setUpTable(){
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.mainViewModel == mainViewModel {
            return mainViewModel.numberOfSections
        }
        
          
        return 59
           
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = .lightGray
      
        if self.mainViewModel == mainViewModel{
            
            let data = mainViewModel.newsData?.articles
          cell.textLabel?.text = data?[indexPath.row].title
            
        }
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
extension MainViewController{
    func setupView(){
   
        
        mainTableView.delegate = self
        mainTableView.delegate = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(mainTableView)
 
        self.title = "Pagination TableView"
        
      
       
    }
    func loadData(){
        for _ in 0..<20{
            sum = numbers[numbers.count-1] + 1
            numbers.append(sum)
        }
        mainTableView.reloadData()
    }
    


}
extension MainViewController{
    func setupCell(tableView: UITableView, indexPath: IndexPath)->UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if indexPath.row < numbers.count {
            cell?.backgroundColor = .gray
            cell?.textLabel?.textColor = .black
            cell?.textLabel?.text = "check"
        }
        return cell!
    }
}

