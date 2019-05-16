//
//  ViewController.swift
//  Simple TableView02
//
//  Created by D7703_23 on 2019. 5. 2..
//  Copyright © 2019년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var myTableView: UITableView!
    var animals = ["Cat","Dog","Bird","Pig","Horse","Whale"]
    var kor = ["고양이","강아지","새","돼지","말","고래"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
        
        //navigationBar
        self.title = "동물농장"
    }
    
    // UITableViewDataSource Method
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return animals.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if section == 0 {
            return "Animal Farm 1"
        }else{
            return "Animal Farm 2"
        }
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        if section == 0 {
            return "End of Animal Farm 1"
        }else{
            return "End of Animal Farm 2 "
        }
    }
    
    
    // cell을 생성
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        // cell 생성, 재활용 풀 사용
        let cell = myTableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath)
        let row = indexPath.row
        print("section: \(indexPath.section)    row:\(indexPath.row)")
    
        cell.textLabel?.text = animals[row]
        cell.detailTextLabel?.text = kor[row]
        
        //image넣기
        cell.imageView?.image = UIImage(named: animals[row])
        return cell
    }
    
    // DetailViewController의 myData 변수에 "Cat"를 보냄
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addgo" {
            let addVC = segue.destination as! AddViewController
            addVC.myData = animals[1]
            addVC.myImage = animals[1]
            addVC.myTitle = kor[1]
            
        } else if segue.identifier == "detailgo" {
            let detailVC = segue.destination as! DetailViewController
            
            // 현재 선택된 indexPath.row
            let myIndexPath = myTableView.indexPathForSelectedRow
            let myRow = myIndexPath?.row
            
            detailVC.myData = animals[myRow!]
            detailVC.myImage = animals[myRow!]
            detailVC.myTitle = kor[myRow!]
            
        }
    }
}

