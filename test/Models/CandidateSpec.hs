module Models.CandidateSpec where

import           Models.Candidate as Candidate
import           Test.Hspec

spec :: Spec
spec = do
  describe "generate" $ do
    it "generates the number of candidates specified" $ do
      candidates <- Candidate.generate 2
      (length candidates) `shouldBe` 2
