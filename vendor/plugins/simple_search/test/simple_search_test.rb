require 'test_helper'

$stdout = StringIO.new

  def create_properties_table
    ActiveRecord::Schema.define(:version => 1) do
      create_table :properties do |t|
        t.column :name, :string
        t.column :description, :text
      end
    end
  end

  class Property < ActiveRecord::Base
    simple_search :name, :description
  end

class SimpleSearchTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  setup do
    create_properties_table
    Property.create(:name => 'a name here', :description => 'a description')
    Property.create(:name => 'another name here', :description => 'another description')

  end



  test "search method is available" do
    assert Property.respond_to?(:search)
    #assert Article.respond_to?(:simple_search)

  end

  test "should search" do
    assert_equal 2, Property.search("name").size
    assert_equal 1, Property.search("another description").size
    assert_equal 0, Property.search("farting the anthem").size
  end


end
