import SwiftUI
struct Bicicleta: Identifiable {
    let id = UUID()
    let nombre: String
    let color: String
    let rin: String
    let cambios: String?
    let disponible: Bool
    let imagen: String // Nombre de la imagen en Assets
}

struct CatalogoBicicletasView: View {
    let bicicletas: [Bicicleta] = [
        Bicicleta(nombre: "Bicicleta Urbana", color: "Blanco", rin: "700", cambios: "Sin cambios", disponible: true, imagen: "urbana"),
        Bicicleta(nombre: "Bicicleta MTB", color: "Negro", rin: "27.5", cambios: "21v", disponible: true, imagen: "mtb"),
        Bicicleta(nombre: "Bicicleta Eléctrica", color: "Blanco", rin: "26", cambios: "Automática", disponible: true, imagen: "electrica"),
        Bicicleta(nombre: "Bicicleta Plegable", color: "Rojo", rin: "20", cambios: "6v", disponible: false, imagen: "plegable"),
        Bicicleta(nombre: "Bicicleta de Ruta", color: "Azul", rin: "700", cambios: "22v", disponible: true, imagen: "ruta")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Catálogo de Bicicletas")
                    .font(.title)
                    .bold()
                    .padding(.leading)
                
                ForEach(bicicletas) { bici in
                    HStack(alignment: .top) {
                        Image(bici.imagen)
                            .resizable()
                            .frame(width: 100, height: 70)
                            .cornerRadius(8)
                            .padding(4)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(bici.nombre)
                                .font(.headline)
                            Text("Color: \(bici.color), Rin: \(bici.rin), Cambios: \(bici.cambios ?? "-")")
                                .font(.subheadline)
                            Text("\(bici.disponible ? "Disponible" : "No disponible")")
                                .foregroundColor(bici.disponible ? .green : .red)
                                .font(.subheadline)
                        }
                        .padding(4)
                        Spacer()
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle("Catálogo")
    }
}

