class SearchPage < SitePrism::Page
  # Aqui voce define sua URL
  set_url "https://www.google.co.uk/"
  set_url_matcher /google.co.uk\/?/


  # aqui voce cria identificadores para seus inputs etc...
  element :search_field, "input[name='q']"
  element :search_button, "input[name='btnK']"
  element :google_logo, "img#hplogo"
  elements :search_result_titles, "h3.r a"
  elements :search_result_descriptions, "div.srg div.g div div.rc div.s span.st"



  element :placeholder, 'input[placeholder="Nome e sobrenome"]'

  #define métodos para o que voce quer fazer por exemplo
  # find('input[placeholder="Nome e sobrenome"]').set("Pablo Fernando Ramos Martins")
  # find('input[placeholder="E-mail"]').set("pablofrm@gmail.com")
  # find('input[placeholder="Senha"]').set("Senha1234")
  # find('input[placeholder="CPF"]').set("07913057084")
  # find('input[placeholder="(00) 00000-0000"]').set("11983659556")
  # find('select[name="day"]').find(:css, 'option[value="29"]').select_option
  # find('select[name="month"]').find(:css, 'option[value="10"]').select_option
  # find('select[name="year"]').find(:css, 'option[value="1981"]').select_option

  # def preencher_campos
  # placeholder.set ("Pablo")
  # aqui voce colocaria o resto


  # no step_definitions voce faria assim
  #@search_page = SuaPage.new
  #@search_page.load

  # @search_page.preencher_campos





  ##

  def search_for_term(search_term)
    wait_until_search_field_visible
    search_field.set search_term
    google_logo.click
    wait_until_search_button_visible
    search_button.click
  end

  def get_all_search_results_titles
    arr = []
    wait_for_search_result_titles
    search_result_titles.each {|result| arr << result.text}
    arr
  end

  def get_all_search_results_descriptions
    arr = []
    wait_for_search_result_descriptions
    search_result_descriptions.each {|result| arr << result.text}
    arr
  end

end
