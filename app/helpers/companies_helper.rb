module CompaniesHelper
  def all_main_types
    Company.distinct.pluck(:main_type).sort
  end

  def all_sub_types
    Company.distinct.pluck(:sub_type).sort
  end
end
