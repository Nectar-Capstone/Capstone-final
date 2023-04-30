//
//  Allergies.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 31/3/2566 BE.
//

import SwiftUI

struct Allergies: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color(red: 255 / 255, green: 227 / 255, blue: 227 / 255,
                  opacity:1).edgesIgnoringSafeArea(.all)
       
            HStack{
         
            }   .padding(.horizontal)
                .frame(width:353,height:670)
                .background(Color(.white))
                .opacity(0.5)
                .cornerRadius(16)
                .padding(.top,-30)

            VStack(spacing :30){
          
                Allergy(title:"Pollen", criticality: "Moderate", symptom: "Symptom", description: "description category...")

            Allergy(title:"Jaiter", criticality: "Critical", symptom: "Symptom", description: "description category...")
                Spacer()
            }.padding(.top,40)
                .navigationTitle("Allergies")
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

struct Allergies_Previews: PreviewProvider {
    static var previews: some View {
        Allergies()
    }
}
struct Allergy: View {
    var title: String
    var criticality : String
    var symptom : String
    var description: String
    var body: some View {
        HStack{
            HStack{
                VStack{
                    HStack{
                        Text(title)
                            .font(.system(size: 16,weight: .bold))
                            .padding(.bottom,1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        switch criticality {
                            case "Critical":
                                Text(criticality + "      ")
                                    .font(.system(size: 12,weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .frame(width:80,height:20)
                                    .background(Color( red: 249 / 255, green: 105 / 255, blue: 105 / 255, opacity: 1))
                                    .cornerRadius(24)
                            
                            case "Moderate":
                                Text(criticality + "   ")
                                    .font(.system(size: 12,weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .frame(width:80,height:20)
                                    .background(Color( red: 244 / 255, green: 209 / 255, blue: 86 / 255, opacity: 1))
                                    .cornerRadius(24)
                            default:
                                Text("")
                        }
              
                        }
                        Text(symptom)
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,30)
                            .padding(.bottom,1)
                        Text(description)
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,30)
                            .padding(.bottom,1)

                    } .padding(.horizontal,5)

            }
        }   .padding(.horizontal)
            .frame(width:310,height:120)
            .background(Color(.white))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.2), radius: 15, x: 0, y: 12)
    }
}
