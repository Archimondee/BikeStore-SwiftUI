//
//  ContentView.swift
//  BikeStore
//
//  Created by Gilang Aditya R on 14/11/20.
//

import SwiftUI

//Model Data


struct ContentView: View {
  let data: [DataModel] = [
    DataModel(id: 1, namaproduk: "Sepeda 1", fotoproduk:"foto1", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 2, namaproduk: "Sepeda 2", fotoproduk:"foto2", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 3, namaproduk: "Sepeda 3", fotoproduk:"foto3", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 4, namaproduk: "Sepeda 4", fotoproduk:"foto4", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 5, namaproduk: "Sepeda 5", fotoproduk:"foto5", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 6, namaproduk: "Sepeda 6", fotoproduk:"foto6", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 7, namaproduk: "Sepeda 7", fotoproduk:"foto7", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 8, namaproduk: "Sepeda 8", fotoproduk:"foto8", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 9, namaproduk: "Sepeda 9", fotoproduk:"foto9", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100),
    DataModel(id: 10, namaproduk: "Sepeda 10", fotoproduk:"foto10", hargaproduk: "2000000", lokasi: "Bekasi", ratingcount: 3, jumlahrating: 100)
  ]
  
  //@State var jumlahkeranjang: Int = 0
  @ObservedObject var keranjang = GlobalObject()
  var body: some View {
    //Product()
    
    NavigationView{
      ScrollView{
        ForEach(data){ row in
          VStack(spacing: 10){
            Product(data: row, keranjang: self.keranjang)
          }.padding()
        }
      }
      .navigationBarTitle("Sepeda")
      .navigationBarItems(
      trailing:
        HStack{
          Button(action:{print("Ok")}){
            Image(systemName: "person.fill")
          }
          NavigationLink(destination: DetailView(globaldata: keranjang)){
            KeranjangView(keranjang: keranjang)
          }
        }
      )
    }.accentColor(Color.secondary)
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct KeranjangView: View{
  //@Binding var jumlah: Int
  @ObservedObject var keranjang: GlobalObject
  
  var body: some View{
    ZStack{
        Image(systemName: "cart.fill")
      
      Text("\(self.keranjang.jumlah)")
        .foregroundColor(Color.white)
        .frame(width:10, height:10)
        .font(.body)
        .padding(5)
        .background(Color.red)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .offset(x: 10, y: -10)
    }
  }
}


struct Product: View{
  let data: DataModel
  //@Binding var jumlah: Int
  @ObservedObject var keranjang: GlobalObject
  
  var body: some View{
    VStack(alignment: .leading){
      ZStack(alignment: .topTrailing){
        Image(self.data.fotoProduk)
          .resizable().aspectRatio(contentMode:/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
          .frame(height: 200)
          .clipped()
        
        Button(action: {print("OK")}){
          Image(systemName: "heart")
            .padding()
            .foregroundColor(Color.red)
        }
      }
      Text(self.data.namaProduk)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .bold()
        .padding(.leading)
      
      Text("Rp \(self.data.hargaProduk)")
        .font(.title)
        .foregroundColor(.red)
        .padding(.leading)
        .padding(.trailing)
      
      HStack{
        Image(systemName: "mappin.circle")
        Text(self.data.lokasi)
      }
      .padding(.leading)
      .padding(.trailing)
      
      HStack{
        HStack{
          ForEach(0..<self.data.ratingCount){
            item in
            Image(systemName: "star.fill")
              .foregroundColor(Color.yellow)
          }
          
        }
      }
      .padding(.trailing)
      .padding(.leading)
      
      TambahKeranjang(keranjang: keranjang)
    }
    .background(Color("warna"))
    .cornerRadius(10)
  }
}

struct TambahKeranjang: View{
  //@Binding var jumlah: Int
  
  @ObservedObject var keranjang: GlobalObject
  var body: some View{
    Button(action: {self.keranjang.jumlah += 1}){
      HStack{
        Spacer()
        HStack{
          Image(systemName: "cart")
          Text("Tambah ke keranjang")
            .font(.callout)
            .padding()
        }
        Spacer()
      }
    }.background(Color.green)
    .foregroundColor(.white)
    .cornerRadius(10)
    .padding()
  }
}

struct DetailView: View{
  @ObservedObject var globaldata: GlobalObject
  var body: some View{
    NavigationView{
      Text("Detail")
        .navigationBarTitle("Detail")
    }
  }
}
