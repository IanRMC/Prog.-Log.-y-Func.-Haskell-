import Text.Printf

calcularSeno :: Double -> Double
calcularSeno x = sin x

calcularCoseno :: Double -> Double
calcularCoseno x = cos x

calcularTangente :: Double -> Double
calcularTangente x = tan x

calcularExponencial :: Double -> Double
calcularExponencial x = x*x 

calcularLogaritmo :: Double -> Double
calcularLogaritmo x = log x

mostrarTabla :: (Double -> Double) -> Double -> IO ()
mostrarTabla funcion valor = do
    putStrLn "Entero\tResultado"
    putStrLn "------\t----------"
    mapM_ (\x -> printf "%.6f\t%.6f\n" x (funcion x)) [1..valor]

main :: IO ()
main = do
    putStrLn "Seleccione una función:"
    putStrLn "1. Seno"
    putStrLn "2. Coseno"
    putStrLn "3. Tangente"
    putStrLn "4. Exponencial"
    putStrLn "5. Logaritmo neperiano"
    opcionStr <- getLine
    let opcion = read opcionStr :: Int
    putStrLn "Introduzca el valor:"
    valorStr <- getLine
    let valor = read valorStr :: Double
    case opcion of
        1 -> mostrarTabla calcularSeno valor
        2 -> mostrarTabla calcularCoseno valor
        3 -> mostrarTabla calcularTangente valor
        4 -> mostrarTabla calcularExponencial valor
        5 -> mostrarTabla calcularLogaritmo valor
        _ -> putStrLn "Opción inválida"
