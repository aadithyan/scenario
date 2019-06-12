# frozen_string_literal: true

ActiveModel::Serializer.config.adapter = ActiveModelSerializers::Adapter::JsonApi
ActiveModelSerializers.config.key_transform = :underscore