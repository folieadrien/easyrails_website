module SpecialModel
  class Tableless
    include ActiveModel::Validations
    include ActiveModel::Conversion

    def initialize attributes = {}
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end
  end
end