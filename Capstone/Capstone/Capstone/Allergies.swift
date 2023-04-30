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
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing :30){
                    ForEach(Patient_only.IsAllergic ?? [], id:\.self){ allergy in
                        Allergy(title:allergy.AllergicIntoleranceSubstance?.display ?? "", criticality: allergy.criticality ?? "")}
                    Spacer()
                }
           
            }.frame(height: 650)
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
                            case "critical":
                                Text(criticality)
                                    .font(.system(size: 12,weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .frame(width:70,height:20)
                                    .padding(.vertical,3)
                                    .background(Color( red: 237 / 255, green: 69 / 255, blue: 92 / 255, opacity: 1))
                                    .cornerRadius(24)
                            
                            case "moderate":
                                Text(criticality)
                                    .font(.system(size: 12,weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .frame(width:70,height:20)
                                    .padding(.vertical,3)

                                    .background(Color( red: 244 / 255, green: 209 / 255, blue: 86 / 255, opacity: 1))
                                    .cornerRadius(24)
               
                        case "low":
                            Text(criticality)
                                .font(.system(size: 12,weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(width:70,height:20)
                                .padding(.vertical,3)

                                .background(Color( red: 70 / 255, green: 173 / 255, blue: 167 / 255, opacity: 1))
                                .cornerRadius(24)
                        case "unable-to-accesses":
                            Text("unknown")
                                .font(.system(size: 12,weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(width:70,height:20)
                                .padding(.vertical,3)
                                .background(Color( red: 255 / 255, green: 116 / 255, blue: 86 / 255, opacity: 1))
                                .cornerRadius(24)
                            default:
                                Text("")
                        }
              
                        }
                    } .padding(.horizontal,5)

            }
        }   .padding(.horizontal)
            .frame(width:310,height:120)
            .background(Color(.white))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.2), radius: 15, x: 0, y: 12)
    }
}
