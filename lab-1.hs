-- first function
square :: Int -> Int
square x = x * x

-- second function
adder :: Int -> Int -> Int
adder x y = x + y

-- function list
functionlist :: [Int -> Int]
functionlist = [square, (+1)]

applytoAll :: Int -> [Int -> Int] -> [Int]
applytoAll x fs = [f x | f <- fs ]

-- Passing Functions as Arguments
-- ---------------------------------------
applyTwice :: (Int -> Int) -> Int -> Int
applyTwice f x = f (f x)

main :: IO()
main = do
    print(square 93)
    print(adder 29 4)
    print(applytoAll 3 functionlist)
    print(applyTwice square 5) --625