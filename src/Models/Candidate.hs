{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}

module Models.Candidate where

import           Data.Aeson
import           Data.ByteString.Lazy
import           Faker.Name
import           Faker.Utils
import           GHC.Generics
import           Models.Address       as Address
import           Models.Skill         as Skill

data Candidate = Candidate {
  id        :: Integer,
  firstName :: String,
  lastName  :: String,
  address   :: Address,
  skills    :: [Skill]
} deriving (Eq, Show, Generic)

instance ToJSON Candidate
instance FromJSON Candidate

new :: Integer -> IO Candidate
new identifier = do
  firstName  <- Faker.Name.firstName
  lastName   <- Faker.Name.lastName
  addresses  <- Address.generate 1
  skills     <- Skill.generate 5
  return Candidate { Models.Candidate.id = identifier
                   , Models.Candidate.firstName = firstName
                   , Models.Candidate.lastName  = lastName
                   , Models.Candidate.address = Prelude.head addresses
                   , Models.Candidate.skills = skills }

generate :: Integer -> Integer -> IO [Candidate]
generate start end = do
  mapM (\x -> Models.Candidate.new x) [start..end]

fromJsonFile :: String -> IO [Candidate]
fromJsonFile path = do
  candidates <- decodeFileStrict path :: IO (Maybe [Candidate])
  case candidates of
    Just candidates -> return candidates
    Nothing         -> return []

toJson :: [Candidate] -> Data.ByteString.Lazy.ByteString
toJson = encode
