//
//  popOverViewController.swift
//  headtTest
//
//  Created by Jay Kumar on 7/15/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//

import UIKit
import CoreData

protocol selectRationg {
    func ratingName(name : Ranking)
}
class popOverViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    lazy var ranking : [Ranking] = []
    let customeCell = "customeCell"
    @IBOutlet weak var listView: UITableView!
     var delegate: selectRationg?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listView.register(UINib(nibName :"ratingCustomeCell" , bundle : nil), forCellReuseIdentifier: customeCell)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
            getrankItem()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func getrankItem() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let rank : NSFetchRequest<Ranking> = Ranking.fetchRequest()
        do{
            let fetchcat = try context.fetch(rank)
            for item in fetchcat{
                ranking.append(item)
            }
        }catch {
            fatalError("Failed to fetch person: \(error)")
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranking.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:customeCell, for: indexPath) as! ratingCustomeCell
        
        let rank = ranking[indexPath.row];
        cell.nameLBL.text = rank.ranking
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let rank = ranking[indexPath.row];
        delegate?.ratingName(name: rank)
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
