import Data.Char (toUpper)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

calificacion :: Int -> String
calificacion nota
    | nota >= 95 = "Excelente"
    | nota >= 85 = "Notable"
    | nota >= 75 = "Bueno"
    | nota >= 70 = "Suficiente"
    | otherwise = "Desempeño insuficiente"

convertirCalificaciones :: Map String Int -> Map String String
convertirCalificaciones = Map.mapKeys (map toUpper) . Map.map calificacion

main :: IO ()
main = do
    let notas = Map.fromList [("Programacion web", 85), ("Redes", 75), ("Fisica", 100), ("Calculo Integral", 50 )]
    let calificaciones = convertirCalificaciones notas
    putStrLn "Calificaciones:"
    mapM_ (\(asignatura, calif) -> putStrLn $ asignatura ++ ":  " ++ calif) (Map.toList calificaciones)