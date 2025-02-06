-- definitions
data Expr
  = Const Int -- integer constant
  | Expr :+: Expr -- addition
  | Expr :*: Expr -- multiplication
  deriving (Eq)

data Operation = Add | Mult deriving (Eq, Show)

data Tree
  = Lf Int
  | Node Operation Tree Tree
  deriving (Eq, Show)

-- 1.
evalExp :: Expr -> Int
evalExp (Const x) = x
evalExp (a :+: b) = evalExp a + evalExp b
evalExp (a :*: b) = evalExp a * evalExp b

-- 2.
evalArb :: Tree -> Int
evalArb (Lf x) = x
evalArb (Node Add left right) = evalArb left + evalArb right
evalArb (Node Mult left right) = evalArb left * evalArb right

-- 3.
expToArb :: Expr -> Tree
expToArb (Const x) = Lf x
expToArb (a :+: b) = Node Add (expToArb a) (expToArb b)
expToArb (a :*: b) = Node Mult (expToArb a) (expToArb b)

-- definitions
data IntSearchTree value
  = Empty
  | BNode
      (IntSearchTree value) -- elemente cu cheia mai mica
      Int -- cheia elementului
      (Maybe value) -- valoarea elementului
      (IntSearchTree value) -- elemente cu cheia mai mare

-- 4.
-- to do
lookup' :: Int -> IntSearchTree value -> Maybe value
lookup' _ Empty = Nothing
lookup' x (BNode left key value right)
  | x == key = value
  | x < key = lookup' x left
  | x > key = lookup' x right

-- 5.
keys :: IntSearchTree value -> [Int]
keys Empty = []
keys (BNode left key value right) = keys left ++ [key] ++ keys right

-- 6.
values :: IntSearchTree value -> [value]
values Empty = []
values (BNode left key value right) = maybeToList value ++ values left ++ values right
  where
    maybeToList Nothing = []
    maybeToList (Just value) = [value]

-- 7.
insert :: Int -> value -> IntSearchTree value -> IntSearchTree value
insert ikey ivalue Empty = BNode Empty ikey (Just ivalue) Empty
insert ikey ivalue (BNode left key value right)
  | ikey == key = BNode left key (Just ivalue) right
  | ikey < key = BNode (insert ikey ivalue left) key value right
  | ikey > key = BNode left key value (insert ikey ivalue right)

-- 8.
delete :: Int -> IntSearchTree value -> IntSearchTree value
delete _ Empty = Empty
delete dkey (BNode left key value right)
  | dkey == key = BNode left key Nothing right
  | dkey < key = BNode (delete dkey left) key value right
  | dkey > key = BNode left key value (delete dkey right)

-- 9.
toList :: IntSearchTree value -> [(Int, value)]
toList Empty = []
toList (BNode left key Nothing right) = toList left ++ toList right
toList (BNode left key (Just value) right) = toList left ++ [(key, value)] ++ toList right

-- 10.
fromList :: [(Int, value)] -> IntSearchTree value
fromList [] = Empty
fromList ((key, value) : list) = insert key value (fromList list)

-- 11.
printTree :: IntSearchTree value -> String
printTree Empty = ""
printTree (BNode left key value right) = printTree left ++ show key ++ printTree right

-- 12.
-- to do