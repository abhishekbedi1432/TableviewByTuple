//
//  ViewController.swift
//  TableviewByTuple
//
//  Created by Abhishek Bedi on 7/16/16.
//

import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tuple = arrSections[section]
        return tuple.superheroes.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrSections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        let tuple = arrSections[indexPath.section]
        cell.textLabel?.text = tuple.superheroes[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sec = arrSections[section].sectionType
        return sec
    }
    
}


class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var marvelSuperheroes = ["Avengers","Spider-Man","Iron Man","Captain America","Deadpool","Daredevil"]
    var dcSuperheroes     = ["Superman","Batman","Wonder Woman","Green Lantern","The Flash","Aquaman"]
    var arrSections       = [(sectionType:String, superheroes:[String])]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupDataSource()
        
    }
    
    func setupDataSource() {
        
        // handle all data display here.
        arrSections.append((sectionType: "Marvel Superheroes", superheroes: marvelSuperheroes))
        arrSections.append((sectionType: "DC Superheroes", superheroes: dcSuperheroes))
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

