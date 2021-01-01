//
//  ContentView.swift
//  Project3
//
//  Created by Timothy Hoiberg on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = false
    @State private var birthDate = Date()
    @State private var selection = 0
    @State private var isHovering = false
    @State private var escapeName = ""
    @State private var deleteName = ""
    @State private var menuSelection = Set<Int>()
    
    var body: some View {
        HStack {
            // Link Button
            Button("Visit Apple" ) {
                NSWorkspace.shared.open(URL(string: "https://www.apple.com")!)
            }
            .buttonStyle(LinkButtonStyle())
            .padding()
            
            // Toggle
            Toggle(isOn: $isEnabled) {
                Text("Enable the flux capacitor")
            }
            .toggleStyle(SwitchToggleStyle())
            .padding()
        }
        // Graphical Date Picker
        VStack(alignment: .leading) {
            DatePicker("Select  your birth date", selection: $birthDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
        }
        
        // Button Sizes
        HStack {
            ForEach(ControlSize.allCases, id: \.self) { size in
                Button("Click Me") {
                    print("\(size) button pressed")
                }
                .controlSize(size)
            }
        }
        .padding()
        
        // Picker
        Picker("Select an option", selection: $selection) {
            ForEach(0..<5) { number in
                Text("Option \(number)")
            }
        }
        .pickerStyle(RadioGroupPickerStyle())
        .padding()
        
        // Menu Button
        MenuButton("Options") {
            Button("Order Coffee") {
                print("Get me an espresso!")
            }
            
            Button("Log Out") {
                print("TTFN")
            }
        }
        .padding()
        .menuButtonStyle(BorderlessPullDownMenuButtonStyle())
        
        // Hover
        Text("Hello World")
            .foregroundColor(isHovering ? Color.green : Color.red)
            .padding()
            .onHover { over in
                self.isHovering = over
            }
        
        // Escape key
        TextField("Enter your name", text: $escapeName)
            .onExitCommand(perform: {
                print("Cancel name entry")
            })
        
        // Delete menu option
        TextField("Enter your name", text: $deleteName)
            .onDeleteCommand(perform: {
                print("Delete pressed")
            })
        
        // Responding to Menus
        List(0..<4, selection: $menuSelection) { num in
            Text("Row \(num)")
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onCommand(#selector(Commands.showSelection), perform: {
            print("Selection: \(self.selection)")
        })
        
        // Opening a window
        Button("Show New Window") {
            let controller = DetailWindowController(rootView: DetailView())
            controller.window?.title = "New window"
            controller.showWindow(nil)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Commands {
    @IBAction func showSelection(_ sender: Any) {
        
    }
}

class DetailWindowController<RootView: View>: NSWindowController {
    convenience init(rootView: RootView) {
        let hostingController = NSHostingController(rootView: rootView.frame(width: 300, height: 400))
        let window = NSWindow(contentViewController: hostingController)
        window.setContentSize(NSSize(width: 300, height: 400))
        self.init(window: window)
    }
}

struct DetailView: View {
    var body: some View {
        Text("Second View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
