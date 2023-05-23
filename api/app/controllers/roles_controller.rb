class RolesController < ApplicationController
    def index
        @role = Role.all
        render json: @role
    end
end
