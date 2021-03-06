require 'spec_helper'

describe "brokerages/new" do
  before(:each) do
    assign(:brokerage, stub_model(Brokerage,
      :company => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :rate => "9.99"
    ).as_new_record)
  end

  it "renders new brokerage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brokerages_path, "post" do
      assert_select "input#brokerage_company[name=?]", "brokerage[company]"
      assert_select "input#brokerage_address1[name=?]", "brokerage[address1]"
      assert_select "input#brokerage_address2[name=?]", "brokerage[address2]"
      assert_select "input#brokerage_city[name=?]", "brokerage[city]"
      assert_select "input#brokerage_state[name=?]", "brokerage[state]"
      assert_select "input#brokerage_zip[name=?]", "brokerage[zip]"
      assert_select "input#brokerage_rate[name=?]", "brokerage[rate]"
    end
  end
end
