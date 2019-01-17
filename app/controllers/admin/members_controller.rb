module Admin
  class MembersController < Admin::ApplicationController
    def scoped_resource
      Member.active.order(expire_on: "asc")
    end
  end
end
