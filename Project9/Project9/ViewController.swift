//
//  ViewController.swift
//  Project9
//
//  Created by Timothy Hoiberg on 29/9/20.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        log(message: "Test msg")
        runBackgroundCode1()
        runBackgroundCode2()
        runBackgroundCode3()
        runBackgroundCode4()
        runSynchronousCode()
        runMultiprocessing1()
        runMultiprocessing(useGCD: true)
        runMultiprocessing(useGCD: false)
    }
    
    @objc func log(message: String) {
        print("Printing: \(message)")
    }
    
    func runBackgroundCode1() {
        performSelector(inBackground: #selector(log), with: "Hello world 1")
        performSelector(onMainThread: #selector(log), with: "Hello world 2", waitUntilDone: false)
        log(message: "Hello World 3")
    }
    
    func runBackgroundCode2() {
        DispatchQueue.global().async { [unowned self] in
            self.log(message: "On background thread")
        }
        
        DispatchQueue.main.async { [unowned self] in
            self.log(message: "On main thread")
        }
    }
    
    func runBackgroundCode3() {
        DispatchQueue.global().async {
            guard let url = URL(string: "https://www.apple.com") else { return }
            guard let str = try? String(contentsOf: url) else { return }
            print(str)
        }
    }
    
    func runBackgroundCode4() {
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in
            self.log(message: "This is high priority")
        }
    }
    
    func runSynchronousCode() {
        DispatchQueue.global().async {
            print("Background thread 1")
        }
        
        print("Main thread 1")
        
        DispatchQueue.global().sync {
            print("Background thread 2")
        }
        
        print("Main thread 2")
    }
    
    func runMultiprocessing1() {
        DispatchQueue.concurrentPerform(iterations: 10) {
            print($0)
        }
    }
    
    func runMultiprocessing(useGCD: Bool) {
        func fibonacci(of num: Int) -> Int {
            if num < 2 {
                return num
            } else {
                return fibonacci(of: num - 1) + fibonacci(of: num - 2)
            }
        }
        
        var array = Array(0 ..< 42)
        let start = CFAbsoluteTimeGetCurrent()
        
        if useGCD {
            DispatchQueue.concurrentPerform(iterations: array.count) {
                array[$0] = fibonacci(of: $0)
            }
        } else {
            for i in 0 ..< array.count {
                array[i] = fibonacci(of: array[i])
            }
        }
        
        let end = CFAbsoluteTimeGetCurrent() - start
        print("Took \(end) seconds")
    }
}

//0
//8
//9
//3
//4
//5
//6
//7
//2
//1
