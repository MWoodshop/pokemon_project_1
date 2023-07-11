class TrainersController < ApplicationController
  def index
    @trainers = Trainer.order(created_at: :desc)
  end

  def new; end

  def create
    trainer = Trainer.new(trainer_params)
    trainer.save

    redirect_to '/trainers'
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def edit
    @trainer = Trainer.find_by(id: params[:id])
    return if @trainer

    redirect_to root_path, alert: 'Trainer not found'
  end

  def update
    trainer = Trainer.find(params[:id])
    trainer.update({
                     name: params[:trainer][:name],
                     region: params[:trainer][:region],
                     generation_introduced: params[:trainer][:generation_introduced],
                     gym_leader: params[:trainer][:gym_leader]
                   })
    redirect_to "/trainers/#{trainer.id}"
  end

  def destroy
    Trainer.destroy(params[:id])
    redirect_to '/trainers'
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :region, :generation_introduced, :gym_leader)
  end
end
