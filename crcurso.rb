class CrCurso
  def self.calcular_cr_curso(valor)
    cursos = []
    first_line = true
    File.foreach(valor) do |linha|

      if first_line
        first_line = false
        next
      end
      linha_curso = linha.split(',')
      nota = linha_curso[3].to_i
      ch = linha_curso[4].to_i
      curso_id = linha_curso[2].to_i
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
    return cursos
  end
end
