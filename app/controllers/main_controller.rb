class MainController < ApplicationController
    def index
        flash[:notice] = "Logged in succesfully"
        flash[:alert] = "invalid email or password"
    end
end

