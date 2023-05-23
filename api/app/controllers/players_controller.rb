require 'bcrypt'
class PlayersController < ApplicationController
    include BCrypt
    
    def index
        @player = Player.all
        render json: @player
    end

    def show
        @player = Player.find(params[:id])
        render json: @player
    end

    def create
        if(params[:password].length > 8)
            @player = Player.create(
                username: params[:username],
                email: params[:email],
                password: params[:password],
                roles: 1
            )
            if @player.save
                render json: @player, status: :created
            else
                render json: { errors: @player.errors.full_messages }, status: :bad_request
            end
        else
            render json: { errors: "Password must be at least 8 characters" }, status: :bad_request
        end
    end

    def login
        @player = Player.find_by(username: params[:username])
        if @player && @player.authenticate(params[:password])
            render json: @player, except: [:password_digest]
        else
            render json: { errors: "Invalid username or password" }, status: :unauthorized
        end
    end

    def updateEmail
        @player = Player.find(params[:id])
        @player.update(
            email: params[:email]
        )
        render json: @player
    end

    def destroy
        @player = Player.find(params[:id])
        @player.destroy
        render json: @player
    end
end
