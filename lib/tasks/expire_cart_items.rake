namespace :cart_items do
  desc "expires cart items after 2 days"
  task :expire_cart_items => :environment do
    Item.where("itemable_type = 'User' AND updated_at < ?", 2.days.ago).destroy_all
  end
end