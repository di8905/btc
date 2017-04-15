class Deal < ApplicationRecord
  belongs_to :dealable, polymorphic: true

  def dealable_type=(class_name)
    super(class_name.constantize.base_class.to_s)
  end
end
