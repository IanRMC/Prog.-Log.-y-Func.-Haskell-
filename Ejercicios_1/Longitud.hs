palabrasLongitud :: String -> [(String, Int)]
palabrasLongitud frase =
  let palabras = words frase
  in map (\palabra -> (palabra, length palabra)) palabras

main :: IO ()
main = do
  let frase = "Pepe pica papas con un pico, con un pico Pepe pica papas; parangaricutirimicuaro"
  let diccionario = palabrasLongitud frase
  print $ diccionario
