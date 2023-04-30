//
//  Relative.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 30/3/2566 BE.
//

import SwiftUI
import PhoneNumberKit
let relative_fullNameArr = Patient_only.contact_name?.components(separatedBy: " ")
let relative_firstname    = fullNameArr[0]
let relative_surname = fullNameArr[1]


struct Relative: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color(.white).edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    InformationCard(img:Image("boy"),name: Patient_only.contact_name ?? " ", status: Patient_only.contact_relationship ?? " ").padding(.bottom,20)
                    EmergencyCard(phone: Patient_only.contact_telecom ?? " ").padding(.bottom,20)
                    RelativeCard(name: relative_firstname ?? "", surname: relative_surname ?? "", gender: Patient_only.contact_gender ?? " ", contact: Patient_only.contact_telecom ?? " ")
                }.padding(.top,-50)
                Spacer() .frame(height : 150)
            }.navigationTitle("Relative")
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

struct Relative_Previews: PreviewProvider {
    static var previews: some View {
        Relative()
    }
}
struct RelativeCard: View {
    static let secondary = Color("Secondary")
    var name : String
    var surname : String
    var gender : String
    var contact : String
    var body: some View {
        VStack {
            HStack{
                Text("Relative details")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
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
                Text("Contact :")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                Text(contact)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 16, weight: .bold))
            }.padding(.horizontal,35)
                .padding(.bottom,10)

        }
        .foregroundColor(Color.accentColor)
        .padding(.vertical)

    }
}

struct EmergencyCard: View {
    var phone : String
    var body: some View {
        HStack{
            HStack{
                Image("alarm2").frame(width: 70,height: 70)
                    .padding(.horizontal)
                VStack{
                    Text("Call Now")
                        .font(.system(size: 20, weight:.bold))
                        .padding(.bottom,1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(phone)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                } .padding(.horizontal,5)
                Spacer()
            }
        }   .padding(.horizontal)
            .frame(width:336,height:77)
            .background(Color(red: 250 / 255, green: 172 / 255, blue: 172 / 255, opacity: 0.8))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.3), radius: 15, x: 0, y: 12)
    }
}

