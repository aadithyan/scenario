# frozen_string_literal: true

ActiveModel::Serializer.config.adapter = ActiveModelSerializers::Adapter::Json
ActiveModelSerializers.config.key_transform = :underscore