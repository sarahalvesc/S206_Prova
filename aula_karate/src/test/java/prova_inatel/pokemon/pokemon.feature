Feature: Testando API de Pokemon

Background: Executa antes de cada teste
    * def url_base = 'https://pokeapi.co/api/v2/'

Scenario: Testando retorno de pokemon/ditto
    Given url url_base
    When method get
    Then status 200

Scenario: Testando retorno de pokemon/ditto com informações invalidas
    Given url url_base
    And path 'pokemon/chocolate'
    When method get
    Then status 404

Scenario: Testando o retorno de pokemon/ditto e verificando o JSON
    Given url url_base
    And path 'pokemon/ditto'
    When method get
    Then status 200
    And match response.name == 'ditto'
    And match response.id == 132

Scenario: Testando o retorno de pokemon Rede, entrando em um dos elementos do array de idiomas e testando o retorno do JSON
    Given url url_base
    And path 'version/1/'
    When method get
    Then status 200
    And def idioma = response.names[5].language.url
    And print idioma
    And url idioma
    When method get
    Then status 200
    Then match response.name == "es"
    And match response.id == 7