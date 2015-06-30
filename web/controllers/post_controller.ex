defmodule Blog.PostController do
  use Blog.Web, :controller

  alias Blog.Post

  def index(conn, _params) do
    posts = Repo.all(Post)
    render conn, posts: posts
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get(Post, id)
    render conn, post: post
  end
end
