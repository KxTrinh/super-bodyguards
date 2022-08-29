class AddPriceToHeroes < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :price, :string # heros instead of heroes...
  end
end
