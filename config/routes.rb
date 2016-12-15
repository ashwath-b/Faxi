Rails.application.routes.draw do
  get 'cab/index'
  get 'cab/end_ride'
  post 'cab/book_cab'
end
