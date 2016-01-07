//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var str1 = "Ashley"

str + str1

for char in str1.characters {
    
    print(char)
    
}
 var ashley = "Ashley is the coolest"

var newString = NSString(string: ashley)







newString.substringToIndex(3)

newString.substringWithRange(NSRange(location: 2, length: 9))




newString.containsString("Ash")

newString.componentsSeparatedByString(" ")


newString.uppercaseString

newString.lowercaseString