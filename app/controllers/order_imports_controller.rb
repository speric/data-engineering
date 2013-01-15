class OrderImportsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  before_filter :require_user
  
  def new
    @importer = Importer.new
  end
  
  def create
    if params[:import_file].blank?
      flash[:notice] = "Please specify a file to be imported."
      render :new
    else
      @importer = Importer.new(import_parser: TabParser.new(import_file: params[:import_file].read),
                             import_record_type: params[:import_record_type])
      @importer.import!
    
      @imported_count = @importer.imported_records.count
      @total_revenue = @importer.imported_records.sum(&:total_revenue)
    
      redirect_to root_url, notice: "#{@imported_count} valid orders representing #{number_to_currency(@total_revenue)} in revenue were imported."
    end
  end
end