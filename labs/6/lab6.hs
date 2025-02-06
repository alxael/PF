-- 1.
data Fruct = Mar String Bool | Portocala String Int

ionatanFaraVierme = Mar "Ionatan" False

goldenCuVierme = Mar "Golden Delicious" True

portocalaSicilia10 = Portocala "Sanguinello" 10

cosFructe = [Mar "Ionatan" False, Portocala "Sanguinello" 10, Portocala "Valencia" 22, Mar "Golden Delicious" True, Portocala "Sanguinello" 15, Portocala "Moro" 12, Portocala "Tarocco" 3, Portocala "Moro" 12, Portocala "Valencia" 2, Mar "Golden Delicious" False, Mar "Golden" False, Mar "Golden" True]

isPortocala :: Fruct -> Bool
isPortocala (Portocala _ _) = True
isPortocala (Mar _ _) = False

-- 1.a
ePortocalaDeSicilia :: Fruct -> Bool
ePortocalaDeSicilia (Portocala a _) = (a == "Tarocco") || (a == "Moro") || (a == "Sanguinello")
ePortocalaDeSicilia (Mar _ _) = False

-- 1.b
nrFeliiSicilia :: [Fruct] -> Int
nrFeliiSicilia x = sum (map (\(Portocala _ nrFelii) -> nrFelii) (filter isPortocala x))

-- 1.c
nrMereViermi :: [Fruct] -> Int
nrMereViermi x = length (filter (\(Mar _ areViermi) -> areViermi) (filter (not . isPortocala) x))

-- 2.
type NumeA = String

type Rasa = String

data Animal = Pisica NumeA | Caine NumeA Rasa deriving (Show)

-- 2.a
vorbeste :: Animal -> String
vorbeste (Pisica _) = "Meow!"
vorbeste (Caine _ _) = "Woof!"

-- 2.b
rasa :: Animal -> Maybe String
rasa (Pisica _) = Nothing
rasa (Caine _ rasa) = Just rasa

-- 3.
data Linie = L [Int] deriving (Show)

data Matrice = M [Linie] deriving (Show)

-- 3.a
verifica :: Matrice -> Int -> Bool
verifica (M x) y = foldr (&&) True (map (\(L z) -> sum z == y) x)

-- 3.b
doarPozN :: Matrice -> Int -> Bool
doarPozN (M x) y = foldr (&&) True (map (\(L z) -> foldr (&&) True (map (>= 0) z)) (filter (\(L z) -> length z == y) x))

-- 3.c
corect :: Matrice -> Bool
corect (M x) = minimum (map (\(L z) -> length z) x) == maximum (map (\(L z) -> length z) x)

-- 4.