//
//  PatientDetails.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 30/3/2566 BE.
//

import SwiftUI

struct Course: Hashable, Codable{
    let uid :String
    let cid :String
    let name :String
    let gender:String
    let telecom :String
    let contact_name : String
    let contact_relationship : String
    let contact_gender : String
    let contact_telecom : String
    let birthdate : Date
    
    
}



let fullNameArr = Patient_only.name.components(separatedBy: " ")

let firstname    = fullNameArr[0]
let surname = fullNameArr[1]

struct PatientDetails: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
            ZStack{
                Color(.white).edgesIgnoringSafeArea(.all)
                VStack {
          
                    VStack{
                        InformationCard(img:Image("girl"),name: Patient_only.name, status: "patient").padding(.bottom,20)
                        Patientinformation(name: firstname, surname: surname, gender: Patient_only.gender ?? " ", birthdate: "16/10/00", contact: Patient_only.telecom ?? " ", emergency: Patient_only.contact_telecom ?? " ")
                        HStack{
                            Relatives(name: Patient_only.contact_name ?? " ", status: Patient_only.contact_relationship ?? " ")

                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,30)

                        
                    }.padding(.top,-50)
                
                }.navigationTitle("Nectar")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                             .navigationBarItems(leading: Button(action : {
                                 self.mode.wrappedValue.dismiss()
                             }){
                                 Image(systemName: "arrow.left")
                             })
            }  .onAppear{
//                print("from patient details ========")
//                print(Patient_only)
//                print("==============")
            }
        
            
    }


}

struct PatientDetails_Previews: PreviewProvider {
    static var previews: some View {
        PatientDetails()
    }
}
struct InformationCard: View {
    var img : Image
    var name : String
    var status : String
    var body: some View {
        HStack{
            HStack{
                img.frame(width: 70,height: 70).padding(.horizontal)
                VStack{
                    Text(name)
                        .font(.system(size: 16, weight:.bold))
                        .padding(.bottom,1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(status)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                } .padding(.horizontal,5)
                Spacer()
            }
        }   .padding(.horizontal)
            .frame(width:336,height:109)
            .background(Color(red: 255 / 255, green: 227 / 255, blue: 227 / 255, opacity: 1))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.3), radius: 15, x: 0, y: 12)
    }
}
struct Patientinformation: View {
    static let secondary = Color("Secondary")
    var name : String
    var surname : String
    var gender : String
    var birthdate : String
    var contact : String
    var emergency : String
    var body: some View {
        VStack {
            HStack{
                Text("Patient details")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Image("alarm")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.padding(.horizontal,35)
                .padding(.bottom,10)
            HStack{
                Text("Name :")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 16, weight: .bold))
            }.padding(.horizontal,35)
                .padding(.bottom,10)
            HStack{
                Text("Surname :")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                Text(surname)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 16, weight: .bold))
            }.padding(.horizontal,35)
                .padding(.bottom,10)
            HStack{
                Text("Gender :")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                Text(gender)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 16, weight: .bold))
            }.padding(.horizontal,35)
                .padding(.bottom,10)
            HStack{
                Text("Birthdate")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                Text(birthdate)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 16, weight: .bold))
            }.padding(.horizontal,35)
                .padding(.bottom,10)
            HStack{
                Text("Contact :")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                Text(contact)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 16, weight: .bold))
            }.padding(.horizontal,35)
                .padding(.bottom,10)
            HStack{
                Text("Emergency :")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                Text(emergency)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 16, weight: .bold))
            }.padding(.horizontal,35)
                .padding(.bottom,10)
            HStack{
                Text("Relatives")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
            }.padding(.horizontal,35)
                .padding(.top,15)
        }
        .foregroundColor(Color.accentColor)
        .padding(.vertical)
    }
}
struct Relatives: View {
    var name : String
    var status : String
    var body: some View {
    
            HStack {
                VStack {
                    HStack{
                            VStack{
                                Text(name)
                                    .font(.system(size: 14, weight:.bold))
                                    .padding(.bottom,1)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(status)
                                    .font(.system(size: 12))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                HStack{
                                    Button{
                                        print("action")
                                    }
                                label:{
                                    Image("phone.fill")
                                        .frame(width: 27, height: 27)
                                        .font(.system(size: 17  , weight:.bold))
                                        .foregroundColor(Color(.black))
                                        .background(Color(red: 227 / 255, green: 156 / 255, blue: 155 / 255, opacity: 1))
                                        .clipShape(Circle())
                                }
                                    Button{
                                        print("action")
                                    }
                                label:{Image("info")
                                        .frame(width: 27, height: 27)
                                        .font(.system(size: 17, weight:.bold))
                                        .foregroundColor(Color(.black))
                                        .background(Color(red: 227 / 255, green: 156 / 255, blue: 155 / 255, opacity: 1))
                                        .clipShape(Circle())
                                    
                                }}.frame(maxWidth: .infinity, alignment: .leading)

                            } .padding(.horizontal,5)
                        
                            Spacer()
                    }   .padding(.horizontal)
                        .frame(width:158,height:112)
                        .background(Color(red: 255 / 255, green: 227 / 255, blue: 227 / 255, opacity: 1))
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.3), radius: 15, x: 0, y: 12)
                }
                .foregroundColor(Color.black)
                
            
        }

    }
}
