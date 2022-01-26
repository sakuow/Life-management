class Spend < ApplicationRecord
  def start_time
    self.money
  end
  belongs_to :user
end
