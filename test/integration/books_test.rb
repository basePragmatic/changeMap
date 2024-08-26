class BooksTest < ActionDispatch::IntegrationTest
    include ActionPolicy::TestHelper

    test "is authorized" do
      assert_authorized_to(:view?, Book) do
        get "/books"
      end
      assert_response :success
    end
  end