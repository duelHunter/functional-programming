factorial :: Integer -> Integer
factorial n
    | n < 0     = error "factorial: negative number"
    | n == 0    = 1
    | otherwise = n * factorial (n - 1)

main :: IO ()
main = do
    print (factorial (-5))
