

class Home
      include Singleton
      include HomeObject

    def initialize

      @botao_minha_conta = 'Minha conta'
      @botao_sobre_youse = 'Sobre a Youse'
      @botao_seguro_auto = 'Seguro Auto'
      @botao_seguro_vida = 'Seguro Vida'

    end

end      