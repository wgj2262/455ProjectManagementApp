# == Schema Information
#
# Table name: projects
#
#  id                       :integer          not null, primary key
#  title                    :string
#  details                  :string
#  expected_completion_date :date
#  tenant_id                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :tenant
  validates_uniqueness_of :title
  validate :free_plan_can_only_have_one_project

  def free_plan_can_only_have_one_project
    if self.new_record? && (tenant.projects.count > 0) && (tenant.plan == 'free')
      errors.add(:base, 'Free plans can only have one project!')
    end
  end

  # Placeholder code
  def self.by_user_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      tenant.projects
    else
      tenant.projects.order(:id).limit(1)
    end
  end
end
