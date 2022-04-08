# https://math.stackexchange.com/a/3503338/22256

def circle_from_3_points(z1:complex, z2:complex, z3:complex) -> tuple[complex, float]:
    if (z1 == z2) or (z2 == z3) or (z3 == z1):
        raise ValueError(f'Duplicate points: {z1}, {z2}, {z3}')
        
    w = (z3 - z1)/(z2 - z1)
    
    # You should probably use `math.isclose(w.imag, 0)` for floating point comparisons
    if w.imag == 0:
        raise ValueError(f'Points are collinear: {z1}, {z2}, {z3}')
        
    c = (z2 - z1)*(w - abs(w)**2)/(2j*w.imag) + z1;  # Simplified denominator
    r = abs(z1 - c);
    
    return c, r

"""
>> print(circle_from_3_points(1+1j, 2+4j, 5+3j)) # Can also generate 1+1j with `complex(1,1)`
      ((3+2j), 2.2360679775)

>> print(circle_from_3_points(1+1j, 1+1j, 3+3j))
      ValueError: Duplicate points: (1+1j), (1+1j), (3+3j)

>> print(circle_from_3_points(1+1j, 2+2j, 3+3j))
      ValueError: Points are collinear: (1+1j), (2+2j), (3+3j)
"""
