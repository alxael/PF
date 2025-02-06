-- solutie fara monade
filterConcat :: [[Int]] -> Int -> Int -> [Int]
filterConcat lists n m = concat [xs | xs <- lists, odd (length xs), all (\x -> x < n || x > m) xs]

-- solutie cu monade
filterConcatMonade :: [[Int]] -> Int -> Int -> [Int]
filterConcatMonade lists n m =
  concat
    ( do
        xs <- lists
        if odd (length xs) && all (\x -> x < n || x > m) xs
          then return xs
          else []
    )