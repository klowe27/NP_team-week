Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

<<<<<<< HEAD

=======
# 
>>>>>>> e4b8e98dfca7f5b64a2bca371a81c78a835be6c8
# PUBLISHABLE_KEY=pk_test_TYooMQauvdEDq54NiTphI7jx \
# SECRET_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc rails s
