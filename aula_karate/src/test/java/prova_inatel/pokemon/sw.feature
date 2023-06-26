Feature: Testando API de Pokemon

Scenario: Testando retorno de pokemon/ditto
    Given url "https://pokeapi.co/api/v2/pokemon/ditto"
    When method get
    Then status 200

Scenario: Testando retorno de pokemon/ditto com informações invalidas
    Given url "https://pokeapi.co/api/v2/pokemon/ditto/1234"
    When method get
    Then status 404

