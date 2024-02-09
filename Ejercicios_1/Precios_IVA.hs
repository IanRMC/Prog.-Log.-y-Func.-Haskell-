descuento :: Double -> Double -> Double
descuento precio porcentaje = precio - (precio * porcentaje / 100)

iva :: Double -> Double -> Double
iva precio porcentaje = precio + (precio * porcentaje / 100)

precioFinal :: [( Double, Double)] -> (Double -> Double) -> Double
precioFinal cesta funcionPrecio = sum $ map (\( precio, cantidad) -> cantidad * funcionPrecio precio) cesta

main :: IO ()
main = do
  let cesta = [(2.5, 1), ( 1.2, 2), ( 0.8, 3)]
  let variabledescuento = descuento 20
  let variableiva = iva 16
  let precioFinalConDescuento = precioFinal cesta variabledescuento
  let precioFinalConIva = precioFinal cesta variableiva
  print $ "Precio final con descuento del 20% : " ++ show precioFinalConDescuento
  print $ "Precio final con IVA del 16% : " ++ show precioFinalConIva
