class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        cat = Cat.new(params)

        if cat.save
           redirect_to cat_url(cat.id)
        else
            render :new
        end
    end

    def edit

    end

    def update

    end


end