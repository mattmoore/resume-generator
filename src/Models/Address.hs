{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}

module Models.Address where

import           Data.Aeson
import           Faker.Address
import           GHC.Generics

data Address = Address {
  street     :: String,
  city       :: String,
  state      :: String,
  postalCode :: String
} deriving (Eq, Show, Generic)

instance ToJSON Address
instance FromJSON Address

new :: IO Address
new = do
  street     <- Faker.Address.streetAddress
  city       <- Faker.Address.city
  state      <- Faker.Address.state
  postalCode <- Faker.Address.postcode
  return Address {
      Models.Address.street   = street
    , Models.Address.city     = city
    , Models.Address.state    = state
    , Models.Address.postalCode = postalCode
  }

generate :: Integer -> IO [Address]
generate count = do
  mapM (\_ -> Models.Address.new) [1..count]
