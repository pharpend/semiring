{-| 
Module      : Data.Semiring
Copyright   : Thomas Wilke, Frank Huch, Sebastian Fischer, Peter Harpending
License     : BSD3
Maintainer  : Peter Harpending <pharpend2@gmail.com>

This library provides a type class for semirings.

-}

module Data.Semiring where

-- |
-- A semiring is an additive commutative monoid with identity 'zero':
-- 
-- >         a .+. b  ==  b .+. a
-- >      zero .+. a  ==  a
-- > (a .+. b) .+. c  ==  a .+. (b .+. c)
-- 
-- A semiring is a multiplicative monoid with identity 'one':
-- 
-- >        one .*. a  ==  a
-- >        a .*. one  ==  a
-- >  (a .*. b) .*. c  ==  a .*. (b .*. c)
-- 
-- Multiplication distributes over addition:
-- 
-- > a .*. (b .+. c)  ==  (a .*. b) .+. (a .*. c)
-- > (a .+. b) .*. c  ==  (a .*. c) .+. (b .*. c)
-- 
-- 'zero' annihilates a semiring with respect to multiplication:
-- 
-- > zero .*. a  ==  zero
-- > a .*. zero  ==  zero
class (Eq s) => Semiring s where
  zero, one    :: s
  (.+.), (.*.) :: s -> s -> s
