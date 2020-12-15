//
//  ConfirmacaoPagamentoViewController.swift
//  Tur Viagens
//
//  Created by Gabriel Petrovick on 14/12/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    var pacoteComprado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            print(pacote.viagem.titulo)
        }

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
      }
}
