//
//  ContentView.swift
//  kids Multiplication tables game
//
//  Created by Arthur Sh on 19.11.2022.
//



//1 keyboard numercal

import SwiftUI

struct ContentView: View {
    
    @State private var isGame = true
    
    @State private var currentTables = 2
    
    @State private var questionsArray = [5, 10, 20]
    @State private var questionsCount = 5
    @State private var questionIndex: Int = 0
    
    @State private var randNumber = Int.random(in: 2...12)
    
    @State private var correctAnswer = 0
    @State private var textFieldAnswer = 0
    
    @State private var alertTitle = ""
    @State private var isShowingAlert = false
    
    @State private var score = 0
    @State private var allTimeScore = UserDefaults.standard.integer(forKey: "lastScore")
    
    
    var body: some View {
        NavigationStack{
            Group{
                if isGame{
                    
                    VStack{
                        VStack(spacing: 20){
                            Spacer()
                            
                            if currentTables == 2 {
                                Image("giraffe")
                                    .frame(width: 150, height: 150)
                            }else if currentTables == 3 {
                                Image("chick")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 4 {
                                Image("elephant")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 5 {
                                Image("narwhal")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 6 {
                                Image("panda")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 7 {
                                Image("pig")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 8 {
                                Image("snake")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 9 {
                                Image("walrus")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 10 {
                                Image("buffalo")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 11 {
                                Image("bear")
                                    .frame(width: 150, height: 150)
                            } else if currentTables == 12 {
                                Image("whale")
                                    .frame(width: 150, height: 150)
                            }
                            
                            Spacer()
                            VStack(alignment: .leading){
                                
                                Text("Multiplication table for  \(currentTables)")
                                    .font(.title3)
                                
                                
                                Stepper("Choose tables", value: $currentTables, in: 2...12)
                            }
                            .padding()
                            
                            Spacer()
                            
                            VStack(){
                                Text("How many questions ?")
                                Picker("How many questions?", selection: $questionsCount) {
                                    ForEach(questionsArray, id: \.self) {
                                        Text($0.formatted(.number))
                                    }
                                }
                                .pickerStyle(.segmented)
                                .frame(width: 150)
                            }
                            .padding()
                            Spacer()
                            Spacer()
                            
                            
                            VStack{
                                Button{
                                    isGame = false
                                    score = 0
                                } label: {
                                    VStack{
                                        Text("Play!")
                                            .padding()
                                            .frame(width: 150, height: 60)
                                            .background(.green)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                }
                                
                            }
                            Spacer()
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                } else if isGame == false {
                    
                        VStack(spacing: 15){
                            
                            Text("User score: \(score)")
                                .font(.title)
                            
                            
                            Text("\(randNumber) * \(currentTables)")
                                .font(.largeTitle)
                            
                            Text("Enter your answer...")
                            TextField("Enter your answer...", value: $textFieldAnswer, format: .number)
                                .keyboardType(.decimalPad)
                            
                            
                            Spacer()
                            
                            Button{
                                isShowingAlert = true
                                //MARK: CALCULATIONS
                                calculations(rand: randNumber, for: currentTables)
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
                        .alert(alertTitle, isPresented: $isShowingAlert){
                            if questionIndex != questionsCount{
                                Button("OK"){
                                    randNumber = Int.random(in: 2...12)
                                }
                            }else {
                                Button("Start again",action: restart)
                            }
                        } message: {
                            if questionIndex != questionsCount {
                                Text("Your score is \(score)")
                            } else {
                                Text("Your final score is \(score)")
                            }
                        }
                        .padding(.top, 35)
                        .padding(.horizontal, 30)
                        
                        
                        
                    
                    
                }
            }
            .navigationBarTitle(isGame ? "Your total score: \(allTimeScore)" : " ")
           
        }
        
    }
    
    func calculations(rand: Int, for number: Int){
      
        
        let multyplied = rand * number
        if questionIndex != questionsCount {
            if multyplied == textFieldAnswer {
                alertTitle = "Correct!"
                score += 15
                allTimeScore += 15
                
            } else {
                alertTitle = "Wrong! it should be \(multyplied)"
                score -= 5
                allTimeScore -= 5
            }
            
            questionIndex += 1
            
        }else {
            alertTitle = "The game is over"
           
        }

        }
        
        
    func restart(){
        currentTables = 2
        isGame = true
        questionIndex = 0
        questionsCount = 5
        
    }
        
      
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
