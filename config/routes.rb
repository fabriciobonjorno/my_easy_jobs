# frozen_string_literal: true

Rails.application.routes.draw do
# Devise configuration
devise_for :companies, skip: %i[sessions passwords confirmations registrations]
devise_for :users, skip: %i[sessions passwords confirmations registrations]

# Devise scope for Users
devise_scope :user do
  # Sessions
  post 'users/login', to: 'devise/sessions#create', as: :user_session
  get 'users/login', to: 'devise/sessions#new', as: :new_user_session
  delete 'users/logout', to: 'devise/sessions#destroy', as: :destroy_user_session

  # Registration
  post 'users/register', to: 'devise/registrations#create', as: :user_registration
  get 'users/register', to: 'devise/registrations#new', as: :new_user_registration

  # Confirmation
  get 'users/confirmation/reset', to: 'devise/confirmations#new', as: :new_user_confirmation
  get 'users/confirmation', to: 'devise/confirmations#show', as: :user_confirmation
  post 'users/confirmation', to: 'devise/confirmations#create', as: :create_user_confirmation

  # Passwords
  post 'users/password', to: 'devise/passwords#create', as: :create_user_password
  put 'users/password', to: 'devise/passwords#update', as: :user_password
  get 'users/password/reset_password', to: 'devise/passwords#new', as: :new_user_password
  get 'users/password/new_password', to: 'devise/passwords#edit', as: :edit_user_password
end

# Devise scope for Companies
devise_scope :company do
  # Sessions
  post 'companies/login', to: 'devise/sessions#create', as: :company_session
  get 'companies/login', to: 'devise/sessions#new', as: :new_company_session
  delete 'companies/logout', to: 'devise/sessions#destroy', as: :destroy_company_session

  # Registration
  post 'companies/register', to: 'devise/registrations#create', as: :company_registration
  get 'companies/register', to: 'devise/registrations#new', as: :new_company_registration

  # Confirmation
  get 'companies/confirmation/reset', to: 'devise/confirmations#new', as: :new_company_confirmation
  get 'companies/confirmation', to: 'devise/confirmations#show', as: :company_confirmation
  post 'companies/confirmation', to: 'devise/confirmations#create', as: :create_company_confirmation

  # Passwords
  post 'companies/password', to: 'devise/passwords#create', as: :create_company_password
  put 'companies/password', to: 'devise/passwords#update', as: :company_password
  get 'companies/password/reset_password', to: 'devise/passwords#new', as: :new_company_password
  get 'companies/password/new_password', to: 'devise/passwords#edit', as: :edit_company_password
end
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
