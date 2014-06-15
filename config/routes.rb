# Encoding: utf-8
Rails.application.routes.draw do
  resources :ratings, :only => [:create, :update, :destroy]
end
