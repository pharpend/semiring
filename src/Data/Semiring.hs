{-# LANGUAGE FlexibleInstances #-}
{- |
Module       : Data.Semiring.Tropical.Skel
Description  : A module for Tropical whatever
Copyright    : 2012, Thomas Wilke, Frank Huch, Sebastian Fischer
               2014, Peter Harpending
License      : BSD3
Maintainer   : Peter Harpending <pharpend2@gmail.com>
Stability    : experimental
Portability  : archlinux

This library provides a type class for semirings.

-}

module Data.Semiring where

import Data.Monoid

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

instance Semiring a => Monoid a where
  mempty = zero
  mappend = (.+.)

instance Semiring Bool where
  zero = False
  one = True
  (.+.) = (||)
  (.*.) = (&&)

instance Num a => Semiring a where
  zero = 0
  one = 1
  (.+.) = (+)
  (.*.) = (*)
