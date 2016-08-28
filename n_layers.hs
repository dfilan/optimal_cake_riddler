-- functions that determine the optimal heights and proportion of cone volume
-- for n layers

-- load in GHCi. to find the list of heights of the optimal 7-layer cake from
-- bottom to top, run heightList 7. to find the proportion of volume of the cone
-- taken up by the optimal 7-layer cake, run volFrac 7

-- the recurrence function relating c_k to c_{k+1}
recur :: (Fractional a) => a -> a
recur c = (1 - (1-c)^2)/(3-(1-c)^2)

-- an infinite list comprising the sequence of c_k's
recurSequence :: (Fractional a) => [a]
recurSequence = iterate recur (1.0/3.0)

-- takes N and returns a finite list whose ith element is c_{N-i}
recurList :: (Fractional a) => Int -> [a]
recurList numLayers = reverse $ take numLayers recurSequence

-- takes the number of layers, [h_1/h,...,h_{i-1}/h], returns h_i/h
heightRel :: (Fractional a) => Int -> [a] -> a
heightRel numLayers firstHeights = ((recurList numLayers)
                                    !!(length firstHeights))
                                   * (1 - (sum firstHeights))

-- takes the number of layers, [h_1/h,...,h_{i-1}/h], returns [h_1/h,...,h_i/h]
heightRelList :: (Fractional a) => Int -> [a] -> [a]
heightRelList numLayers heights = heights ++ [heightRel numLayers heights]

-- takes the number of layers, returns the list of heights
heightList :: (Fractional a) => Int -> [a]
heightList numLayers = (iterate (heightRelList numLayers) [])!!numLayers

-- auxiliary function for calculating the volume of the optimal cake
volAux :: (Fractional a) => Int -> Int -> a
volAux numLayers i = (hList !! (i - 1))*(1 - (sum $ take i hList))^2
    where hList = heightList numLayers

-- takes the number of layers, returns the fraction of cone's volume taken up
-- by optimal cake
volFrac :: (Fractional a) => Int -> a
volFrac numLayers = 3 * (sum $ map (volAux numLayers) [1..numLayers])
