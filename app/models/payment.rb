class Payment < ApplicationRecord

  def self.american_date(date)
    return nil if date.blank?
    Date.strptime(date, '%m/%d/%Y')
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      columns = row.to_hash.except(:id)
      columns["paid_on"] = american_date(columns["paid_on"])
      columns["expire_on"] = american_date(columns["expire_on"])
      columns["amount"] = columns["amount"].gsub(/[$,]/,'').to_f
      Payment.create! columns
    end
  end

end
