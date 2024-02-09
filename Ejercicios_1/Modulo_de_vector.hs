modulo :: [Float] -> Float
modulo vector = sqrt (sum (map (^2) vector))

main :: IO ()
main = do
  let vector = [1.0, 2.0, 3.0]
  let moduloVector = modulo vector
  print $ moduloVector
