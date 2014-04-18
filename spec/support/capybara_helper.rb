module SelectHelper
  def select_by_value(id, value)
    option_xpath = "//*[@id='#{id}']/option[@value='#{value}']"
    option = find(:xpath, option_xpath).text
    select(option, :from => id)
  end

  def select_second_option(id)
    second_option_xpath = "//*[@id='#{id}']/option[2]"
    second_option = find(:xpath, second_option_xpath).text
    select(second_option, :from => id)
  end
end

RSpec.configure do |config|
  config.include SelectHelper, :type => :request
end
