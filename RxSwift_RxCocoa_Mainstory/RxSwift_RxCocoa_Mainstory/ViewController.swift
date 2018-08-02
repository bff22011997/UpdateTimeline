//
//  ViewController.swift
//  RxSwift_RxCocoa_Mainstory
//
//  Created by Trung Kiên on 7/30/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController , UITableViewDelegate {
    var listPerson = NSMutableArray()
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<10 {
            let p = Person()
            p.name = String(i)
            p.age = i
            listPerson.add(p)
        }
        tblView.rowHeight = 44
        let disbag = DisposeBag()
        let list = Observable.just(Chocolate.ofEurope)
        list.bindTo(tblView
            .rx
            .items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) {
                row, chocolate, cell in
                cell.lblName.text = chocolate.countryFlagEmoji
            }
            .addDisposableTo(disbag)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }


}

