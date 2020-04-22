class Book < ApplicationRecord

  belongs_to :user #Bookモデルに対してUserモデルとの関係性を追加していく
  validates :title, presence: true, #Bookモデルのタイトルと感想文、空白と200文字以上はエラー
                              length: { maximum: 200 }
  validates :body, presence: true,
                              length: { maximum: 200 }

end
