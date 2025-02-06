data RGB v = RGB v v v deriving (Show)

newtype Image p = Img [[p]] deriving (Show)

class Composite c where
  blend :: (v -> v -> v) -> c (RGB v) -> c (RGB v) -> c (RGB v)

-- functie pentru a determina dimensiunea unei imagini (calculata ca numarul de pixeli)
getSize :: Image p -> Int
getSize (Img img) = sum (map length img)

-- functie pentru a verifica daca doua imagini au aceeasi dimensiune (linii si coloane egale)
sameSize :: Image p -> Image q -> Bool
sameSize (Img img1) (Img img2) =
  let rowsEqual = length img1 == length img2
      colsEqual = all (\(row1, row2) -> length row1 == length row2) (zip img1 img2)
   in rowsEqual && colsEqual

-- instantierea clasei
instance Composite Image where
  blend :: (v -> v -> v) -> Image (RGB v) -> Image (RGB v) -> Image (RGB v)
  blend f (Img img1) (Img img2)
    | sameSize (Img img1) (Img img2) = Img (zipWith (zipWith blendRGB) img1 img2)
    | getSize (Img img1) >= getSize (Img img2) = Img img1
    | otherwise = Img img2
    where
      blendRGB (RGB r1 g1 b1) (RGB r2 g2 b2) = RGB (f r1 r2) (f g1 g2) (f b1 b2)

-- date de test
img1 = Img [[RGB 255 0 0, RGB 0 255 0, RGB 0 0 255]]

img2 = Img [[RGB 0 255 0, RGB 255 0 0, RGB 0 0 255]]