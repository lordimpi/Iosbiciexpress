//
//  ContentView.swift
//  Bici
//
//  Created by Telematica on 5/06/25.
//

import SwiftUI

struct UserProfile {
    var name: String = ""
    var isStudent: Bool = true
    var age: Int = 18
    var prefersDarkMode: Bool = false
}

struct ContentView: View {
    @State private var profile = UserProfile()
    
    var body: some View {
        NavigationView {
            VStack {
                //Text("Inicio")
                    //.font(.title)
                    //.bold()
                    //.padding()
                
                Image("MiLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 350)
                                .padding()
                
                NavigationLink("Ir a Perfil") {
                    ProfileView(profile: $profile)
                }
                .padding()
                
                NavigationLink("Preferencias") {
                    PreferencesView(profile: $profile)
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
            .navigationTitle("")
        }
    }
}

// Pantalla 2: Perfil
struct ProfileView: View {
    @Binding var profile: UserProfile
    
    var body: some View {
        Form {
            TextField("Nombre", text: $profile.name)
            Toggle("¿Eres estudiante?", isOn: $profile.isStudent)
            Stepper("Edad: \(profile.age)", value: $profile.age, in: 5...100)
        }
        .navigationTitle("Perfil")
    }
}

// Pantalla 3: Preferencias
struct PreferencesView: View {
    @Binding var profile: UserProfile
    
    var body: some View {
        Form {
            Toggle("Modo oscuro", isOn: $profile.prefersDarkMode)
        }
        .navigationTitle("Preferencias")
    }
}

// Pantalla 4: Resumen
struct SummaryView: View {
    let profile: UserProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("MiLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()            //Text("Nombre: \(profile.name)")
            //Text("Estudiante: \(profile.isStudent ? "Sí" : "No")")
            //Text("Edad: \(profile.age)")
            //Text("Modo Oscuro: \(profile.prefersDarkMode ? "Activado" : "Desactivado")")
            Text("Hola, somos BiciExpress y les presentamos una solución rápida y sostenible para la movilidad urbana: nuestra aplicación de alquiler de bicicletas. Con un diseño simple, amigable y funcional, esta app permite a los usuarios explorar un catálogo de bicicletas disponibles, conocer sus características, y realizar una reserva inmediata, todo desde su celular.")
        }
        .padding()
        .navigationTitle("Resumen")
    }
}

// Pantalla 5: Créditos
struct CreditsView: View {
    var body: some View {
        VStack(spacing: 10) {
            //Text("BiciExpress")
                //.font(.title2)
            Image("MiLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .padding()
                
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
