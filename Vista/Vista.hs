module Main where

import WxHaskell.Frame
import WxHaskell.Button
import WxHaskell.Sizer

main = do
  frame <- frame "Ejemplo WxHaskell" (Size 300 200)
  button <- button frame "Clic aquí"
  sizer <- sizer (Horizontal True)
  add sizer button
  setSizer frame sizer
  show frame
  mainLoop

onCommand :: Button -> IO ()
onCommand button = do
  putStrLn "Botón pulsado!"
  return ()
