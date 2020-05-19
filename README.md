This proyect divides in two:

- [Swift main function](https://github.com/AOx0/Swift-Factorials#swift-factorials)
- [Command line tool made with the function](https://github.com/AOx0/Swift-Factorials#command-line-tool)



# Swift-Factorials

This is a swift function that calculates:

- Factorials [ **n!** ]
- Semi-factorials [ **n!!** ]
- Twice iterated factorials [ **(n!)!** ]

This function allows to obtain infinite numbers due to a function that performs multiplications using and returning Strings.



As each factorial increases exponentially, the time to calculate the next factorial increases exponentially as well.

## Time examples:

n! 1000 = 0.1 min

n! 2700 = 5.0 min

n! 3000 = 7.0 min

n! 4000 = 1.6 min

n! 5000 = 2.8 min

n! 6000 = 4.5 min



## How to use?

```swift
n(5) // n! 5 = 120
```

Parameters:

- **num**: The number you want to get the factorial of.

- **mode**: The mode you want to use (1 by default)
  - 1: **n!**  :  Normal factorial
  - 2: **n!!**  :  Semi-factorial
  - 3: **(n!)!**  :  Twice iterated factorial

Returns: A string with the result

### Examples:

```swift
n(3) 	 // n! 3 = 6
n(3,1) // n! 3 = 6
n(3,2) // n!! 3 = 3
n(3,3) // (n!)! 3 = 720
```

# Command Line Tool

The function is available as a simple command line tool. 

<u>Features:</u>

   - **n!** : Calculates *Factorials*
   - **n!!** : Calculates *Semi-factorials*
   - **(n!)!** : Calculates *Twice iterated factorials*
   - Simple user interface
   - Command line arguments

macOS 10.9 or higher required

## Command Line Arguments

The tool can receive arguments when executing it, avoiding to enter the full interface. Arguments passed in this way are different from those used inside the program.

```
nl == n!

nll == n!!

nll == (n!)!
```

Example:

```
some@Mac ~ % swiftFactorials nl 6
n! 6 = 720
some@Mac ~ % swiftFactorials nll 6
n!! 6 = 48
some@Mac ~ % swiftFactorials nlll 3
(n!)! 3 = 720
```

## Commands In-App

The program has a simple interface where unlimited calculations can be made. As mentioned before, arguments from command line execution and arguments inside the program are different.

 **n!** : Factorial

 **n!!** : Semi-Factorial

 **(n!)!** : Twice iterated factorial 

Example:

```
some@Mac ~ % swiftFactorials
Factorial Calculator v1.0.0 - AOx0
 n!    :      Factorial
 n!!   :      Semi-Factorial
 (n!)! :      Twice iterated factorial 
 usage: [exit] <mode> <number>
        example: n!! 982

>>>  n! 6
n! 6 = 720
>>>  n!! 6
n!! 6 = 48
>>>  (n!)! 3
(n!)! 3 = 720
>>> exit
some@Mac ~ %
```

You can always use `exit` to terminate de program.



# Features to add

List of updates for both, the command line tool and the function.

- *Checkpoints* where to start to callculate x thing. There's no need to start from 0 every time.
- ...
