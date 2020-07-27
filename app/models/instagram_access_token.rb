class InstagramAccessToken < ApplicationRecord

  attr_encrypted :access_token, key: 'KLA5nZe/n=aPfta=p/ya4AtXkl7/HJlo', mode: :per_attribute_iv

end
