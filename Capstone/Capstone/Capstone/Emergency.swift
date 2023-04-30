//
//  Emergency.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 30/3/2566 BE.
//
import SwiftUI

struct Emergency: View {
    var body: some View {
        ZStack{
            Color(.white).edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Emergency")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }.padding(.top,-55)
                Image("arrow.left")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top,-55).padding(.horizontal,35)
                VStack{
                    EmergencyCard(phone: "+66-999-9999").padding(.bottom,20)
                    InformationCard(img:Image("boy"),name: "Jose Doeramen", status: "father").padding(.bottom,20)
                    RelativeCard(name: "Jessica", surname: "Doraemon", gender: "Female", contact: "+66-999-9999")
       
                    HStack{
                        Text("Other Relatives")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }.padding(.horizontal,35)
                        .padding(.top,5)
                    Relatives(name: "Jane Doeramen", status: "Grandmother")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal,35)

                }
 
            }

    
        }
    }
}

struct Emergency_Previews: PreviewProvider {
    static var previews: some View {
        Emergency()
    }
}
