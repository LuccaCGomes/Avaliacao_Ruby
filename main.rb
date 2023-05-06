require_relative 'aluno.rb'
require_relative 'curso.rb'
alunos = []
cursos = []
first_line = true
File.foreach("notas.csv") do |linha|

  if first_line
    first_line = false
    next
  end
  # Calculando CR do aluno -------------------------------------------------
  linha_aluno = linha.split(',')
  matricula = linha_aluno[0].to_i
  nota = linha_aluno[3].to_i
  ch = linha_aluno[4].to_i
  curso_id = linha_aluno[2].to_i
  aluno_achar = alunos.find { |aluno| aluno.matricula == matricula }

  if aluno_achar
    aluno_achar.adicionar_notas_agp(nota)
    aluno_achar.adicionar_ch(ch)
  else
    aluno = Aluno.new(matricula)
    aluno.adicionar_notas_agp(nota)
    aluno.adicionar_ch(ch)
    alunos << aluno
  end


  #Média de CR dos Cursos --------------------------------------------------
  curso_achar = cursos.find {|curso| curso.curso_id == curso_id }
  if curso_achar
    curso_achar.adicionar_notas_agp(nota)
    curso_achar.adicionar_ch(ch)
  else
    curso = Curso.new(curso_id)
    curso.adicionar_notas_agp(nota)
    curso.adicionar_ch(ch)
    cursos << curso
  end
end

#Printando Os CR's

puts "---------- O CR dos alunos ----------"
alunos.each do |aluno|
  puts "#{aluno.matricula} - #{aluno.cr.ceil(2)}"
end
puts "--------------------------------------"

puts "---------- Média de CR dos cursos ----------"
cursos.each do |curso|
  puts "#{curso.curso_id} - #{curso.cr.ceil(2)}"
end
puts "--------------------------------------"
