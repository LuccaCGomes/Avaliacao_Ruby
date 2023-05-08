class CrAluno
  def self.calcular_cr_aluno(valor)
    alunos = []
    first_line = true
    File.foreach(valor) do |linha|

      if first_line
        first_line = false
        next
      end
      linha_aluno = linha.split(',')
      matricula = linha_aluno[0].to_i
      nota = linha_aluno[3].to_i
      ch = linha_aluno[4].to_i
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
    end
    return alunos
  end
end
