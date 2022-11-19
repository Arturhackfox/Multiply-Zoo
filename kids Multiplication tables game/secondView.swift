//
//  secondView.swift
//  kids Multiplication tables game
//
//  Created by Arthur Sh on 19.11.2022.
//

import SwiftUI

struct secondView: View {
    
    @State var tableAnswer = ""
    
    var body: some View {
        Group{
            VStack(spacing: 15){
                
                Text("User score: 0")
                    .font(.title)
                    
                     
                Text("5 * 2")
                    .font(.largeTitle)
                
                     
                TextField("Enter your answer...", text: $tableAnswer)
                
                Spacer()
                
                Button{
                  
                }label: {
                    VStack{
                        Text("Enter!")
                            .padding()
                            .frame(width: 150, height: 60)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.top, 35)
            .padding(.horizontal, 30)
           
            
            
        }
    }
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView()
    }
}
