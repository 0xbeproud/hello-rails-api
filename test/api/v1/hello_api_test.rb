require 'minitest/autorun'

class HelloApiTest < ActionDispatch::IntegrationTest
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  test 'get hello' do
    get '/api/v1/hello'
    assert_response :ok
  end

end