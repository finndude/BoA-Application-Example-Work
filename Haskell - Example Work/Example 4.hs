import Data.Char(intToDigit, digitToInt, isDigit) -- Import Needed Functions

-------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------     Compression     ------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

chomp :: String -> String -- Type Declaration
chomp [] = []  -- Base Case (Empty)
chomp (x:xs) = takeWhile (== x) (x:xs) -- Alternate Case (Not Empty)

-------------------------------------------------------------------------------------------------------------------------------------

munch :: String -> String -- Type Declaration
munch [] = []  -- Base case (Empty)
munch (x:xs) = take 9 (chomp (x:xs)) -- Alternate Case (Not Empty)

-------------------------------------------------------------------------------------------------------------------------------------

runs :: String -> [String] -- Type Declaration
runs [] = []  -- Base case (Empty)
runs xs = run : runs (drop (length run) xs) -- Alternate Case (Not Empty)
    where run = munch xs

-------------------------------------------------------------------------------------------------------------------------------------

encode :: String -> [(Char, Int)] -- Type Declaration
encode xs = map (\run -> (head run, length run)) (runs xs) -- Encode the characters in the input string along with its count

-------------------------------------------------------------------------------------------------------------------------------------

flatten :: [(Char, Int)] -> String -- Type Declaration
flatten [] = [] -- Base Case (Empty)
flatten ((c, n):rest) = c : show n ++ flatten rest -- Convert count and append, then recursively flatten the rest of the list


-------------------------------------------------------------------------------------------------------------------------------------

compress :: String -> String -- Type Declaration
compress = flatten . encode -- Compress input by encoding it and then flattening the result

-------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------     Decompression     -----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

decode :: [(Char, Int)] -> String -- Type Declaration
decode [] = [] -- Base Case (Empty)
decode ((c, n):rest) = replicate n c ++ decode rest -- Repeat character 'c' 'n' times and concatenate it with other result

-------------------------------------------------------------------------------------------------------------------------------------

expand :: String -> [(Char, Int)] -- Type Declaration
expand [] = [] -- Base Case (Empty)
expand (c:d:xs) -- Pattern match for a string with at least two characters
    | isDigit d = (c, digitToInt d) : expand xs -- If the second character is a digit
    | otherwise = (c, 1) : expand (d:xs) -- If the second character is not a digit
expand [c] = [(c, 1)]  -- Handle the case when there's only one character left

-------------------------------------------------------------------------------------------------------------------------------------

decompress :: String -> String -- Type Declaration
decompress = expand . decode -- Decompress by decoding and then expanding
  where
    decode [] = [] -- Base Case (Empty)
    decode (c:d:xs) -- Recursive Cases
        | isDigit d = (c, digitToInt d) : decode xs -- If second character is a digit, add to decoded list and continue
        | otherwise = (c, 1) : decode (d:xs) -- If the second character is not a digit, assume count of 1 and continue decoding
    decode [c] = [(c, 1)] -- When there's only one character left in the string

    expand [] = [] -- Base Case (Empty)
    expand ((c, n):rest) = replicate n c ++ expand rest -- Repeat character 'c' 'n' times and concatenate with the result

-------------------------------------------------------------------------------------------------------------------------------------