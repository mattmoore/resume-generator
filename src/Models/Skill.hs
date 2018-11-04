{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}

module Models.Skill where

import           Data.Aeson
import           Faker.Name
import           Faker.Utils
import           GHC.Generics

data Skill = Skill {
  name :: String
} deriving (Eq, Show, Generic)

instance ToJSON Skill
instance FromJSON Skill

new :: IO Skill
new = do
  name <- Faker.Name.firstName
  return Skill { Models.Skill.name = name }

generate :: Integer -> IO [Skill]
generate count = do
  mapM (\_ -> Models.Skill.new) [1..count]
