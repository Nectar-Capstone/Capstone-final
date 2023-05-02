//
//  ContentView.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 29/3/2566 BE.
//

import SwiftUI
import SwiftJWT


var Uid = ""

struct LoginPage: View {
    @State private var isOn = false
    @ObservedObject private var loginVM = LoginViewModel()
    @State  var username = ""
    @State  var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var isAuthen = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 248 / 255, green: 167 / 255, blue: 167 / 255, opacity: 1).edgesIgnoringSafeArea(.all)
                VStack {
                    Image("img1")
                        .edgesIgnoringSafeArea(.top)
                    Text("Login")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                    
                    Text("Login to see patients")
                        .font(.system(size: 20, weight:.medium))
                        .foregroundColor(.white)
                    
                    VStack{
                        HStack{
                            TextField("Username", text: $loginVM.username)}
                        .padding()
                        .foregroundColor(.black)
                        .background(Color(white: 1,opacity: 0.5))
                        .cornerRadius(16)
                        .font(.custom("Open Sans", size: 20))
                        .padding(.horizontal)
                        
                        HStack{
                            SecureField("Password", text: $loginVM.password)}
                        .padding()
                        .foregroundColor(.black)
                        .background(Color(white: 1,opacity: 0.5))
                        .cornerRadius(16)
                        .font(.custom("Open Sans", size: 20))
                        .padding(.horizontal)
                        HStack{
                            Toggle(isOn: $isOn) {
                                Text("Remember Me")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                Spacer()
                                
                            }         .padding(.horizontal,20)
                                .padding(.top,5)
                                .toggleStyle(iOSCheckboxToggleStyle())
                        }
                        Spacer()
                        NavigationLink(destination: NectarMain(), isActive: $loginVM.isAuthenticated) { EmptyView() }
                        Button("LOGIN") {
                            loginVM.login()
                            
                        }
                        .frame(width: 299, height: 55)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .modifier(customButtonModifier())
                    }
                    
                }
                Spacer()
                
            }
        }.onAppear(){
            
        }.onOpenURL { url in
            var q = getQueryItems(url.absoluteString)
            if let uidVal = q["uid"]{
               Uid = uidVal
                print(Uid)
            }
        }  .alert(isPresented: $loginVM.isNotAuthenticated) {
            Alert(
                title: Text("Sign In Failed"),
                message: Text("Invlaid username or password")
            )
        }
    }

}

func getQueryItems(_ urlString: String) -> [String : String] {
        var queryItems: [String : String] = [:]
        let components: NSURLComponents? = getURLComonents(urlString)
        for item in components?.queryItems ?? [] {
            queryItems[item.name] = item.value?.removingPercentEncoding
        }
        return queryItems
    }
    
    func getURLComonents(_ urlString: String?) -> NSURLComponents? {
        var components: NSURLComponents? = nil
        let linkUrl = URL(string: urlString?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")
        if let linkUrl = linkUrl {
            components = NSURLComponents(url: linkUrl, resolvingAgainstBaseURL: true)
        }
        return components
    }
//    func authenticateUser(username : String, password : String){
//        if username.lowercased()=="ice123"{
//            wrongUsername=0
//            if password.lowercased()=="ice123"{
//            wrongPassword=0
//                isAuthen = true
//            } else{
//                wrongPassword = 2
//            }
//        }else{
//            wrongUsername = 2
//        }
//
//            }}

            


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
struct customButtonModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .background(Color(red: 171 / 255, green: 70 / 255, blue: 70 / 255, opacity: 1))
            .cornerRadius(29)
            .padding(10)
            .multilineTextAlignment(.center)
    }
}


struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square").foregroundColor(Color(.white))
                configuration.label
            }
        })
    }
}




