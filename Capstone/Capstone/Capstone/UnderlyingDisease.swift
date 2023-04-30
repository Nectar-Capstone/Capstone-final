//
//  UnderlyingDesease.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 31/3/2566 BE.
//

import SwiftUI

struct UnderlyingDisease: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color(red: 255 / 255, green: 227 / 255, blue: 227 / 255,
                  opacity:1).edgesIgnoringSafeArea(.all)
       
            HStack{
         
            }
                .frame(width:353,height:670)
                .background(Color(.white))
                .opacity(0.5)
                .cornerRadius(16)
                .padding(.top,-20)
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing :30){
                    ForEach(Patient_only.IsHaving ?? [], id:\.self){ disease in
                        Disease(title:disease.ConditionProblemDiagnosis?.display ?? "" ,date: "15/08/2022")}
                    Spacer()
                }}.frame(height: 650)
                    .navigationTitle("Underlying Disease")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button(action : {
                        self.mode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.left")
                    })
        }
    }
}

struct UnderlyingDisease_Previews: PreviewProvider {
    static var previews: some View {
        UnderlyingDisease()
    }
}
struct Disease: View {
    var title: String
    var date : String
    var body: some View {
        HStack{
            HStack{
                VStack{
                        Text(title)
                            .font(.system(size: 18))
                            .padding(.bottom,1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Since :"+date)             .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal,20)
                        .padding(.bottom,1)
      
                } .padding(.horizontal,5)

            }
        }   .padding(.horizontal)
            .frame(width:310,height:112)
            .background(Color(.white))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.2), radius: 15, x: 0, y: 12)
    }
}
