class ApiController < ApiAppController    
        def index
          @articles = Article.where(user_id: logged_in_user.id)
          render json: @articles
        end
      
end
