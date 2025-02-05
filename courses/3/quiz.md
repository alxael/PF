# Quiz 1

1. Fie f x = x + x si g x = x * x. Ce valoare are expresia "g . f $ 3"?
- 36
- 18
- eroare
- 6

1. [Solved] Raspunsul va fi 36 ($ compunerea functiilor este aplicata lui 3) f = 2x, g = x*x => g . f = 4x^2 => 36

2. Ce obtinem dupa instructiunea ([1,2,3] ++) [4,5,6]?
- eroare
- [1,2,3,4,5,6]
- [4,5,6,1,2,3]
- "123456"

2. [Solved] Raspunsul va fi [1,2,3,4,5,6] deoarece ++ concateneaza cele doua siruri, parantezele fiind ignorate.

3. Ce obtinem dupa instructiunea reverse . take 3 [1..10]?
- [10,9,8]
- [1,2,3]
- eroare
- [3,2,1]

3. [Solved] Raspunsul va fi eroare deoarece lipsesc parantezele din expresie: (reverse . take 3) [1..10] sau (reverse . take 3) $ [1..10] sau reverse (take 3 [1..10])

# Quiz 2
1. Fie functia foo1 :: (Int,Char,String) -> String. Ce tip are functia curry foo1?
- nu se poate aplica functia curry peste foo1
- Int -> Char -> String -> String
- Int -> (Char -> String) -> String
- (Int -> Char -> String) -> String

1. [Solved] Nu se poate aplica functia curry pentru ca curry are structura ((a, b) -> c) -> a -> b -> c.

2. Fie functia foo2 :: (Int, (Char,String)) -> String. Ce tip are functia curry foo2?
- nu se poate aplica functia curry peste foo2
- Int -> (Char,String) -> String
- Int -> Char -> String -> String
- (Int,Char) -> String -> String

2. [Solved] Raspunsul va fi Int -> (Char, String) -> String aplicand definitia la curry.

3. Fie functia foo3 :: Int -> Char -> String. Ce tip are functia uncurry foo3?

- nu se poate aplica functia uncurry peste foo3
- Int -> (Char -> String)
- functia uncurry nu are niciun efect asupra lui foo3
- (Int,Char) -> String

3. [Solved] Raspunsul va fi (Int,Char) -> String aplicand definitia la uncurry. 