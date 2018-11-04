module Models.AddressSpec where

import           Models.Address as Address
import           Test.Hspec

spec :: Spec
spec = do
  describe "generate" $ do
    it "generates the number of addresses specified" $ do
      addresses <- Address.generate 2
      (length addresses) `shouldBe` 2
