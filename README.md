# Setup instructions-

  - bundle install
  - rake db:create
  - rake db:migrate
  - rake db:seed
  - whenever
  - rails server

# Gems used:-
  - devise
  - rails_admin
  - twitter-bootstrap-rails
  - font-awesome-rails
  - whenever
  - paperclip

Notes:-
  - Product can be added to cart without login.
  - While doing checkout, it will ask for login.
  - For products that were added to cart earlier and whose price has been changed user will be notified about the change and it will be calculated according to new price.
  - After 2 days expiry, cart items will be destroyed with a delayed job.
  - You can access admin panel for CRUD operations by using following URL(No need to authenticate as admin user).
    `localhost:3000/admin`