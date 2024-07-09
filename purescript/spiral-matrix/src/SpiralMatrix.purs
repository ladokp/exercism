module Spiral
  ( spiral
  ) where

import Prelude

import Data.List (List(..), take, drop, transpose, reverse, range)
import Data.Tuple (Tuple(..))

-- | Generates a spiral matrix of size n x n
spiral :: Int -> List (List Int)
spiral n = generateSpiral (range 1 (n * n)) n n

-- | Recursively generates the spiral, reducing dimensions in each step
generateSpiral :: forall a. List a -> Int -> Int -> List (List a)
generateSpiral _ _ 0 = Nil
generateSpiral xs m n = 
  let Tuple ys zs = splitAt n xs
  in Cons ys (rotateRight (generateSpiral zs n (m - 1)))

-- | Rotates a list of lists to the right
rotateRight :: forall a. List (List a) -> List (List a)
rotateRight = transpose <<< reverse

-- | Splits a list at a given index
splitAt :: forall a. Int -> List a -> Tuple (List a) (List a)
splitAt n xs = Tuple (take n xs) (drop n xs)
