//
//  ViewController.swift
//  RxSwift_Demo
//
//  Created by Trung Kiên on 7/27/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController{

    @IBOutlet weak var tblView: UITableView!
    var listPerson = NSMutableArray()
    let list : Array<Person> = [
        Person(age: 1,name: "1"), Person(age: 2,name: "2") ,Person(age: 3,name: "3")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let disbag = DisposeBag()
//        for i in 0..<10 {
//            let p = Person()
//            p.name = String(i)
//            p.age = i
//            listPerson.add(p)
//        }
        
        
        //let list = listPerson as! Array<Person>
        
        //tblView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "TableViewCell")
        tblView.rowHeight = 90
        
//        let list = Variable<[Person]>([])
//        list.value = [ Person(age: 1,name: "1"), Person(age: 2,name: "2") ,Person(age: 3,name: "3")]
        //create obserable sequence
        
        //let helloSequence = Observable.just("Hello RxSwift")
        //let fiboSequence = Observable.from([1,1,2,3,5,8])
        //let dictSequence = Observable.from([1 : "Nguyen", 2 : "Trung"])
        
        
        // subcribe
//       let helloSequence = Observable.of("Hello RxSwift")
//        let subSciption = helloSequence.subscribe { (event) in
//            print(event)
//        }
        
        // value type
        
//        let helloSequence = Observable.from(["H" , "E" , "L" , "L" , "O"])
//        let subScription = helloSequence.subscribe { (event) in
//            switch event {
//            case .next(let value) :
//                print(value)
//
//            case .error(let error) :
//                print(error)
//
//            case .completed :
//                print("completed")
//
//            }
//        }
        
        // cancel a subscription
        
//        let bag = DisposeBag()
//        let observer = Observable.just("Hello RxSwift")
//        let sub = observer.subscribe(onNext : {print($0)
//        })
//        sub.disposed(by: bag)
        
        
        // Subject in RxSwift
        // Publish Subject -  BehaviourSubject -  ReplaySubject - Variable
        // Publish Subject - Nhận tất cả các sự kiện sảy ra sau khi đăng ký
        
        // Behaviour Subject - Sẽ cung cấp cho bất ký người đăng ký nào là phần tử gần đây nhất và mọi thứ được phát ra bởi chuỗi đó sau khi đăng ký sảy ra
        
        // Replay Subject - Phát lại nhiều hơn phần tử mới nhất cho người đăng ký  ban đầu bạn cần sử dụng replay subject - bạn có thể có bao nhiêu mục gần đây bạn muốn phát ra cho người đăng ký mới
 
        
        // Publish subject
        let bag = DisposeBag()
        let pubSub = PublishSubject<String>()
        pubSub.onNext("Nguyen ")
        pubSub.onNext("Trung ")
        pubSub.onNext("Kien")
        //print(pubSub)
        
        
        let _ = pubSub.subscribe(onNext : {print($0)}).addDisposableTo(disbag)
        pubSub.onNext("Hello")
        pubSub.onNext("Again")
        
        // Sub2 will not get "Hello" and "Again" because it susbcribed later
        _ = pubSub.subscribe(onNext:{
            print(#line,$0)
        })
        pubSub.onNext("Both Subscriptions receive this message")
        
        
        //  Marble Diagrams
        
        // from lấy gía trị
        //let s = SchedulerType()
        //Observable.from([10,20,30]).delaySubscription(10, scheduler: s)
        
        
        // interval : lấy các số nhỏ hơn
        //Observable.interval(10, scheduler: s)
        
        // of : vị trí
        //Observable.of(1)
        
        // timer : Thời gian
        
       // Observable.timer(30, period: 10, scheduler: s)
        
        //print(pubSub)
        
        
        // default empty : mặc định
        //every : kiểm tra tất cả
        //sequence equal : so sánh 2 sequence
        
        let listInt1 = Observable.from([1,2,3])
        //let listStr = Observable.from(["A","B","C"])
        let listInt2 = Observable.from([4,5,6])
        
        // combine lastest : Cộng 2 sequence theo vị trí tương ứng
        let combine = Observable.combineLatest(listInt1,listInt2) { value1 , value2 in
            print(value1 + value2)
            
        }
        
        //print(combine)
        // concat : Công sequence A vào đuôi sequence B
        let concat = listInt1.concat(listInt2)
        print(concat)
        
        // merge : Cộng theo vị trí
        let publish1 = PublishSubject<Int>()
        let publish2 = PublishSubject<Int>()
        Observable.of(publish1,publish2).merge().subscribe(onNext:{
            print($0)
        }).addDisposableTo(disbag)
        publish1.onNext(20)
        publish1.onNext(40)
        publish1.onNext(60)
        publish2.onNext(1)
        publish1.onNext(80)
        publish2.onNext(2)
        publish1.onNext(100)
        
        // race
        
        //startWith : Điểm bắt đầu
        Observable.of(2,3).startWith(1).subscribe(onNext:{
            print($0)
        }).addDisposableTo(disbag)
        
        //with lastest from : Cộng ngược tương ướng
        
        //zip : Cộng xuôi tương ứng
        
        let a = Observable.of(1,2,3,4,5)
        let b = Observable.of("a","b","c","d")
        Observable.zip(a,b){ return ($0,$1) }.subscribe {
            print($0)
        }.addDisposableTo(disbag)
        
        //distinct : Loại bỏ số giống nhau
        
        // map :
        print("Map")
        Observable<Int>.of(1,2,3,4).map { value in
            return value * 10
            }.subscribe(onNext:{
                print($0)
            }).addDisposableTo(disbag)
        
        // FlatMap
        print("FlatMap")
        let sequence1  = Observable<Int>.of(1,2,3)
        let sequence2  = Observable<Int>.of(1,2)
        let sequenceOfSequences = Observable.of(sequence1,sequence2)
        sequenceOfSequences.flatMap{ return $0 }.subscribe(onNext:{
            print($0)
        }).addDisposableTo(disbag)
        
        //Scan
        print("Scan")
        Observable.of(1,2,3,4,5).scan(0) { seed, value in
            return seed + value
            }.subscribe(onNext:{
                print($0)
            }).addDisposableTo(disbag)
        
        // buffer
        print("Buffer")
//        SequenceThatEmitsWithDifferentIntervals
//            .buffer(timeSpan: 150, count: 3, scheduler:s)
//            .subscribe(onNext:{
//                print($0)
//            })
        
        
        // Filter
        print("Filter")
        Observable.of(2,30,22,5,60,1).filter{$0 > 10}.subscribe(onNext:{
            print($0)
        }).addDisposableTo(disbag)
        
        // DistinctUntilChanged
        print("DistinctUntilChanged")
        Observable.of(1,2,2,1,3).distinctUntilChanged().subscribe(onNext:{
            print($0)
        }).addDisposableTo(disbag)
        
        
        
        // Side Effects
        print("Side Effects")
        Observable.of(1,2,3,4,5).do(onNext: { value in
           value * 10
        }).subscribe(onNext:{
            print($0)
        }).addDisposableTo(disbag)
        
        // Schedulers
        
        // MainScheduler
        
        //CurrentThreadScheduler
        
        // SerialDispatchQueueScheduler
        
        //ConcurrentDispatchQueueScheduler
        
        //OperationQueueScheduler
        
        let publish11 = PublishSubject<Int>()
        let publish22 = PublishSubject<Int>()
        let concurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
        Observable.of(publish11,publish22)
            .observeOn(concurrentScheduler)
            .merge()
            .subscribeOn(MainScheduler())
            .subscribe(onNext:{
                print($0)
            }).addDisposableTo(disbag)
        publish1.onNext(20)
        publish1.onNext(40)
        print("Test")
        let objArray : Observable<[Person]> = Observable.just(list)
        let observer = Observable.just(list)
        _ = observer.subscribe(onNext: { (person) in
            print(person[0].name)
        })
//        tblView.rx.setDelegate(self)
//            .disposed(by: disbag)
//        tblView.rx.setDataSource(self as! UITableViewDataSource).disposed(by: disbag)
//        objArray.asObservable()
//            .bind(to: tblView.rx.items) {(tableView ,row , person : Person) in
//               // let indexPath = IndexPath(row: row, section: 0)
//                //let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" , for : indexPath) as! TableViewCell
//                let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
//
//            cell.lblName.text = person.name
//            cell.lblPrice.text = String(person.age)
//            return cell
//
//        }.disposed(by: disbag)
        objArray.bind(to:tblView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) {
            row , person , cell in
            cell.lblName.text = person.name
        }.addDisposableTo(disbag)
//        objArray.asObservable()
//            .bind(to: self.tblView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) {
//            _ , person , cell in
//            cell.lblName.text = person.name
//        }.disposed(by: disbag)

//        objArray.bind(to: tblView.rx.items(cellIdentifier: "TableViewCell")) { (index, person: Person, cell) in
//
//            cell.textLabel?.text = person.name
//
//        }.disposed(by: disbag)
        
        
        
        
        tblView.rx.modelSelected(Person.self).subscribe(onNext: { (value) in
            print(value.name)
        }).addDisposableTo(disbag)
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    



}
