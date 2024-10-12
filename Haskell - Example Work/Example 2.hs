e1 :: [Bool]
e1 = [True,False,True]

e2 :: [[Int]]
e2 = [[1,2],[3,4]]

e3 :: (Char,Bool)
e3 = ('x', True)

e4 :: [(String,Int)]
e4 = [("Hello", 1)]

e5 :: Num a => a -> a
e5 n = n*2

e6 :: Num a => a -> a -> a
e6 x y = x+y

e7 :: (b, a) -> (a, b)
e7 (x,y) = (y,x)

e8 :: b -> (b, b)
e8 x = (x, x)

-----------------------------

copy :: p -> p
copy x = x

one :: a -> [a]
one x = [x]

first :: (a, b) -> a
first (x,y) = x

second :: p1 -> p2 -> p2
second x y = y

mult :: Num a => a -> a -> a
mult m n = m*n