//
//  ContentView.swift
//  HeartBeatApp
//
//  Created by Pouya Sadri on 14/02/2024.
//
// Instagram : @Pouyasadri_dev

import SwiftUI
//MARK: - Content view
struct ContentView: View {
	
	@State private var isAnimatingHeart = false
	@State private var isAnimatingPulse = false
	
	
    var body: some View {
		ZStack{
			BackgroundView()
			VStack{
				HeaderTextView()
				Spacer()
				HeartAnimationView(isAnimatingHeart: $isAnimatingHeart, isAnimatingPulse: $isAnimatingPulse)
				Spacer()
				FooterTextView()
			}
		}
    }
}

#Preview {
    ContentView()
}
//MARK: - Background view
struct BackgroundView : View {
	var body: some View {
		LinearGradient(gradient: Gradient(colors: [Color(red: 229/255, green: 93/255, blue: 135/255),Color(red: 95/255, green: 195/255, blue: 228/255)]), startPoint: .top, endPoint: .bottom)
			.ignoresSafeArea()
	}
}
//MARK: - Header text view
struct HeaderTextView : View {
	var body: some View {
		Text("HEALTH HEARTBEAT SWIFTUI")
			.font(.headline)
			.fontWeight(.medium)
			.foregroundStyle(.white)
			.padding()
	}
}

//MARK: - Heart Animation View
struct HeartAnimationView : View {
	@Binding var isAnimatingHeart : Bool
	@Binding var isAnimatingPulse : Bool
	
	var body: some View {
		ZStack{
			HeartView(isAnimating: $isAnimatingHeart)
			PulseView(isAnimating: $isAnimatingPulse)
		}
	}
}

//MARK: - Heart view
struct HeartView : View {
	@Binding var isAnimating : Bool
	var body: some View {
		Image("heart")
			.scaleEffect(isAnimating ? 1 : 1.3)
			.animation(Animation.interpolatingSpring(stiffness: 30, damping: 10)
				.speed(1.5)
				.repeatForever(autoreverses: false)
			, value: isAnimating)
			.onAppear{
				isAnimating.toggle()
			}
			
	}
}

//MARK: - Pulse View
struct PulseView : View {
	@Binding var isAnimating : Bool
	var body: some View {
		Image("mypulse")
			.resizable()
			.frame(width: 100,height: 100)
			.clipShape(Rectangle().offset(x: isAnimating ? 0 : -125))
			.animation(Animation.interpolatingSpring(stiffness: 30, damping: 10)
				.speed(1.3)
				.repeatForever(autoreverses: true)
					   , value: isAnimating)
			.offset(x:-12)
			.onAppear{
				isAnimating.toggle()
			}
		
	}
}

//MARK: - Footer Text View
struct FooterTextView : View {
	var body: some View {
		Text("Create by Pouya Sadri")
			.font(.subheadline)
			.fontWeight(.light)
			.foregroundStyle(.white)
			.padding()
	}
}
