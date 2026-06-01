class ApplicationController < ActionController::API
    before_action :authenticate_user!

    private

    def serialize(resource, serializer)
        serializer.new.serialize(resource).to_json
    end

    def serialize_many(collection, serializer)
        Panko::ArraySerializer.new(collection, each_serializer: serializer).to_json
    end
end
