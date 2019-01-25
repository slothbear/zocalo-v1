module Admin
  class PaymentsController < Admin::ApplicationController
    def scoped_resource
      Payment.order(paid_on: "desc")
    end
  end
end
