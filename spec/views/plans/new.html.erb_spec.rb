require 'spec_helper'

describe "plans/new" do
  before(:each) do
    assign(:plan, stub_model(Plan,
      :name => "MyString",
      :price => "9.99",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plans_path, "post" do
      assert_select "input#plan_name[name=?]", "plan[name]"
      assert_select "input#plan_price[name=?]", "plan[price]"
      assert_select "input#plan_company_id[name=?]", "plan[company_id]"
    end
  end
end
