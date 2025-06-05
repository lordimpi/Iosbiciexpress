
import SwiftUI

struct UserProfile {
    var name: String = ""
    var isStudent: Bool = true
    var age: Int = 18
    var prefersDarkMode: Bool = false
    var correo: String = ""
}

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    
    var body: some View {
        if isAuthenticated {
            MainMenuView()
        } else {
            LoginView(onLoginSuccess: {
                isAuthenticated = true
            })
        }
    }
}

// Pantalla de login y registro
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isRegistering = false
    var onLoginSuccess: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Image("MiLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
            Text(isRegistering ? "Registro" : "Iniciar Sesión")
                .font(.largeTitle)
                .bold()
            
            TextField("Correo electrónico", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Contraseña", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(isRegistering ? "Registrarse" : "Entrar") {
                // Aquí puedes agregar lógica de validación básica
                if !email.isEmpty && !password.isEmpty {
                    onLoginSuccess()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button(isRegistering ? "¿Ya tienes cuenta? Inicia sesión" : "¿No tienes cuenta? Regístrate") {
                isRegistering.toggle()
            }
            .foregroundColor(.gray)
        }
        .padding()
    }
}

// Menú principal (antes ContentView)
struct MainMenuView: View {
    @State private var profile = UserProfile()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Ir a Perfil") {
                    ProfileView(profile: $profile)
                }
                .padding()
                
                NavigationLink("Catálogo de Bicicletas") {
                    CatalogoBicicletasView()
                }
                .padding()
                
                NavigationLink("Resumen") {
                    SummaryView(profile: profile)
                }
                .padding()
                
                NavigationLink("Créditos") {
                    CreditsView()
                }
                .padding()
            }
            .navigationTitle("Menú Principal")
        }
    }
}


// Pantalla 2: Perfil
struct ProfileView: View {
    @Binding var profile: UserProfile
    
    var body: some View {
        Form {
            TextField("Nombre", text: $profile.name)
            TextField("Correo", text: $profile.correo)
            Toggle("¿Eres estudiante?", isOn: $profile.isStudent)
            Stepper("Edad: \(profile.age)", value: $profile.age, in: 5...100)
            
        }
        .navigationTitle("Perfil")
    }
}

// Pantalla 3: Preferencias
//struct PreferencesView: View {
//    @Binding var profile: UserProfile
    
 //   var body: some View {
   //     Form {
     //       Toggle("Modo oscuro", isOn: $profile.prefersDarkMode)
       // }
       // .navigationTitle("Preferencias")
    //}
//}

// Pantalla 4: Resumen
struct SummaryView: View {
    let profile: UserProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            //Text("Nombre: \(profile.name)")
            //Text("Estudiante: \(profile.isStudent ? "Sí" : "No")")
            //Text("Edad: \(profile.age)")
            //Text("Modo Oscuro: \(profile.prefersDarkMode ? "Activado" : "Desactivado")")
            Image("MiLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
            Text("Hola, somos BiciExpress y les presentamos una solución rápida y sostenible para la movilidad urbana: nuestra aplicación de alquiler de bicicletas.")
            Text("Con un diseño simple, amigable y funcional, esta app permite a los usuarios explorar un catálogo de bicicletas disponibles, conocer sus características, y realizar una reserva inmediata, todo desde su celular.")
        }
        .padding()
        .navigationTitle("Resumen")
    }
}

// Pantalla 5: Créditos
struct CreditsView: View {
    var body: some View {
        ZStack {
            Image("MiLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                
                //Text("BiciExpress")
                    //.font(.title2)
                Text("Desarrollado por:")
                Text("🧑‍💻 Santiago Acuña Obando")
                Text("🧑‍💻 Juan Jose Dorado Piamba")
                Text("🧑‍💻 David Alejandro Guerrero")
                Text("MicroProyecto IOS - SwiftUI")
            }
            .padding()
            .navigationTitle("Créditos")
        }
    }
}
