class Curso
  attr_accessor :curso_id, :notas_agp, :ch, :cr

  def initialize(curso_id)
    @curso_id = curso_id
    @notas_agp = []
    @ch = []
    calcular_cr
  end

  def adicionar_notas_agp(valor)
    @notas_agp << valor
    calcular_cr
  end

  def adicionar_ch(valor)
    @ch << valor
    calcular_cr
  end

  private

  def calcular_cr
    soma = 0.0
    ch_total = 0

    for i in 0...notas_agp.length
      if notas_agp[i] && ch[i]
        soma += notas_agp[i] * ch[i]
        ch_total += ch[i]
      end
    end

    if ch_total > 0
      @cr = soma / ch_total
    else
      @cr = 0.0
    end
  end
end
