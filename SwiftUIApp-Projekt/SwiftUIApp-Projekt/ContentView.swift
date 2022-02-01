//
//  ContentView.swift
//  SwiftUIApp-Projekt
//
//  Created by Johannes Stümer / BBS2H20A on 25.01.22.
//

import SwiftUI

struct ContentView: View {
    
    private var slots = ["kirsche", "sieben", "melone"]
    @State private var nummer = [1,2,0]
    @State private var punkte = 1000
    private var einsatz = 10
    let backgroundImage = UIImageView(image: UIImage(named: "strand"))
    
    
    var body: some View {
        
        ZStack{
            //Hintergrund
         Image("strand")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            //titel
            VStack{
                Spacer()
                HStack{
                    Text("Sloterino")
                        .bold()
                        .foregroundColor(.black)
                }.scaleEffect(2)
                
                Spacer()
                
                //Credits zählen
                Text("Credits: " + String(punkte))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                HStack{
                    Image(slots[nummer[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(20)
                    Image(slots[nummer[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(20)
                    Image(slots[nummer[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                }
                Spacer()
                //Button
                Button(action: {
                    //Bilder randomisieren
                    self.nummer[0] = Int.random(in: 0...self.slots.count - 1)
                    self.nummer[1] = Int.random(in: 0...self.slots.count - 1)
                    self.nummer[2] = Int.random(in: 0...self.slots.count - 1)
                    
                    //gewinn checken
                    if self.nummer[0] == self.nummer[1] && self.nummer[1] == self.nummer[2]{
                        //Gewonnen
                        self.punkte += self.einsatz * 10
                    }
                    else{
                        self.punkte -= self.einsatz
                    }
                }){
                    Text("Drehen")
                        .bold()
                        .foregroundColor(.black)
                        .padding(.all, 15)
                        .padding(.horizontal, 30)
                        .background(Color.red)
                        .cornerRadius(20)
                    
                }
                Spacer()
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
