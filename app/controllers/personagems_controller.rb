class PersonagemsController < ApplicationController
  before_action :set_personagem, only: %i[ show edit update destroy ]

  def index
    @personagems = Personagem.all
  end


  def show
    @personagem = Personagem.find(params[:id])
    render :layout => nil
  end

  def new
    @personagem = Personagem.new
  end

  def create
    @personagem = Personagem.new(personagem_params)

    respond_to do |format|
      if @personagem.save
        format.html { redirect_to "/todosPersonagens", notice: "Personagem catalogado com sucesso." }
        format.json { render :show, status: :created, location: @personagem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personagem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @personagem.update(personagem_params)
        format.html { redirect_to @personagem, notice: "Personagem was successfully updated." }
        format.json { render :show, status: :ok, location: @personagem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personagem.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_personagem
      @personagem = Personagem.find(params[:id])
    end

    def personagem_params
      params.require(:personagem).permit(:title, :author, :published, :about)
    end
end
