-- 1.
listOne = [x ^ 2 | x <- [1 .. 10], x `rem` 3 == 2]

listTwo = [(x, y) | x <- [1 .. 5], y <- [x .. (x + 2)]]

listThree = [(x, y) | x <- [1 .. 3], let k = x ^ 2, y <- [1 .. k]]

listFour = [x | x <- "Facultatea de Matematica si Informatica", elem x ['A' .. 'Z']]

listFive = [[x .. y] | x <- [1 .. 5], y <- [1 .. 5], x < y]

-- 2.
factori :: Int -> [Int]
factori x = [y | y <- [1 .. x], x `rem` y == 0]

-- 3.
prim :: Int -> Bool
prim x = length (factori x) == 2

-- 4.
numerePrime :: Int -> [Int]
numerePrime x = [y | y <- [2 .. x], prim y]

-- 5.
flatten :: [((Int, Int), Int)] -> [(Int, Int, Int)]
flatten a = [(x, y, z) | ((x, y), z) <- a]

myzip3 :: [Int] -> [Int] -> [Int] -> [(Int, Int, Int)]
myzip3 x y z = flatten (zip (zip x y) z)

-- 6.
firstEl :: [(a, b)] -> [a]
firstEl = map (\(a, b) -> a)

-- 7.
sumList :: [[Int]] -> [Int]
sumList = map (\a -> sum a)

-- 8.
prel2 :: [Int] -> [Int]
prel2 =
  map
    ( \a ->
        if odd a
          then a * 2
          else a `div` 2
    )

-- 9.
hasCharacter :: Char -> [String] -> [Bool]
hasCharacter x = map (\a -> x `elem` a)

-- 10.
oddSquares :: [Int] -> [Int]
oddSquares x = map (^ 2) (filter odd x)

-- 11.
oddPositionSquares :: [Int] -> [Int]
oddPositionSquares x = map (\(a, b) -> a^2) (filter (\(a, b) -> odd b) (zip x [1 ..]))

-- 12.
numaiVocale :: [String] -> [String]
numaiVocale = map(\a -> filter(\b -> b `elem` "aeiouAEIOUR") a)

-- 13.
mymap :: (a -> b) -> [a] -> [b]
mymap _ [] = []
mymap f (xs: x) = f xs : mymap f x

myfilter :: (a -> Bool) -> [a] -> [a]
myfilter _ [] = []
myfilter f (xs : x)
    | f xs = xs : myfilter f x 
    | otherwise = myfilter f x

-- extra
-- to do