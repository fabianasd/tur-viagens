//
//  ViewController.swift
//  Tur Viagens
//
//  Created by Gabriel Petrovick on 03/12/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var TabelaViagens: UITableView!
    
    let listaViagens:Array<String> = ["Rio de Janeiro", "Ceará", "São Paulo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TabelaViagens.dataSource  = self
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listaViagens[indexPath.row]
        
        return cell
    }
    
}

