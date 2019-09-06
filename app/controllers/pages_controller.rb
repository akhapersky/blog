class PagesController < ApplicationController
  def about
    @heading = 'Page about!'
    @text = 'some text'
  end
end
