//
//  swiftFactorials.swift
//  swiftFactorials
//
//  Created by Alejandro D on 15/05/20.
//  Copyright © 2020 Alejandro D. All rights reserved.
//

import Foundation

/// Main Function
/// - Parameters:
///   - num: The number you want to get the factorial of.
///   - mode: The mode you want to use
///       - 1: n!     Normal factorial
///       - 2: n!!    Semi-factorial
///       - 3: (n!)!  Twice iterated factorial
/// - Returns: A string with the result
func n(_ num : Int,_ mode : Int = 1) -> String {
    
    /// Funtion to multiply between Strings. Infinite numbers are achived with this function
    /// - Parameters:
    ///   - num1: First number as a String
    ///   - num2: Second number as a String
    /// - Returns: String with the product of the multiplication
    func multiply(num1: String, num2: String) -> String {
        
        
        /// Main multiplication
        func mul(num1: String, num2 : String) -> [String] {
            
            func mulPor1 (num1: String, num2 : String) -> String {
                let num = "0"+num1
                var rest = 0
                var result = ""
                var finalResult = ""
                if num.count >= num2.count {
                    for x in num2.reversed() {
                        for y in num.reversed() {
                            result += String((Int(String(x))! * Int(String(y))!+rest) % 10)
                            rest =  (Int(String(x))! * Int(String(y))!+rest) / 10
                        }
                    }
                }
                for i in result.reversed(){
                    finalResult += String(i)
                }
                
                
                if finalResult[String.Index(utf16Offset: 0, in: finalResult)] == "0" {
                    finalResult.remove(at: finalResult.startIndex)
                }
                return finalResult
            }
            var resultados : [String] = []
            for i in num2.reversed(){
                resultados.append(mulPor1(num1: num1, num2: String(i)))
            }
            return resultados
        }
        
        /// Sum of multiplication results
        func sum(num1: String, num2 : String) -> String {
            
            func mulPor1 (num1: String, num2 : String) -> String {
                let num = "0"+num1
                let numm = "0"+num2
                
                var rest = 0
                var result = ""
                var finalResult = ""
                if num.count >= numm.count {
                    var n = num2
                    for _ in 1...(num.count-num2.count) {
                        n = "0\(n)"
                    }
                    for i in (0..<num.count).reversed(){
                        let n1 = Int(String(num[String.Index(utf16Offset: i, in: num)]))!
                        let n2 = Int(String(n[String.Index(utf16Offset: i, in: n)]))!
                        result += String((n1 + n2 + rest) % 10)
                        rest = (n1 + n2 + rest) / 10
                    }
                    
                }
                for i in result.reversed(){
                    finalResult += String(i)
                }
                if finalResult[String.Index(utf16Offset: 0, in: finalResult)] == "0" {
                    finalResult.remove(at: finalResult.startIndex)
                }
                return finalResult
            }
            if num1.count > num2.count {
                return mulPor1(num1: num1, num2: num2)
            } else {
                return mulPor1(num1: num2, num2: num1)
            }
        }
        
        var o : [String] = []
        if num1.count > num2.count {
            o = mul(num1: num1, num2: num2)
        } else {
            o = mul(num1: num2, num2: num1)
        }
        

        var no = ""
        var resultadoFor : [String] = []
        for i in o {
            resultadoFor.append(i + no)
            no += "0"
            
        }
        var initi = "0"
        for i in resultadoFor {
            initi = sum(num1: i, num2: initi)
        }

        return initi
    }
    
    /// Factorial (mode 1) main function
    func factorial(_ num : Int) -> String {
        
        var a = "1"
        for i in 1...num {
            a = multiply(num1: a, num2: "\(i)")
        }
        return a
    }
    
    /// Twice iterated factorial (mode 3) function
    func factorialIterated(_ num : String,_ orig : Int) -> String {
        
        var a = "1"
        for i in 1...Int(num)! {
            a = multiply(num1: a, num2: "\(i)")
        }
        return "(n!)! \(orig) = \(a)"
    }
    
    /// Semi-factorial main function
    func semiFactor(_ num : Int) -> String {
        
        func getPair(_ num : Int) -> Int {
            if num.isMultiple(of: 2){
                return 0
            } else {
                return 1
            }
        }
        
        let pair = getPair(num)
        var a = "1"
        
        for i in (1...num).reversed(){
            if i.isMultiple(of: 2) && pair == 0{
                a = multiply(num1: a, num2: "\(i)")
            } else if (i.isMultiple(of: 2) == false) && pair == 1{
               a = multiply(num1: a, num2: "\(i)")
            }
        }
        return "n!! \(num) = \(a)"
    }
    
    func returnZero (_ num : Int, _ mode : Int = 1) -> String {
        if mode == 1 {
            return "n! 0 = 1"
        } else {
            return "n!! 0 = 1"
        }
    }
    
    if num < 0 {
        return "Can't calulate"
    } else if num == 0{
        return returnZero(num, mode)
    } else {
        if mode == 2 {
            return semiFactor(num)
        } else if mode == 1 {
            return "n! \(num) = \(factorial(num))"
        } else if mode == 3 {
            let firstFactorial = factorial(num)
            return factorialIterated(firstFactorial, num)
        } else {
            return "Error"
        }
    }
}

print(n(5)) // n! 5 = 120
print(n(7)) // n! 7 = 5040
