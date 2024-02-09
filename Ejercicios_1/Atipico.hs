import Data.List (sort)

media :: Floating a => [a] -> a
media xs = sum xs / fromIntegral (length xs)

desviacionEstandar :: Floating a => [a] -> a
desviacionEstandar xs =
  let m = media xs
      n = fromIntegral $ length xs
      deviations = map (\x -> (x - m) ^ 2) xs
  in sqrt (sum deviations / (n - 1))  

puntuacionTipica :: Floating a => a -> [a] -> a
puntuacionTipica x xs = (x - media xs) / desviacionEstandar xs

valoresAtipicos :: (Ord a, Floating a) => [a] -> [a]
valoresAtipicos xs =
  let mean = media xs
      stdDev = desviacionEstandar xs
      puntuaciones = map (\x -> puntuacionTipica x xs) xs
  in map fst . filter (\(_, score) -> score > 3 || score < -3) $ zip xs puntuaciones

main :: IO ()
main = do
  let muestra = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 100.0]
  putStrLn $ "Muestra original: " ++ show muestra
  putStrLn $ "Valores atípicos: " ++ show (valoresAtipicos muestra)