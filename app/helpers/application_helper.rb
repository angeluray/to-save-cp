module ApplicationHelper
  def total_amount(group_charges)
    total_amount = 0
    group_charges.each do |gc|
      total_amount += gc.amount
    end
    total_amount
  end
end
