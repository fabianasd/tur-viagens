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
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    var pacoteComprado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelHotelPacoteViagem.text = pacote.nomeDoHotel
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            self.labelDataPacoteViagem.text = pacote.dataViagem
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            
            self.botaoVoltarHome.layer.cornerRadius = 8
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
