module Ergonomics where

import Data.Function ((&))
import Data.List (isInfixOf, isSuffixOf, nub)

(|>) = (&)

contains :: Eq a => [a] -> [a] -> Bool
contains = flip isInfixOf

ends_with :: Eq a => [a] -> [a] -> Bool
ends_with = flip isSuffixOf

unique :: Eq a => [a] -> [a]
unique = nub
