/// <reference types="cypress"/>

describe('Criando cenário de teste para o site saucedemo', ()=>{
  it('Caso de teste: Logando no site com sucesso', ()=>{
    login_try()
    cy.get('#flash-messages').should('contain.text', 'You logged into a secure area!')
  })

  it('Caso de teste: Deslogando no site com sucesso', ()=>{
    login_try()
    cy.get('.button').click()
    cy.get('#flash').should('contain.text', 'You logged out of the secure area!')
  })

  it('Caso de teste: Logando com falha',()=>{
    cy.visit('http://the-internet.herokuapp.com/login')
    cy.get('.fa').click() 
    cy.get('#flash').should('contain.text', 'Your username is invalid!')
  })


  function login_try(){
  
    cy.visit('http://the-internet.herokuapp.com/login')
    cy.get('#username').type('tomsmith')
    cy.get('#password').type('SuperSecretPassword!')
    cy.get('.fa').click() 
  
  }


})