struct swift_Factorials {
    
    /// Main Function
    /// - Parameters:
    ///   - num: The number you want to get the factorial of.
    ///   - mode: The mode you want to use
    ///       - 1: n!     Normal factorial
    ///       - 2: n!!    Semi-factorial
    ///       - 3: (n!)!  Twice iterated factorial
    /// - Returns: A string with the result
    func factorialOf(_ num : Int,_ mode : Int = 1) -> String {
        
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
                var listResults : [String] = []
                for i in num2.reversed(){
                    listResults.append(mulPor1(num1: num1, num2: String(i)))
                }
                return listResults
            }
            
            /// Join multiplication results. (result1 x1) + (result2 x 10) + (result3 x 100) + (result4 x 1000) + (...)
            func join(num1: String, num2 : String) -> String {
                
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
            
            var listWithResults : [String] = []
            if num1.count > num2.count {
                listWithResults = mul(num1: num1, num2: num2)
            } else {
                listWithResults = mul(num1: num2, num2: num1)
            }
            

            var zerosToAdd = ""
            var resultsWithZeros : [String] = []
            for result in listWithResults {
                resultsWithZeros.append(result + zerosToAdd)
                zerosToAdd += "0"
                
            }
            var initi = "0"
            for i in resultsWithZeros {
                initi = join(num1: i, num2: initi)
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
            } else if mode == 2 {
                return "n!! 0 = 1"
            } else {
                return "(n!)! 0 = 1"
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

    
}
