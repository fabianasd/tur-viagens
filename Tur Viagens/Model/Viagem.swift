//
//  Viagem.swift
//  Tur Viagens
//
//  Created by Fabiana Petrovick on 04/12/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import Foundation

class Viagem: NSObject {
    let titulo:String
    let quantidadeDeDias:Int
    let preco:String
    let caminhoDaImagem:String
    
    init(titulo:String, quantidadeDeDias:Int, preco:String, caminhoDaImagem:String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
