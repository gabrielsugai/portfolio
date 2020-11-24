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
end