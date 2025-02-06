data Fuel a = Fuel {getFuel :: Integer -> Integer -> Maybe (Integer, a)}

-- functor definit in cerinta
instance Functor Fuel where
  fmap f (Fuel m) =
    Fuel
      ( \i lim -> case m i lim of
          Nothing -> Nothing
          Just (i', a) -> Just (i', f a)
      )

-- applicative definit in cerinta
instance Applicative Fuel where
  pure x = Fuel (\i _ -> Just (i, x))
  (Fuel mf) <*> (Fuel af) =
    Fuel
      ( \i lim -> case mf i lim of
          Nothing -> Nothing
          Just (i', f) ->
            if i' >= lim
              then Nothing
              else case af (i' + 1) lim of
                Nothing -> Nothing
                Just (i'', a) ->
                  if i'' >= lim
                    then Nothing
                    else Just (i'' + 2, f a)
      )

-- monada
instance Monad Fuel where
  (Fuel m) >>= f = Fuel $ \i lim ->
    case m i lim of
      Nothing -> Nothing -- daca esueaza propagam rezultatul
      Just (i', a) ->
        let i'' = i' + 1 -- adaugam o unitate de resursa
         in if i'' >= lim -- verificam daca combustibilul trece de limita impusa
              then Nothing
              else
                let (Fuel m') = f a
                 in m' i'' lim