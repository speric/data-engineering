require 'test_helper'

class OrderImportsControllerTest < ActionController::TestCase
  test "should get new with no errors" do
    get :new
    assert_response :success
    assert_not_nil assigns(:importer)
  end

  test "should show a notice if no file is uploaded" do
    post :create, 
         import_record_type: "order"

    assert_equal "Please specify a file to be imported.", flash[:notice]
  end
  
  test "should import a valid tab file with no errors" do
    tab_file_rows = <<-eos
    purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name
    Snake Plissken\t$10 off $20 of food\t10.0\t2\t987 Fake St\tBob's Pizza
    Amy Pond\t$30 of awesome for $10\t10.0\t5\t456 Unreal Rd\tTom's Awesome Shop
    eos

    file = Tempfile.new('example_input.tab')
    file.write(tab_file_rows)
    file.rewind

    post :create, 
         import_file: Rack::Test::UploadedFile.new(file, 'text/csv'),
         import_record_type: "order"
    
    assert_not_nil assigns(:importer)
    assert_not_nil assigns(:imported_count)
    assert_not_nil assigns(:total_revenue)
    assert_equal "2 valid orders representing $70.00 in revenue were imported.", flash[:notice]
    assert_redirected_to root_url
  end
end