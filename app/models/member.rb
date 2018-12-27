class Member
  attr_accessor :last_name

  def valid?
    @last_name.present?
  end
end
