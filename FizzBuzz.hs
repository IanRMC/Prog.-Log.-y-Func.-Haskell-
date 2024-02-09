lessThan20 :: Int -> String
lessThan20 n |
    n > 0 && n < 20 =
    let answers = words ("One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen")
    in answers !! (n-1)

tens :: Int -> String
tens n | n >= 20 && n <= 90 && n `mod` 10 == 0 = answers !! ((n `div` 10) - 2)
       | otherwise = ""  -- Agregamos un caso base para los números que no están en el rango
    where
        answers = words("Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety")

number :: Int -> String
number n 
    | n  `mod` 3 == 0 && n `mod` 5 == 0 = "FizzBuzz!"
    | n  `mod` 5 == 0 = "Fizz!"
    | n  `mod` 3 == 0 = "Buzz!"
    | 1 <= n && n < 20 = lessThan20 n 
    | n < 100 = tens (n `div` 10 * 10) ++ " " ++ lessThan20 (n `mod` 10)
    | otherwise = "Number out of range!"

main :: IO ()
main = do
    putStrLn $ "Number 100: " ++ number 100
    putStrLn $ "Number 45: " ++ number 45
    putStrLn $ "Number 22: " ++ number 22
    putStrLn $ "Number 82: " ++ number 82
    putStrLn $ "Number 33: " ++ number 33
