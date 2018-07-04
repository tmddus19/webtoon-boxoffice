Rails.application.routes.draw do
  
  root 'webtoons#index'
  get 'webtoons/index'
  
  get 'webtoons/boxoffice'

  get 'webtoons/result'
  
  get 'webtoons/stock'
 
end
