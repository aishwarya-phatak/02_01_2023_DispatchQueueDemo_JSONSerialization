//
//  ViewController.swift
//  02_01_2023_DispatchQueueDemo
//
//  Created by Vishal Jagtap on 07/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
           // creationOfTestQueues1()
            //creationOfTestQueues2()
            creationOfTestQueues3()
        
    }
    
    func creationOfTestQueues3(){
        let testQueueConcurrent = DispatchQueue(label: "com.bitcode.testQueueConcurrent")
        
        testQueueConcurrent.async {
            for i in 1..<4{
                print("iOS -- testCQ -- \(i)")
            }
        }
        
        testQueueConcurrent.async {
            for j in 1..<4{
                print("Android -- testCQ -- \(j)")
            }
        }
        
        testQueueConcurrent.async {
            for k in 1..<4{
                print("java -- testCQ -- \(k)")
            }
        }
    }
    
    func creationOfTestQueues2(){
        let testHighQosQueue1 = DispatchQueue(label: "com.bitcode.testHighQosQueue1",qos: DispatchQoS.userInteractive)
        
        let lowQosQueue2 = DispatchQueue(label: "com.bitcode.lowQosQueue2",qos:DispatchQoS.background)
        
        testHighQosQueue1.async {
            for i in 1..<4{
                print("iOS -- \(i)")
            }
        }
        
        
        lowQosQueue2.async {
            for i in 1..<4{
                print("Android -- \(i)")
            }
        }
    }
    
    
    func creationOfQueues(){
        let testQueue = DispatchQueue(label: "com.bitcode.testQueue")
        
        testQueue.async {
            for i in 1..<4{
                print("iOS - testQueue \(i)")
            }
        }
        
        for j in 1..<4{
            print("j -- \(j)")
        }
    }
}
