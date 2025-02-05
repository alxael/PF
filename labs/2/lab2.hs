-- 6 a.
sumaPatrate :: (Num a) => a -> a -> a
sumaPatrate x y = x * x + y * y

-- 6 b.
ePar :: Integer -> String
ePar x = if even x then "par" else "impar"

-- 6 c.
factorial :: Integer -> Integer
factorial x = if x == 0 then 1 else x * factorial (x - 1)

factorial1 :: Integer -> Integer
factorial1 x = product [1 .. x]

-- 6 d.
primulVsAlDoilea :: (Integral a) => a -> a -> Bool
primulVsAlDoilea x y = x > 2 * y

-- 6 e.
maxList :: (Integral a) => [a] -> a
maxList [a] = a
maxList (first : second : tail) = maxList (max first second : tail)

maxList1 :: (Integral a) => [a] -> a
maxList1 [a] = a
maxList1 (first : second : tail) | first >= second = maxList1 (first : tail)
maxList1 (first : second : tail) = maxList1 (second : tail)

-- 7.
poly :: Double -> Double -> Double -> Double -> Double
poly a b c x = a * x * x + b * x + c

-- 8.
eeny :: (Integral a) => a -> String
eeny a = if even a then "eeny" else "meeny"

-- 9.
fizzbuzz :: (Integral a) => a -> String
fizzbuzz a = (if mod a 3 == 0 then "fizz" else []) ++ (if mod a 5 == 0 then "buzz" else [])

fizzbuzz1 :: (Integral a) => a -> String
fizzbuzz1 a | mod a 3 == 0 && mod a 5 /= 0 = "fizz"
fizzbuzz1 a | mod a 3 /= 0 && mod a 5 == 0 = "buzz"
fizzbuzz1 a | mod a 3 == 0 && mod a 5 == 0 = "fizzbuzz"
fizzbuzz1 a = []

-- 10.
tribonacci :: Integer -> Integer
tribonacci 1 = 1
tribonacci 2 = 1
tribonacci 3 = 2
tribonacci a = tribonacci(a-1) + tribonacci(a-2) + tribonacci(a-3)

-- 11.
binomial :: Integer -> Integer -> Integer
bionmial n k | n < k = 0
binomial n 0 = 1
binomial 0 k = 0
binomial n k = binomial (n-1) k + binomial (n-1) (k-1)
