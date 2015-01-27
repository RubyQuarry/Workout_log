class ExercisesController < ApplicationController

  before_action :find_exercise, only: [:update, :edit]

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(params[:exercise].permit(:name, :sets, :reps))
    redirect_to workout_path(@workout)
  end

  def edit
  end

  def update
    @exercise.update_attributes(exercise_params) 
    redirect_to workout_path(@workout)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name,:sets,:reps)
  end

  def find_exercise
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.find(params[:id])
  end

end
