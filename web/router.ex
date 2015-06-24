defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", Blog.Admin, as: :admin do
    pipe_through :browser

    resources "/posts", PostController, except: [:show]
  end

  scope "/api", Blog do
    pipe_through :api

    resources "/posts", PostController, only: [:index, :show]
  end
end
