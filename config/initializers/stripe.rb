Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

#
# PUBLISHABLE_KEY=pk_test_TYooMQauvdEDq54NiTphI7jx \
# SECRET_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc rails s
