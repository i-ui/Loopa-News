defmodule Microscope.PostView do
  use Microscope.Web, :view

  import Microscope.Views.Helpers, only: [render_detail: 1]

  def render("index.json", %{posts: posts}) do
    %{
      posts: posts
    }
  end

  def render("show.json", %{post: post}) do
    %{
      post: post
    }
  end

  def render("error.json", %{changeset: changeset}) do
    errors =
      Enum.reduce(changeset.errors, %{}, fn {field, detail}, acc ->
        Map.put(acc, field, render_detail(detail))
      end)

    %{
      errors: errors
    }
  end
  def render("error.json", _params) do
    %{
      message: "Post not found"
    }
  end

  def render("delete.json", _) do
    %{
      ok: true
    }
  end

  def render("forbidden.json", %{error: error}) do
    %{
      message: error
    }
  end
end
