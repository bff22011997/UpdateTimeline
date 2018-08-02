//
//  ViewController.swift
//  Alamofire_Param
//
//  Created by Trung Kiên on 8/2/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    var listData : [[String : AnyObject]] = [[String : AnyObject]]()
    var listCategory : NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate  = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        getDataFromAPI()
        
    }
    func getDataFromAPI() -> Void {
        let url = "http://27.72.88.241:8888/hicom-waiter/index.php/api/product"
        let param  = ["CategoryId" : "8"] as [String : Any]
        
        do {
            let urlRequest = try URLRequest(url: URL(string: (url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!))!, method: .get, headers: nil)
            let encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: param)
            Alamofire.request(encodedURLRequest).responseJSON { (response) in
                switch response.result {
                case .success :
                    if let dictionary = response.result.value as? [String : AnyObject]{
                        DispatchQueue.main.async {
                            self.listData = dictionary["data"] as! [[String : AnyObject]]
                            for i in 0...self.listData.count-1 {
                                let cat = Category()
                                var categoryRes = self.listData[i]
                                cat.IDCategory = categoryRes["id"] as! String
                                cat.codeCategory = String(categoryRes["code"] as! Int)
                                cat.priceCategory = String(categoryRes["price"] as! Int)
                                cat.numberNameCategory = String(categoryRes["numbername"] as! Int)
                                cat.nameCategory = categoryRes["name"] as! String
                                cat.categoryId = categoryRes["categoryId"] as! String
                                self.listCategory.add(cat)
                            }
                            self.tableView.reloadData()
                            
                        }
                        
                    }
                    
                case .failure :
                    print(Error.self)
                    
                }
            }
        } catch {
            
        }
}


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCategory.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (100 - tableView.bounds.size.height / 6) != 0 ? 100 : tableView.bounds.size.height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let category = self.listCategory.object(at: indexPath.row) as! Category
        cell.lblName.text = category.nameCategory
        cell.lblPrice.text = category.priceCategory
        cell.lblNumber.text = "0"
        cell.selectionStyle = .none
        return cell
    }

}
