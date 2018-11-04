module Main where

import           Data.Aeson
import           Models.Candidate
import           System.Environment

main :: IO ()
main = do
  args <- getArgs
  let start = read (args !! 0) :: Integer
  let end = read (args !! 1) :: Integer
  resumes <- Models.Candidate.generate start end
  let json = Models.Candidate.toJson resumes
  putStrLn . show $ json
