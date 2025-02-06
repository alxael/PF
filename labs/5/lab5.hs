-- 1.
oddSquaresSum :: [Int] -> Int
oddSquaresSum x = foldr (+) 0 (map (^ 2) (filter odd x))

-- 2.
allTrue :: [Bool] -> Bool
allTrue = foldr (&&) True

-- 3.
allVerifies :: (Int -> Bool) -> [Int] -> Bool
allVerifies f x = foldr (&&) True (map f x)

-- 4.
anyVerifies :: (Int -> Bool) -> [Int] -> Bool
anyVerifies f x = foldr (||) False (map f x)

-- 5.
-- to do

-- 6.
listToInt :: [Int] -> Int
listToInt x = foldl (\a b -> a * 10 + b) 0 x

-- 7.a
rmChar :: Char -> String -> String
rmChar x = filter (\a -> a /= x)

-- 7.b
rmCharsRec :: String -> String -> String
rmCharsRec [] y = y
rmCharsRec (xs : x) y = rmCharsRec x (rmChar xs y)

-- 7.c
rmCharsFold :: String -> String -> String
rmCharsFold x y = foldr (\a b -> rmChar a b) y x

-- 8.
myReverse :: [a] -> [a]
myReverse x = foldr (\a b -> b ++ [a]) [] x

-- 9.

-- 10.
myUnzip :: [(a, b)] -> ([a], [b])
myUnzip x = foldr (\a b -> (fst a : fst b, snd a : snd b)) ([], []) x

-- 11.
union :: [Int] -> [Int] -> [Int]
union = foldr (\a b -> if a `elem` b then b else a : b)

-- 12.
intersect :: [Int] -> [Int] -> [Int]
intersect x y = filter (\a -> a `elem` y) x

-- 13.
-- to do

-- 14.
-- to do