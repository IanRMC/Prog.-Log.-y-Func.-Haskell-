esPar :: Int -> Bool
esPar x = x `mod` 2 == 0

filtrarConFuncion :: (a -> Bool) -> [a] -> [a]
filtrarConFuncion _ [] = [] 
filtrarConFuncion f (x:xs)
    | f x       = x : filtrarConFuncion f xs
    | otherwise = filtrarConFuncion f xs 

main :: IO ()
main = do
    let listaOriginal = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        listaFiltrada = filtrarConFuncion esPar listaOriginal
    putStrLn "Lista original:"
    print listaOriginal
    putStrLn "Lista filtrada (solo números pares):"
    print listaFiltrada
