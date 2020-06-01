class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email],
                     name: params[:name],
                     password: params[:password],
                     image_name: "default.jpg")
    if @user.save
      flash[:notice] = "sign up success"
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      render("users/new")
    end
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    if image = params[:image]
      @user.image_name = "#{@user.id}.jpg"
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = "edit success"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
end
