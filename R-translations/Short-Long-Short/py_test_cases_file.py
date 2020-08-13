# example test cases
BASIC_TESTS = (
    (('45', '1'), '1451'),
    (('13', '200'), '1320013'),
    (('Soon', 'Me'), 'MeSoonMe'),
    (('U', 'False'), 'UFalseU')
)

test.describe('Basic Tests')
for pair, result in BASIC_TESTS:
    test.it("'{}', '{}'".format(*pair))
    test.assert_equals(solution(*pair), result)


# test cases
from random import choice, randint
from string import ascii_letters, digits

BASIC_TESTS = (
    (('45', '1'), '1451'),
    (('13', '200'), '1320013'),
    (('Soon', 'Me'), 'MeSoonMe'),
    (('U', 'False'), 'UFalseU')
)
VALID_CHARS = tuple(ascii_letters + digits)


def random_chars():
    return ''.join(choice(VALID_CHARS) for _ in range(randint(2, 10)))


def my_solution(a, b):
    return '{0}{1}{0}'.format(*sorted((a, b), key=len))


test.describe('Basic Tests')
for pair, result in BASIC_TESTS:
    test.it("'{}', '{}'".format(*pair))
    test.assert_equals(solution(*pair), result)


test.describe('Random Tests')
for _ in range(100):
    random_pair = random_chars(), random_chars()
    while len(random_pair[0]) == len(random_pair[1]):
        random_pair = random_chars(), random_chars()
    test.it("'{}', '{}'".format(*random_pair))
    test.assert_equals(solution(*random_pair), my_solution(*random_pair))