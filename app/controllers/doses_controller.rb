class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail
    @dose.save

    redirect_to cocktail_path(@cocktail)

  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
