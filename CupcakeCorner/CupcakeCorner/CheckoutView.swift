//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Sean McDonald on 5/5/26.
//

import SwiftUI

struct CheckoutView: View {
    @State private var message = ""
    @State private var showingConfirmation = false
    @State private var showingError = false
    var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") {}
        } message: {
            Text(message)
        }
        .alert("Error", isPresented: $showingError) {
            Button("OK") {}
        } message: {
            Text(message)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            print(String(data: data, encoding: .utf8) ?? "Invalid response")
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            message = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            message = error.localizedDescription
            print("Checkout failed: \(error.localizedDescription)")
            showingError = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
