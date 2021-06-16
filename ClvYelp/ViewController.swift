//
//  ViewController.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    private var viewModel: RestaurantsListViewModel!
    
    public var dictRestaurantList = [String: YelpRestaurant]()
    public var sortedRestaurantListAsc = [YelpRestaurant]()
    public var sortedRestaurantListDesc = [YelpRestaurant]()
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard( name: "Main", bundle:.main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchRestaurantViewModels(totalcount: 10,completion: {(restaurantlist) ->Void in
            let statuscode = restaurantlist.result
                if statuscode == true {
                    let restarray = restaurantlist.restaurantArray
                    for item in restarray {
                        self.dictRestaurantList[item?.name ?? "noname"]=item
                    }

                    //for(thename,restobj) in self.dictRestaurantList { print(thename)}
                    //let sortedRestaurantListAAsc  = self.dictRestaurantList.sorted { $0.key.localizedCompare($1.key) == .orderedAscending  }
                    //let sortedRestaurantListDDesc = self.dictRestaurantList.sorted { $0.key.localizedCompare($1.key) == .orderedDescending  }
                    
                    for (_,thevalue) in self.dictRestaurantList.sorted { $0.key.localizedCompare($1.key) == .orderedAscending  } {
                        self.sortedRestaurantListAsc.append(thevalue)
                    }
                    
                    for (_,thevalue) in self.dictRestaurantList.sorted { $0.key.localizedCompare($1.key) == .orderedDescending  } {
                        self.sortedRestaurantListDesc.append(thevalue)
                    }

                    DispatchQueue.main.async {
                        self.gridCollectionView.reloadData()
                    }
                }
            
        })
        
        setUpCollectionView()
        gridCollectionView.isHidden=false
        
        /*
        viewModel.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to:tableView.rx.items(cellIdentifier: "tcell")) {index, viewModel, cell in
            cell.textLabel?.text = "Hmmm" // viewModel.displayText
        }.disposed(by: disposeBag)
         
        */

        /*
        viewModel.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to: gridCollectionView.rx.items(cellIdentifier: "cell")) {index, viewModel, cell in
            cell.contentView.backgroundColor = .purple
        }.disposed(by: disposeBag)
        */
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sortedRestaurantListAsc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ClvCollectionCell
        
        //cell.backgroundColor = .randomColor() // debug cells
        //cell.thedesc?.translatesAutoresizingMaskIntoConstraints = false

        if let name=self.sortedRestaurantListAsc[indexPath.row].name {
            cell.restname?.text = name
        }
        else {
            cell.restname?.text = ""
        }
        if let addr=self.sortedRestaurantListAsc[indexPath.row].address {
            cell.addr?.text = addr.joined(separator: " ")
        }
        else {
            cell.addr?.text = ""
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id=indexPath.row
        //print("selected \(id)")
        //performSegue(withIdentifier: "sq_show_details", sender: nil)
        
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail_view_controller") as! DetailViewController
        
        detailViewController.review = self.sortedRestaurantListAsc[indexPath.row].review
            //targetController.data = "Restarant !"
        detailViewController.imageurl = self.sortedRestaurantListAsc[indexPath.row].imageurl ?? ""
        detailViewController.name = self.sortedRestaurantListAsc[indexPath.row].name ?? ""
        detailViewController.address = self.sortedRestaurantListAsc[indexPath.row].address ?? []

        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        if segue.identifier == "sq_show_details" {
//            if let destVC = segue.destination as? UINavigationController,
//                let targetController = destVC.topViewController as? DetailViewController {
//                //targetController.data = "Restarant !"
//                targetController.name = "XYZ" //Or pass any values
//                targetController.review = 123
//            }
//        }
        

    }
    
    private func setUpCollectionView() {
      /// 1
      //gridCollectionView.register(UICollectionViewCell.self,forCellWithReuseIdentifier: "cell")
        
      //  gridCollectionView.register(ClvCollectionCell.self,forCellWithReuseIdentifier: "cell")

      /// 2
      gridCollectionView.delegate = self
      gridCollectionView.dataSource = self

      /// 3
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      /// 4
      layout.minimumLineSpacing = 8
      /// 5
      layout.minimumInteritemSpacing = 4

      /// 6
      gridCollectionView.setCollectionViewLayout(layout, animated: true)
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    /// 1
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        /// 2
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
        
    /// 3
    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// 4
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        /// 5
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        /// 6
        return CGSize(width: widthPerItem - 8, height: 250)
    }
}

// random color for debug
extension CGFloat {
    static func randomValue() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
           red:   .randomValue(),
           green: .randomValue(),
           blue:  .randomValue(),
           alpha: 1.0
        )
    }
}

