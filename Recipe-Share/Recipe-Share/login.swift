import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var showingErrorAlert = false
    
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
            
            // Email Field
            TextField("Email", text: $email)
                .padding()
                .background(Color.white.opacity(1))
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
                login()
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
            .alert(isPresented: $showingErrorAlert) {
                Alert(title: Text("Login Error"), message: Text(errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
            }
            
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // Firebase Login Function
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle login error
                errorMessage = error.localizedDescription
                showingErrorAlert = true
                return
            }
            // Handle successful login
            print("User logged in successfully")
        }
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
