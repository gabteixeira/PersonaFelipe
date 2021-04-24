class WelcomeController < ApplicationController
  def index
    @personagems = Personagem.all.order("created_at DESC")
    @colaborators = Personagem.all.group("INITCAP(TRIM(author))").order("count_author DESC").count('author')
  end

  def todos
    @colaborators = Personagem.all.group("INITCAP(TRIM(author))").order("count_author DESC").count('author')
  end

  def todosPersonagens
    @personagems = Personagem.all.order("created_at DESC")
  end
  
end
