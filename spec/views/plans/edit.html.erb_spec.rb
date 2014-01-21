require 'spec_helper'

describe "plans/edit" do
  before(:each) do
    @plan = assign(:plan, stub_model(Plan,
      :name => "MyString",
      :price => "9.99",
      :company_id => 1
    ))
  end

  it "renders the edit plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plan_path(@plan), "post" do
      assert_select "input#plan_name[name=?]", "plan[name]"
      assert_select "input#plan_price[name=?]", "plan[price]"
      assert_select "input#plan_company_id[name=?]", "plan[company_id]"
    end
  end
end
