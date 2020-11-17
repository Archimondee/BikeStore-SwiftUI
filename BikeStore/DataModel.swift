//
//  DataModel.swift
//  BikeStore
//
//  Created by Gilang Aditya R on 18/11/20.
//

import Foundation


struct DataModel: Identifiable{
  let id: Int
  let namaProduk: String
  let fotoProduk: String
  let hargaProduk: String
  let lokasi: String
  let ratingCount: Int
  let jumlahRating: Int
  
  init(id: Int, namaproduk: String, fotoproduk: String, hargaproduk: String, lokasi: String, ratingcount: Int, jumlahrating: Int){
    self.id = id
    self.namaProduk = namaproduk
    self.fotoProduk = fotoproduk
    self.hargaProduk = hargaproduk
    self.lokasi = lokasi
    self.ratingCount = ratingcount
    self.jumlahRating = jumlahrating
  }
}
