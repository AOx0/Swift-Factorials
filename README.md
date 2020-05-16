# Swift-Factorials
This swift function calculates:

- Factorials [ **n!** ]
- Semi-factorials [ **n!!** ]
- Twice iterated factorials [ **(n!)!** ]

This function allows to obtain infinite numbers due to a function that performs multiplications using and returning Strings.

Recommended Max number per function:

- Factorial:								2700 (5 min long)
- Semi-factorial:					   6000 (5.5 min long)
- Twice iterated factorial:		 6 (2.5 min long)

Bigger numbers than recommended can take much longer, as each factorial increases exponentially, the time to calculate the next factorial increases exponentially as well.

### Time examples:

n! 2700 = 5 mim

n! 3000 = 7 min

n! 4000 = 16 min

n! 5000 = 28 min

n! 6000 = 45 min

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

