class PaymentController < ApplicationController
  def index
  end

  def new
    @client_token = Braintree::ClientToken.generate
  end
end
