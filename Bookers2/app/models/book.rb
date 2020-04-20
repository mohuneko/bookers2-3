class Book < ApplicationRecord

  belongs_to :user #Bookモデルに対してUserモデルとの関係性を追加していく

end
