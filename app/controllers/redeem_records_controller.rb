class RedeemRecordsController < ApplicationController
  before_action :set_redeem_record, only: [:destroy]

  def create
    @redeem_record = RedeemRecord.new(redeem_record_params)
	@person = @redeem_record.person
	
	if @person and @redeem_record.redeem_item
      @person.points = @person.points - @redeem_record.redeem_item.cost
    end
	
    respond_to do |format|
	
      if  @person.points >= 0 and @redeem_record.save and @person.save
        format.html { redirect_to @person, notice: 'Redeem record was successfully created.' }
       else
        format.html { redirect_to @person,  notice: "Can't create Redeem record ." }
      end
    end
  end

  def destroy
    @redeem_record.destroy
	@person = @redeem_record.person	
    @person.points = Record.where(:person_id => @person.id).sum(:points)
    @person.save

    respond_to do |format|
      format.html { redirect_to @redeem_record.person , notice: 'Redeem record was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redeem_record
      @redeem_record = RedeemRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redeem_record_params
      params.require(:redeem_record).permit(:person_id, :redeem_item_id)
    end
end
