# sample

Test.describe('Example Tests')

Test.assert_equals(solution(2.34), 2.34)
Test.assert_equals(solution(5.678), 5.68)

# test cases
from random import random, randrange

Test.describe('Basic Tests')
for n in (2.3445345, 1.1356, 11.4234, 2.34545, 445.234234):
    Test.assert_equals(solution(n), round(n, 2))

Test.describe('Random Tests')
for _ in range(50):
    n = round(randrange(1, 501) * random(), randrange(0, 10))
    Test.assert_equals(solution(n), round(n, 2))