import Data.Char (digitToInt, isDigit)

-- 1. a.
verifL :: [Int] -> Bool
verifL a = even (length a)

-- 1. b.
takefinal :: (Ord a) => [a] -> Int -> [a]
takefinal a b | length a <= b = a
takefinal (a : at) b = takefinal at b

-- 1. c.
remove :: (Ord a) => [a] -> Int -> [a]
remove a b | b > length a = a
remove a b | b == 0 = a
remove a b = take (b - 1) a ++ drop b a

-- 2. a.
myreplicate :: (Ord a) => Int -> a -> [a]
myreplicate 0 b = []
myreplicate a b = b : myreplicate (a - 1) b

-- 2. b.
sumImp :: (Integral a) => [a] -> a
sumImp [] = 0
sumImp (a : at)
  | even a = sumImp at
  | otherwise = a + sumImp at

-- 2. c.
totalLen :: [String] -> Int
totalLen [] = 0
totalLen (a : at)
  | head a == 'A' = length a + totalLen at
  | otherwise = totalLen at

-- 3.
nrVocaleS :: String -> Int
nrVocaleS [] = 0
nrVocaleS (a : at)
  | a `elem` "aeiouAEIOU" = 1 + nrVocaleS at
  | otherwise = nrVocaleS at

nrVocale :: [String] -> Int
nrVocale [] = 0
nrVocale (a : at)
  | a == reverse a = nrVocaleS a + nrVocale at
  | otherwise = nrVocale at

-- 4.
adaugaNumarDupaPare :: (Integral a) => a -> [a] -> [a]
adaugaNumarDupaPare a [] = []
adaugaNumarDupaPare a (b : bt)
  | even b = b : a : adaugaNumarDupaPare a bt
  | otherwise = b : adaugaNumarDupaPare a bt

-- 5.
divizori :: (Integral a) => a -> [a]
divizori 0 = []
divizori a = [b | b <- [1 .. a], mod a b == 0]

-- 6.
listadiv :: (Integral a) => [a] -> [[a]]
listadiv [] = []
listadiv a = [divizori b | b <- a]

-- 7. a.
inIntervalRec :: (Integral a) => a -> a -> [a] -> [a]
inIntervalRec a b [] = []
inIntervalRec a b _ | a > b = []
inIntervalRec a b (c : ct)
  | c `elem` [a .. b] = c : inIntervalRec a b ct
  | otherwise = inIntervalRec a b ct

-- 7. b.
inIntervalComp :: (Integral a) => a -> a -> [a] -> [a]
inIntervalComp a b [] = []
inIntervalComp a b _ | a > b = []
inIntervalComp a b c = [d | d <- c, a <= d, d <= b]

-- 8. a.
pozitiveRec :: (Integral a) => [a] -> Int
pozitiveRec [] = 0
pozitiveRec (a : at)
  | a > 0 = 1 + pozitiveRec at
  | otherwise = pozitiveRec at

-- 8. b.
pozitiveComp :: (Integral a) => [a] -> Int
pozitiveComp [] = 0
pozitiveComp a = sum [if b > 0 then 1 else 0 | b <- a, b > 0]

-- 9. a.
pozitiiImpareRecPoz :: (Integral a) => [a] -> Int -> [Int]
pozitiiImpareRecPoz [] _ = []
pozitiiImpareRecPoz (a : at) b
  | odd a = b : pozitiiImpareRecPoz at (b + 1)
  | otherwise = pozitiiImpareRecPoz at (b + 1)

pozitiiImpareRec :: (Integral a) => [a] -> [Int]
pozitiiImpareRec [] = []
pozitiiImpareRec a = pozitiiImpareRecPoz a 0

-- 9. b.
pozitiiImpareComp :: (Integral a) => [a] -> [Int]
pozitiiImpareComp [] = []
pozitiiImpareComp a = [c | (b, c) <- zip a [0 ..], odd b]

-- 10. a.
multDigitsRec :: String -> Int
multDigitsRec [] = 1
multDigitsRec (a : at)
  | isDigit a = digitToInt a * multDigitsRec at
  | otherwise = multDigitsRec at

-- 10. b.
multDigitsComp :: String -> Int
multDigitsComp a = product [digitToInt b | b <- a, isDigit b]

-- Extra definitions
submult :: (Ord a) => [a] -> [[a]]
submult [] = [[]]
submult (a : at) = submult at ++ [a : b | b <- submult at]

isIncreasing :: (Integral a) => [a] -> Bool
isIncreasing [a] = True
isIncreasing (a : b : at) = (a < b) && isIncreasing (b : at)

-- 11.

-- 12.
combinari :: (Integral a) => [a] -> Int -> [[a]]
combinari a b = [c | c <- submult a, length c == b, isIncreasing c]

-- 13.
aranjamente :: (Integral a) => [a] -> Int -> [[a]]
aranjamente a b = [c | c <- submult a, length c == b]

-- 14.
