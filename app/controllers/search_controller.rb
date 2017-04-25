class SearchController < ApplicationController
    
    def search
        if params[:q].nil?
            @records = []
        else
            @records = Question.search(params[:q])
        end
    end
end
