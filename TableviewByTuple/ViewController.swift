//
//  ViewController.swift
//  TableviewByTuple
//
//  Created by Abhishek Bedi on 7/16/16.
//

import UIKit

enum Section {
    
    case marvelSuperheroes
    case dcSuperheroes

    var title: String {
        switch self {
        case .marvelSuperheroes:
            return "Marvel Superheroes"
            
        case .dcSuperheroes:
            return "DC Superheroes"
        }
    }
}

class ViewController: UIViewController {
    
    /// IBOutlet(s)
    @IBOutlet weak var table: UITableView!
    
    
    /// Variables
    var marvelSuperheroes = ["Avengers","Spider-Man","Iron Man","Captain America","Deadpool","Daredevil"]
    var dcSuperheroes     = ["Superman","Batman","Wonder Woman","Green Lantern","The Flash","Aquaman"]
    
    // This array is the datasource array consisting of
    var sections       = [(sectionType:Section, superheroes:[String])]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupDataSource()
    }
    
    
    func setupDataSource() {
        
        // handle all data display here.
        sections.append((sectionType: .marvelSuperheroes, superheroes: marvelSuperheroes))
        sections.append((sectionType: .dcSuperheroes, superheroes: dcSuperheroes))
    }
}




extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].superheroes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionType.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell              = tableView.dequeueReusableCell(withIdentifier: "Cell")

        let tuple             = sections[indexPath.section]

        cell?.textLabel?.text = tuple.superheroes[indexPath.row]
        
        return cell!
    }
}
