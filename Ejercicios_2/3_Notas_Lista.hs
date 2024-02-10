calificacionesACalificativos :: [Int] -> [(Int, String)]
calificacionesACalificativos calificaciones = zip calificaciones (map asignarCalificativo calificaciones)
    where
        asignarCalificativo calificacion
            | calificacion >= 95 && calificacion <= 100 = "Excelente"
            | calificacion >= 85 && calificacion <= 94  = "Notable"
            | calificacion >= 75 && calificacion <= 84  = "Bueno"
            | calificacion >= 70 && calificacion <= 74  = "Suficiente"
            | otherwise                                 = "Desempeño insuficiente"

main :: IO ()
main = do
    let calificaciones = [92, 78, 85, 65, 100]
        calificacionesConCalificativos = calificacionesACalificativos calificaciones
    putStrLn "Calificaciones y calificativos correspondientes:"
    mapM_ (\(calificacion, calificativo) -> putStrLn $ show calificacion ++ " - " ++ calificativo) calificacionesConCalificativos
