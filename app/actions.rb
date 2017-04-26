helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end


get '/' do
    @posts = Post.order(created_at: :desc)
    erb :index
end

get '/signup' do        #if a user navigates to the path "/signup",
    @user = User.new    #setup empty @user object
    erb(:signup)        #render "app/views/signup.erb"
end

post '/signup' do
   
   #grab user input values from params
   email        = params[:email]
   avatar_url   = params[:avatar_url]
   username     = params[:username]
   password     = params[:password]
   
    # instantiate a user
       @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
       
    # if user validations pass, user is saved
    if @user.save
        redirect to('/login')
        
    else
        
        # display error message
        erb(:signup)
   

    end
   
end

get '/login' do
    erb(:login)
end

post '/login' do
    username = params[:username]
    password = params[:password]
    
    #1 Find user by username
    user = User.find_by(username: username)
    
    #2 If that user exists
    if user && user.password == password
        
        session[:user_id] = user.id
            
            #login (more to come here)
            redirect to('/')
            
        else
            @error_message = "Login Failed."
            erb(:login)
    end
        
end

get '/logout' do
    session[:user_id] = nil
    redirect to('/')
end

get '/posts/new' do
    @post = Post.new
    erb(:"posts/new")
end

post '/posts' do
    photo_url = params[:photo_url]
    
    #instantiate a new post
    @post = Post.new({ photo_url: photo_url, user_id: current_user.id })
    
    #if @posts validaites, save
    if @post.save
        redirect(to('/'))
    else
        #if it doesn't validate, print error message
        erb(:"/posts/new")
    end
end

get '/posts/:id' do
    @post = Post.find(params[:id]) #find the post with the ID from the url
    erb(:"posts/show") #render app/views/posts/show.erb
end
