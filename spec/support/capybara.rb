# Capybaraの設定
Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless # デフォルトのドライバーを指定
  config.javascript_driver = :selenium_chrome_headless # JavaScriptを使用する場合のドライバーを指定
  config.default_max_wait_time = 10 # ページが読み込まれるまでの最大待ち時間
end

# JavaScriptテスト用の設定
Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1920x1080')

  # SELENIUM_DRIVER_URL を指定する
  url = ENV['SELENIUM_DRIVER_URL'] || 'http://selenium_chrome:4444/wd/hub'

  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, options: options)
end

#RSpecの設定
RSpec.configure do |config|

  config.before(:each, type: :system) do
      driven_by :selenium_chrome_headless
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
      Capybara.server_port = 4444
      Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
  
  config.before(:each, type: :system, js: true) do
      driven_by :selenium_chrome_headless
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
      Capybara.server_port = 4444
      Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end

end