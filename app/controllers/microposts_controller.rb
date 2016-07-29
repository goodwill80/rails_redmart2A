class MicropostsController < ApplicationController
before_action :require_login, only: [:create, :destroy]

def create
  @micropost = current_user.mircroposts.build(micropost_params)
  if @micropost.save
    flash[:success] = "post created!"
    redirect_to root_url
  else
    render 'static_pages/home'
end
end

def destroy


end

private
 def micropost_params
   params.require(:micropost).permit(:content)
 end



end
