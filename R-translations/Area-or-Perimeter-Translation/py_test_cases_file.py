# sample
Test.assert_equals(area_or_perimeter(4, 4), 16)
Test.assert_equals(area_or_perimeter(6, 10), 32)

# extended
import random
def do():
    def solution(l, w):
        return l * l if l == w else (l + w) * 2
    
    Test.it("Fixed tests")
    Test.assert_equals(area_or_perimeter(4, 4), 16)
    Test.assert_equals(area_or_perimeter(6, 10), 32)
    
    Test.it("Not so fixed tests")
    for i in range(100):
        a, b = (i * 1200) + 2, (i * 2100) + 2
        Test.assert_equals(area_or_perimeter(a, b), solution(a, b))
    for i in range(100):
        a, b = (i * 100) + 20, (i * 100) + 20
        Test.assert_equals(area_or_perimeter(a, b), solution(a, b))
    
    Test.it('Random tests')
    for i in range(100):
        a, b = random.randint(100, 1200), random.randint(100, 1500)
        Test.assert_equals(area_or_perimeter(a, b), solution(a, b))
do()