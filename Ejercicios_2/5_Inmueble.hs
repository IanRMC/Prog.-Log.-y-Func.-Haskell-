type Inmueble = (Int, Int, Int, Bool, Char)  -- (Año, Metros, Habitaciones, Garaje, Zona)

-- Calcula el precio de un inmueble según la fórmula proporcionada
calcularPrecio :: Inmueble -> Float
calcularPrecio (año, metros, habitaciones, garaje, zona)
    | zona == 'A' = precioBase * (1 - fromIntegral (2024 - año) / 100)
    | zona == 'B' = precioBase * (1 - fromIntegral (2024 - año) / 100) * 1.5
    where precioBase = fromIntegral (metros * 1000 + habitaciones * 5000 + if garaje then 15000 else 0)

-- Busca inmuebles según el presupuesto dado
buscarInmuebles :: [Inmueble] -> Float -> [(Inmueble, Float)]
buscarInmuebles inmuebles presupuesto = filter (\(_, precio) -> precio <= presupuesto) inmueblesConPrecio
    where inmueblesConPrecio = map (\inmueble -> (inmueble, calcularPrecio inmueble)) inmuebles

-- Lista de inmuebles
inmuebles :: [Inmueble]
inmuebles = [(2000, 100, 3, True, 'A'), (2012, 60, 2, True, 'B'), (1980, 120, 4, False, 'A'),
             (2005, 75, 3, True, 'B'), (2015, 90, 2, False, 'A')]

-- Presupuesto
presupuesto :: Float
presupuesto = 150000

-- Ejecutar la búsqueda de inmuebles
main :: IO ()
main = do
    let inmueblesEncontrados = buscarInmuebles inmuebles presupuesto
    putStrLn "Inmuebles encontrados:"
    mapM_ (\((año, metros, habitaciones, garaje, zona), precio) -> putStrLn $ "Año: " ++ show año ++ ", Metros: " ++ show metros ++ ", Habitaciones: " ++ show habitaciones ++ ", Garaje: " ++ show garaje ++ ", Zona: " ++ [zona] ++ ", Precio: " ++ show precio) inmueblesEncontrados
