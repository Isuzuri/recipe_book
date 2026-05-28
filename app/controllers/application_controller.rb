class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload, exp = 30.minutes.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, 'masterkey')
    end

    def decode_token
        header = request.headers["Authorization"]
        if header
            token = header.split(" ")[1]
            begin
                JWT.decode(token, 'masterkey')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decode_token
            user_id = decode_token[0]["user_id"]
            @user = User.find_by(id: user_id)
        end
    end

    def authorized
        unless !!current_user
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end
end