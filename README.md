# CodeSDK


## Steps

Add to Gemfile 

Add rack-cors gem to Gemfile
~~~
gem 'rack-cors', :require => 'rack/cors'
~~~

Add sqlite3 gem to Gemfile
~~~
gem 'sqlite3'
~~~

Create Taskpipeline model class 
~~~
rails g model Taskpipeline title:string description:string completed:boolean
~~~

Create Taskpipelines controller
~~~
rails g controller Taskpipelines index create update destroy
~~~

Migrate 
~~~
rails db:migrate RAILS_ENV=development
~~~

config/routes.rb
~~~
Rails.application.routes.draw do
  scope '/api/version1' do
    resources :taskpipelines
  end
end
~~~


### taskpipelines_controller.rb
~~~
class TaskpipelinesController < ApplicationController
  def index
    taskpipelines = Taskpipeline.order("created_at DESC")
    render json: taskpipelines
  end

  def create
    taskpipeline = Taskpipeline.create(taskpipeline_param)
    render json: taskpipeline
  end

  def update
    taskpipeline = Taskpipeline.find(params[:id])
    taskpipeline.update(taskpipeline_param)
    render json: taskpipeline
  end

  def destroy
    taskpipeline = Taskpipeline.find(params[:id])
    taskpipeline.destroy
    head :no_content, status: :ok
  end

  private 
    def taskpipeline_param
      params.require(:taskpipeline).permit(:title, :description, :completed)
    end
end

~~~


### seeds.rb
~~~
Taskpipeline.create(title: "Gigafactory, Nevada", description: "Gigafactory in Nevada", completed: true)
Taskpipeline.create(title: "Gigafactory, Berlin", description: "Gigafactory in Berlin", completed: false)
~~~

Seed and run
~~~
bin/rails db:seed

bin/rails server
~~~