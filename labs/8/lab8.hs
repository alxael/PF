-- definitions

class Collection c where
  empty :: c key value
  singleton :: key -> value -> c key value
  insert :: (Ord key) => key -> value -> c key value -> c key value
  lookup :: (Ord key) => key -> c key value -> Maybe value
  delete :: (Ord key) => key -> c key value -> c key value
  keys :: c key value -> [key]
  values :: c key value -> [value]
  toList :: c key value -> [(key, value)]
  fromList :: (Ord key) => [(key, value)] -> c key value

  -- 1.
  keys c = [fst p | p <- toList c]
  values c = [snd p | p <- toList c]
  fromList [] = empty
  fromList ((k, v) : list) = insert k v (fromList list)

-- 2.
newtype PairList k v = PairList {getPairList :: [(k, v)]}

instance Collection PairList where
  empty = PairList []
  singleton key value = PairList [(key, value)]
  insert key value (PairList list) = PairList ((key, value) : list)
  lookup k = Prelude.lookup k . getPairList -- use default lookup from Prelude
  delete k (PairList l) = PairList $ filter ((/= k) . fst) l
  toList = getPairList

-- definitions
data SearchTree key value
  = Empty
  | BNode
      (SearchTree key value) -- elemente cu cheia mai mica
      key -- cheia elementului
      (Maybe value) -- valoarea elementului
      (SearchTree key value) -- elemente cu cheia mai mare

-- 3.
instance Collection SearchTree where
  empty :: SearchTree k v
  empty = Empty
  singleton :: key -> value -> SearchTree key value
  singleton k v = BNode Empty k (Just v) Empty
  insert :: (Ord key) => key -> value -> SearchTree key value -> SearchTree key value
  insert k v Empty = (BNode Empty k (Just v) Empty)
  insert k v (BNode left key value right)
    | key == k = (BNode left key (Just v) right)
    | key < k = (BNode (insert k v left) key value right)
    | key > k = (BNode left key value (insert k v right))
  lookup :: (Ord key) => key -> SearchTree key value -> Maybe value
  lookup _ Empty = Nothing
  lookup key (BNode left k v right)
    | key == k = v
    | key < k = Main.lookup key left
    | key > k = Main.lookup key right
  delete :: (Ord key) => key -> SearchTree key value -> SearchTree key value
  delete _ Empty = Empty
  delete k (BNode left cheie val right)
    | k == cheie = BNode left cheie Nothing right
    | k < cheie = BNode (delete k left) cheie val right
    | k > cheie = BNode left cheie val (delete k right)
  toList :: SearchTree key value -> [(key, value)]
  toList (BNode left key Nothing right) = toList (left) ++ toList (right)
  toList (BNode left key (Just val) right) = toList (left) ++ [(key, val)] ++ toList (right)

data Punct = Pt [Int]

data Arb = Vid | F Int | N Arb Arb
  deriving (Show)

class ToFromArb a where
  toArb :: a -> Arb
  fromArb :: Arb -> a

-- 4.
instance Show Punct where
  show (Pt []) = "()"
  show (Pt [x]) = "(" ++ show x ++ ")"
  show (Pt (x : xs)) = "(" ++ show x ++ concatMap ((", " ++) . show) xs ++ ")"

-- 5.
instance ToFromArb Punct where
  toArb :: Punct -> Arb
  toArb (Pt []) = Vid
  toArb (Pt [x]) = F x
  toArb (Pt (x : xs)) = N (F x) (toArb (Pt xs))

  fromArb (Vid) = Pt []
  fromArb (F x) = Pt [x]
  fromArb (N l r) = Pt (p1 ++ p2)
    where
      Pt p1 = fromArb l
      Pt p2 = fromArb r

data Geo a = Square a | Rectangle a a | Circle a
  deriving (Show)

class GeoOps g where
  perimeter :: (Floating a) => g a -> a
  area :: (Floating a) => g a -> a

-- 6.
instance GeoOps Geo where
  perimeter (Square l) = 4 * l
  perimeter (Rectangle l1 l2) = 2 * l1 + 2 * l2
  perimeter (Circle r) = 2 * pi * r

  area (Square l) = l ^ 2
  area (Rectangle l1 l2) = l1 * l2
  area (Circle r) = pi * r ^ 2

-- 7.
instance (Floating a, Eq a) => Eq (Geo a) where
  fig1 == fig2 = perimeter fig1 == perimeter fig2
