module LinkBlock
  class Config
    cattr_accessor :current_class_name
    @@current_class_name = "current_link"

    cattr_accessor :current_class_enabled
    @@current_class_enabled = true
  end
end
