//
//  PacotesViagensViewController.swift
//  Tur Viagens
//
//  Created by Fabiana Petrovick on 06/12/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    var listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualiazaContadorLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let pacoteAtual = listaViagens[indexPath.item]
        
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
        
        // celulaPacote.backgroundColor = UIColor.blue
        //cadastra no identifier(menu) o "celulaPacote"
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        let larguraCelula = collectionView.bounds.width / 2
        //        return CGSize(width: larguraCelula-10, height: 160)
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-10, height: 160)
            : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    //chamando a tela de detalhes
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // cadastra o identifier show identity inspector > Storyboard ID
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalheViagemViewController
        controller.pacoteSelecionado = pacote
        //self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        listaViagens = listaComTodasViagens
    //        if searchText != "" {
    //            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains[cd] %@",searchText)
    //            let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
    //            listaViagens = listaFiltrada
    //        }
    //        self.labelContadorPacotes.text = self.atualiazaContadorLabel()
    //        colecaoPacotesViagem.reloadData()
    //
    //      //   print(searchText)
    //    }
    //outra forma de fazer a pesquisa filtrada
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != "" {
            listaViagens = listaViagens.filter {$0.viagem.titulo.contains(searchText)}
        }
        self.labelContadorPacotes.text = self.atualiazaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func  atualiazaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
}
