class OrdersController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  def index
    @orders = Order.all
  end
  
  def import
    if params[:import_file].blank?
      redirect_to root_url, notice: "Please choose a file to upload."
    else
      @importer = Importer.new(import_parser: TabParser.new(import_file: params[:import_file].read),
                               import_record_type: params[:import_record_type])
      @importer.import!
      @total_revenue = @importer.imported_records.sum(&:total_price)

      redirect_to root_url, notice: "Orders representing #{number_to_currency(@total_revenue)} in revenue were imported."
    end
  end
end
