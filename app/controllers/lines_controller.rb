class LinesController < ApplicationController
    def get_line
        render 200, json: params.permit(:line_id)
    end
end
