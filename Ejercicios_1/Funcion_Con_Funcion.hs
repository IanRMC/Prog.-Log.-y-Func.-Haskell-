aplicar :: (a -> b) -> [a] -> [b]
aplicar funcion lista = map funcion lista

main :: IO ()
main = do
  let listaNumeros = [1, 2, 3, 4, 5]
  let duplicar = (* 2)
  let listaDuplicada = aplicar duplicar listaNumeros
  print $ listaDuplicada

