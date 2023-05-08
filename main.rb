require_relative 'aluno.rb'
require_relative 'curso.rb'
require_relative 'craluno.rb'
require_relative'crcurso.rb'


alunos = CrAluno.calcular_cr_aluno("notas.csv")
cursos = CrCurso.calcular_cr_curso("notas.csv")

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
