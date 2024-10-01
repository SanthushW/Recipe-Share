//
//  login.swift
//  Recipe-Share
//
//  Created by COCOMPBSC23.1p-030 on 2024-09-28.
//
import SwiftUI

struct LoginView: View {
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            // Title
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Subtitle
            Text("Login to existing account.")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.top, 2)
            
            // Phone Number Field
            TextField("Phone number", text: $phoneNumber)
                .padding()
                .background(Color.white.opacity(1)) // Adjust opacity for a lighter gray
                .cornerRadius(10)
                .padding(.top, 20)

            // Password Field
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(1))
                .cornerRadius(10)
                .padding(.top, 10)
            
            // Login Button
            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            // Forgot Password Link
            Button(action: {
                // Handle forgot password action
            }) {
                Text("Forgot password ?")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.top, 10)
            }
            
            // Continue with Apple
            Button(action: {
                // Handle Continue with Apple
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Continue with Apple")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding(.top, 20)
            
            // Continue with Google
            Button(action: {
                // Handle Continue with Google
            }) {
                HStack {
                    Image(systemName: "globe")
                    Text("Continue with Google")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding(.top, 10)
            
            Spacer()
            
            // Sign Up Link
            HStack {
                Text("New to Recipe Share?").foregroundColor(.white)
                Button(action: {
                    // Handle sign up action
                }) {
                    Text("Sign Up for free")
                        .foregroundColor(.blue)
                }
            }
            .font(.footnote)
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 30)
        .background(Color.orange)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Make it full screen
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

#Preview {
    LoginView()
}
