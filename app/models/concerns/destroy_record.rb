module DestroyRecord
  extend ActiveSupport::Concern

  included do
    default_scope -> { where(is_deleted: false) }
  end

  def destroy     
    update_attribute(:is_deleted, true)
    run_callbacks :destroy
    freeze
  end 
end