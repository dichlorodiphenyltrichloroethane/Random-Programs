//
//  ContentView.swift
//  Shared
//
//  Created by Jackey Song on 22/1/2022.
//

/*This code is replica of https://www.youtube.com/watch?v=9sZuR4eaPDU Kavasoft
 and it was used to understand implementation of pinch and zoom gesture
 
 Main takeaway:
 - UIPinch/PanGestureRecognizer
 
 Need further understanding of:
 - Context
 - delegate
 - Geometry Reader
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("textImg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getReact().width - 30, height: 250)
                .cornerRadius(15)
                .addPinchZoom()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Pinch to zoom modifier

extension View {
    func addPinchZoom() -> some View {
        return PinchZoomContext {
            self
        }
    }
}

//Helper Struct
struct PinchZoomContext<Content: View>: View {
    var content: Content
    init(@ViewBuilder content: @escaping ()->Content) {
        self.content = content()
    }
    
    @State var offset: CGPoint = .zero
    @State var scale: CGFloat = 0
    
    @State var scalePosition: CGPoint = .zero
    
    var body: some View {
        content
        //Applying offset before sscaling
            .offset(x: offset.x, y: offset.y)
        //Using UIKit Gesture for simulatenously recongise both Ounch and pan gesture
            .overlay(
                GeometryReader{ proxy in
                    let size = proxy.size
                    ZoomGesture(size: size, scale: $scale, offset: $offset, scalePosition: $scalePosition)
                    
                }
            )
        //Scaling content
            .scaleEffect(1 + scale, anchor: .init(x: scalePosition.x, y: scalePosition.y))
    }
}

struct ZoomGesture: UIViewRepresentable {
    
    //getting size for calculating scale
    var size : CGSize
    
    @Binding var scale: CGFloat
    @Binding var offset : CGPoint
    
    @Binding var scalePosition: CGPoint
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        //Adding gesture
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePinch(sender:)))
        
        view.addGestureRecognizer(pinchGesture)
        
        //Adding pan gesture
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePan(sender:)))
        
        panGesture.delegate = context.coordinator
        
        view.addGestureRecognizer(pinchGesture)
        view.addGestureRecognizer(panGesture)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    //Handlers for gestures
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        
        var parent: ZoomGesture
        
        init(parent: ZoomGesture) {
            self.parent = parent
        }
        
        //Making pan to recognise simulatenously
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
        
        @objc
        func handlePan(sender: UIPanGestureRecognizer) {
            
            sender.maximumNumberOfTouches = 2
            
            //min scale is 1
            if (sender.state == .began || sender.state == .changed) {
                if let view = sender.view {
                    
                    //Geeting translation
                    let translation = sender.translation(in: view)
                    
                    parent.offset = translation
                }
            } else{
                //setting state back to normal
                withAnimation{
                    parent.offset = .zero
                    parent.scalePosition = .zero
                }
            }
        }
        
        @objc
        func handlePinch(sender: UIPinchGestureRecognizer) {
            //Calculating scale
            if (sender.state == .began || sender.state == .changed) {
                //Set the scale
                parent.scale = (sender.scale - 1)
                
                //Getting the position where the user pinched and applying scale at the position
                
                let scalePoint = CGPoint(x: sender.location(in: sender.view).x / sender.view!.frame.size.width, y: sender.location(in: sender.view).y / sender.view!.frame.size.height)
                
                //result will me ((0...1), (0...1))
                
                //updates scale point for only once
                parent.scalePosition = (parent.scalePosition == .zero ? scalePoint : parent.scalePosition)
            } else {
                withAnimation(.easeInOut(duration: 0.35)) {
                    parent.scale = 0
                    parent.scalePosition = .zero
                }
            }
            
        }
    }
}

//to get screen bound
extension View {
    func getReact() -> CGRect {
        return UIScreen.main.bounds
    }
}
