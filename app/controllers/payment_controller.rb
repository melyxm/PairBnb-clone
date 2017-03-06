class PaymentController < ApplicationController

  def new
      @client_token = Braintree::ClientToken.generate
  end

  def checkout
    @reservation = Reservation.find(params[:reservation_id])
    a = (@reservation.listing.price) * (@reservation.check_out - @reservation.check_in).to_i

    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    result = Braintree::Transaction.sale(
      amount: a, # this is currently hardcoded
      payment_method_nonce: nonce_from_the_client,
      options: {
      submit_for_settlement: true
      })
      if result.success?
        redirect_to :root, flash: { success: 'Transaction successful!' }
      else
        redirect_to :root, flash: { error: 'Transaction failed. Please try again.' }
      end
    end
end
