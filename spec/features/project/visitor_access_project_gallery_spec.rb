require 'rails_helper'

feature 'Visitor can access the project gallery' do
  scenario 'successfully' do
    project = Project.create!(name: 'Site de vendas', 
                              repository: 'https://github.com', 
                              description: 'Projeto consiste em um' +
                                           ' site de vendas')
    
    visit root_path
    click_on 'Projetos'

    expect(page).to have_content("Projeto: #{project.name}")
    expect(page).to have_content("Descrição: #{project.description}")
    expect(page).to have_content("Repositório: #{project.repository}")

  end

  scenario 'and may view more than one project' do
    project = Project.create!(name: 'Site de vendas',
                              repository: 'https://github.com',
                              description: 'Projeto consiste em um' +
                              ' site de vendas')

    projectB = Project.create!(name: 'Site de aluguel', 
                              repository: 'https://gitlab.com',
                              description: 'Projeto consiste em um' +
                              ' site de aluguel de casas e aptos')

    visit root_path
    click_on 'Projetos'

    expect(page).to have_content("Projeto: #{project.name}")
    expect(page).to have_content("Descrição: #{project.description}")
    expect(page).to have_content("Repositório: #{project.repository}")

    expect(page).to have_content("Projeto: #{projectB.name}")
    expect(page).to have_content("Descrição: #{projectB.description}")
    expect(page).to have_content("Repositório: #{projectB.repository}")
  end

  scenario 'and recieve a message with any project registered' do
    
    visit root_path
    click_on 'Projetos'

    expect(page).to have_content('Nenhum projeto cadastrado.')
  end
end