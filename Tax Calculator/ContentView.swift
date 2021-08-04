//
//  ContentView.swift
//  Tax Calculator
//
//  Created by Wyatt Knepp on 8/4/21.
//


import SwiftUI

struct ContentView: View {
	
	@State var price = ""
	@State var tax = 0.0882
	@State var final = 0.0
	@State var backgroundColor = Color.gray
	var body: some View {
		NavigationView {
			ZStack {
				backgroundColor
					.ignoresSafeArea()
				VStack{
					Text("Tax Calculator")
						.font(.title)
						.bold()
						.padding()
					
					Picker("State", selection: $tax) {
						Group {
							Text("AL").tag(0.0922)
							Text("AK").tag(0.0176)
							Text("AZ").tag(0.0840)
							Text("AR").tag(0.0951)
							Text("CA").tag(0.0868)
							Text("CO").tag(0.0772)
							Text("CT").tag(0.0635)
							Text("DE").tag(0.0)
							Text("FL").tag(0.0708)
							Text("GA").tag(0.0732)
						}
						Group {
							Text("HI").tag(0.0444)
							Text("ID").tag(0.0603)
							Text("IL").tag(0.0882)
							Text("IN").tag(0.0700)
							Text("IA").tag(0.0694)
							Text("KS").tag(0.0869)
							Text("KY").tag(0.0600)
							Text("LA").tag(0.0952)
							Text("ME").tag(0.0550)
							Text("MD").tag(0.0600)
						}
						Group {
							Text("MA").tag(0.0635)
							Text("MI").tag(0.0600)
							Text("MN").tag(0.0746)
							Text("MS").tag(0.0707)
							Text("MO").tag(0.0825)
							Text("MT").tag(0.0)
							Text("NE").tag(0.0694)
							Text("NV").tag(0.0823)
							Text("NH").tag(0.0)
							Text("NJ").tag(0.0660)
						}
						Group {
							Text("NM").tag(0.0783)
							Text("NY").tag(0.0852)
							Text("NC").tag(0.0698)
							Text("ND").tag(0.0696)
							Text("OH").tag(0.0723)
							Text("OK").tag(0.0895)
							Text("OR").tag(0.0)
							Text("PA").tag(0.0634)
							Text("RI").tag(0.0700)
							Text("SC").tag(0.0746)
						}
						Group {
							Text("SD").tag(0.0640)
							Text("TN").tag(0.0955)
							Text("TX").tag(0.0819)
							Text("UT").tag(0.0719)
							Text("VT").tag(0.0624)
							Text("VA").tag(0.0573)
							Text("WA").tag(0.0923)
							Text("WV").tag(0.0650)
							Text("WI").tag(0.0543)
							Text("WY").tag(0.0533)
						}
					}
					.pickerStyle(WheelPickerStyle())
					.padding()
					
					Text("Price")
					TextFieldView(field: $price)
					
					Button(action: {
						final = calculateFinal(tax: tax, price : price)
					}) {
						Text("Calculate!")
							.foregroundColor(.white)
							.fontWeight(.bold)
							
							.padding()
							.frame(width: 200.0, height: 50.0)
							.background(RoundedRectangle(cornerRadius: 10)
									.fill(Color.black)
									.frame(width: 200, height: 50, alignment: .center)
							)
						
					}
					
					Text("Total")
					
					Text("$\((final), specifier: "%.2f")")
					Spacer()
				}
			}
		}
	}
	
	func calculateFinal(tax : Double, price : String) -> Double {
		
		
		if let currentPrice = Double(price){
			
			return currentPrice * (tax + 1.0)
		}
		
		
		return 0
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


struct TextFieldView: View {
	
	let fontsize: CGFloat = 14
	let backgroundColor = Color.white
	let textColor = Color.black
	
	@Binding var field: String
	
	@State var isHighlighted = false
	
	var body: some View {
		TextField(field, text: $field)
			.font(Font.system(size: fontsize))
			.padding()
			.background(RoundedRectangle(cornerRadius: 10).fill(backgroundColor))
			.foregroundColor(textColor)
			.padding()
	}
}
