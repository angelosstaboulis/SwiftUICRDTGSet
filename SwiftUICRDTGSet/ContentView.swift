//
//  ContentView.swift
//  SwiftUICRDTGSet
//
//  Created by Angelos Staboulis on 29/5/24.
//

import SwiftUI
struct ContentView: View {
    @State var num = GSet<Int>()
    @State var list:[Int] = []
    @State var number:String
    @State var numberExists:Bool
    var body: some View {
        VStack {
            Text("Conflict free Replicated Data Type Sample")
            VStack{
                List(list,id:\.self){item in
                    Text(String(describing:item))
                }
                Text("Enter a number")
                TextField("Enter number to find in GSet", text: $number)
                Button(action: {
                    checkIfNumberExists()
                }, label: {
                    Text("Find Number")
                }).padding(10)
                Text(numberExists ? "Number exists in GSet" : "Number does not exist")
            }.padding(100)
            Spacer()
        }.onAppear(perform: {
            initGSet()
        })
        
    }
    func initGSet(){
        num.add(input:10)
        num.add(input:20)
        num.add(input:30)
        num.add(input:40)
        num.add(input:50)
        list.append(contentsOf: num.values())
    }
    func checkIfNumberExists(){
        guard let convertNumber = Int(number) else{
            return
        }
        if num.contains(input: convertNumber){
            numberExists = true
        }else{
            numberExists = false
        }
    }
}

#Preview {
    ContentView(number: "0", numberExists: false)
}
