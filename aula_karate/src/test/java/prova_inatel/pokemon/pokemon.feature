Feature: Testando API de Pokemon

Background: Executa antes de cada teste
    * def url_base = 'https://pokeapi.co/api/v2/'

Scenario: Consultar informações de um Pokémon existente
    Given url url_base
    And path 'pokemon/25'
    When method get
    Then status 200
    And match response.id == 25    

Scenario: Consultar informações de um Pokémon inexistente
    Given url url_base
    And path 'pokemon/10000'
    When method get
    Then status 404


Scenario: Listar todos os Pokémon
    Given url url_base
    And path 'pokemon'
    When method get
    Then status 200
    And match response.count == 1281
    

Scenario: Consultar informações de um tipo de Pokémon existente
    Given url url_base
    And path 'type/electric'
    When method get
    Then status 200
    And match response.name == "electric"


Scenario: Consultar informações de um tipo de Pokémon inexistente
    Given url url_base
    And path 'type/canetaazul'
    When method get
    Then status 404


#Scenario: Simulando como seria Inserir novo Pokemon usando o método POST
#   Given url url_base 
#   And path 'pokemon/'
#   And request {name:'ManoelGomes', url: 'canetaazul'} 
#   When method POST
#   Then status 201  
#   And match response.name == 'ManoelGomes'
#   And match response.url == 'canetaazul'
