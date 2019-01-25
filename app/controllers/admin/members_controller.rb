module Admin
  class MembersController < Admin::ApplicationController
    def scoped_resource
      Member.order(expire_on: "desc")
    end
  end
end
