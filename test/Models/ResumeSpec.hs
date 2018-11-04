module Models.ResumeSpec where

import           Models.Resume as Resume
import           Test.Hspec

spec :: Spec
spec = do
  describe "generate" $ do
    it "generates the number of resumes specified" $ do
      resumes <- Resume.generate 2
      (length resumes) `shouldBe` 2
