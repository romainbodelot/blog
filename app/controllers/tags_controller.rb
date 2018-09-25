class TagsController < ApplicationController
  include TagsHelper
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    flash.notice = "Tag '#{@tag.name}' Created!"
    redirect_to tag_path(@tag)
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Tag '#{@tag.name}' Destroyed!"
    redirect_to action: "index"
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    flash.notice = "Tag '#{@tag.name}' Updated!"
    redirect_to tag_path(@tag)
  end
end
