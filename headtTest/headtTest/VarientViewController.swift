//
//  VarientViewController.swift
//  headtTest
//
//  Created by Jay Kumar on 7/14/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//

import UIKit
import CoreData
class VarientViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var varientList: UITableView!
    var product : Product!
    let customeCell = "CustomeCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        varientList.register(UINib(nibName :"varientCustamCell" , bundle : nil), forCellReuseIdentifier: customeCell)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getVarientList(prod: product).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:customeCell, for: indexPath) as! varientCustamCell
        cell.bgView.layer.cornerRadius = 8
        cell.bgView.layer.borderWidth = 2
        let varent = getVarientList(prod: product)
        cell.priceLable.text = "Price :- " + String(varent[indexPath.row].price)
        cell.colorLabel.text = "Color :- " + varent[indexPath.row].color!
        if  varent[indexPath.row].size != 0 {
            cell.sizeLabel.text = "Size :- " + String(varent[indexPath.row].size)
        }
        
        return cell
    }
    
    
    private func getVarientList(prod : Product) -> [Varient]{
        var variVal : [Varient]!
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let predicate = NSPredicate(format: "product == %@", prod)
        let varient : NSFetchRequest<Varient> = Varient.fetchRequest()
        varient.predicate = predicate
        varient.returnsObjectsAsFaults = false
        do{
            variVal = try context.fetch(varient)
        }catch {
            fatalError("Failed to fetch person: \(error)")
            
        }
        return variVal;
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
