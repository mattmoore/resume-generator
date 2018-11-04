{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}

module Models.Resume where

import           Data.Aeson
import           GHC.Generics
import           Models.Candidate as Candidate

data Resume = Resume {
  candidate   :: Candidate
} deriving (Eq, Show, Generic)

instance ToJSON Resume
instance FromJSON Resume

new :: Integer -> IO Resume
new identifier = do
  candidate <- Candidate.new identifier
  return Resume {
    Models.Resume.candidate = candidate
  }

generate :: Integer -> Integer -> IO [Resume]
generate start end = do
  mapM (\x -> Models.Resume.new x) [start..end]
