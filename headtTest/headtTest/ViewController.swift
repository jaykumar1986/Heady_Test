//
//  ViewController.swift
//  headtTest
//
//  Created by Jay Kumar on 7/10/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    lazy var catListArray : [Category] = []
    let customeCell = "CustomeCell"
    @IBOutlet weak var listView: UITableView!
    let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.register(UINib(nibName :"CustomeTableViewCell" , bundle : nil), forCellReuseIdentifier: customeCell)
        listView.tableFooterView = UIView(frame: .zero)
        listView.rowHeight = UITableViewAutomaticDimension
        listView.estimatedRowHeight = 60
        
        ServiceClass.getShoping({(catList,rankList)in
            DispatchQueue.main.async {
                self.addCatItemToDB(catItem: catList)
                self.listView.reloadData()
            }
            print("cat list : \(catList),\n RankList: \(rankList)")
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    private func addCatItemToDB(catItem : AnyObject){
        print("item : \(catItem)");
        guard let items = catItem as? [AnyObject] else {
            return
        }
        cleanDB()
        for item in items  {
            let context = appDelegate.persistentContainer.viewContext
            print("itemList \(item)")
            let category = Category(context : context)
            category.id = (item["id"] as? Int32)!
            category.name = (item["name"] as? String)!
            for prod in item["products"] as! [AnyObject]{
                let product = Product(context : context)
                    product.id = (prod["id"] as? Int32)!
                    product.name = (prod["name"] as? String)!
                    product.date_addes = (prod["date_added"] as? String)!
                    category.addToProduct(product)
                for varie in prod["variants"] as![AnyObject]{
                    let varient = Varient(context : context)
                        varient.id = (varie["id"] as? Int32)!
                        varient.color = (varie["color"] as? String)!
                        varient.price = (varie["price"] as? Float)!
                    if let size = (varie["size"] as? Int32){
                        varient.size = size
                    }
                        product.addToVarient(varient)
                }
            }
            do{
                try context.save()
                
            }catch let error as NSError{
                print("Could Not save.\(error),\(error.userInfo)")
            }
        }
        
        
    }
    private func cleanDB(){
        
        let variFeatch : NSFetchRequest<Varient> = Varient.fetchRequest()
        let delAllvariReqVar = NSBatchDeleteRequest(fetchRequest: variFeatch as! NSFetchRequest<NSFetchRequestResult>)
        do { try appDelegate.persistentContainer.viewContext.execute(delAllvariReqVar) }
        catch { print(error) }
        let prodFeatch : NSFetchRequest<Product> = Product.fetchRequest()
        let delAllChatReqVar = NSBatchDeleteRequest(fetchRequest: prodFeatch as! NSFetchRequest<NSFetchRequestResult>)
        do { try appDelegate.persistentContainer.viewContext.execute(delAllChatReqVar) }
        catch { print(error) }
        let catFatch : NSFetchRequest<Category> = Category.fetchRequest()
        let delAllReqVar = NSBatchDeleteRequest(fetchRequest: catFatch as! NSFetchRequest<NSFetchRequestResult>)
        do { try appDelegate.persistentContainer.viewContext.execute(delAllReqVar) }
        catch { print(error) }
        catListArray.removeAll()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return getCatItem()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getProdList(catList: catListArray[section]).count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cat = catListArray[section];
        return cat.name;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:customeCell, for: indexPath) as! CustomeTableViewCell
        let prodlist = getProdList(catList: catListArray[indexPath.section])
        let prod = prodlist[indexPath.row]
        cell.productNmae.text = prod.name
        cell.productDate.text = prod.date_addes
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prodlist = getProdList(catList: catListArray[indexPath.section])
        let prod = prodlist[indexPath.row]
        gotoDetailView(product: prod)
    }
    
    
    func gotoDetailView(product : Product){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Vc = storyboard.instantiateViewController(withIdentifier: "varientView") as! VarientViewController
        Vc.product = product;
        self.navigationController?.pushViewController(Vc, animated: true)
        
    }
    
    private func getCatItem() -> Int{
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let cat : NSFetchRequest<Category> = Category.fetchRequest()
        do{
            let fetchcat = try context.fetch(cat)
            for item in fetchcat{
                catListArray.append(item)
            }
        }catch {
            fatalError("Failed to fetch person: \(error)")
        }
        return catListArray.count
    }
    private func getProdList(catList : Category) -> [Product]{
        var prodVal : [Product]!
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let predicate = NSPredicate(format: "category == %@", catList)
        let prod : NSFetchRequest<Product> = Product.fetchRequest()
        prod.predicate = predicate
        prod.returnsObjectsAsFaults = false
        do{
            prodVal = try context.fetch(prod)
        }catch {
            fatalError("Failed to fetch person: \(error)")
            
        }
        return prodVal;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

