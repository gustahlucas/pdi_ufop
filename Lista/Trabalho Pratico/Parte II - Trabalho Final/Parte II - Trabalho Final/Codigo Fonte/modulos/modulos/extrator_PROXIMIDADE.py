import extrator_POSICAO as posicao


def verificar_proximidade_DEDOS(pontos):
    polegar_ = ''
    indicador_ = ''
    medio_ = ''
    anelar_ = ''
    minimo_ = ''
    for indx, p in enumerate(pontos):
        # pontas dos dedos: 4,8,12,15,20
        # print(indx, p)
        if indx == 4:
            # ponta do dedo polegar na horizontal
            pH_polegar = p[0]
            # ponta do dedo polegar na vertical
            pV_polegar = p[1]
            # print(pH_polegar)
        if indx == 5:
            # base do dedo indicador na vertical
            bV_indicador = p[1]
        if indx == 8:
            # ponta do indicador
            pH_indicador = p[0]
            # print(pH_indicador)
        if indx == 12:
            # ponta do indicador
            pH_medio = p[0]
            # print(pH_medio)
        if indx == 15:
            # ponta do medio
            pH_anelar = p[0]
            # print(pH_anelar)
        if indx == 20:
            pH_minimo = p[0]
            # print(pH_minimo)

    
    for i, d in enumerate(posicao.posicoes):
        # print(i, d)
        if i == 0:
            polegar_ = d
        if i == 1:
            indicador_ = d
        if i == 2:
            medio_ = d
        if i == 3:
            anelar_ = d
        if i == 4:
            minimo_ = d

    # dedo polegar precisa de algumas verificações extras, pois o movimento é mais "dinâmico"
    # 120 é um valor empírico, pode ser alterado.
    if polegar_ == indicador_:  # se forem iguais, significa que estão na mesma posição
        if (pH_polegar - pH_indicador) >= 120:  
            polegar = 'polegar ' + polegar_ + ': afastado do indicador'
        elif (pH_polegar - pH_indicador) < 120: 
            if pV_polegar <= bV_indicador:
                polegar = 'polegar ' + polegar_ + ': proximo ao indicador'
            else:
                polegar = 'polegar ' + polegar_ + ': afastado do indicador'

    else:
        polegar = 'polegar ' + polegar_ + ': afastado do indicador'

    if indicador_ == medio_:  # se forem iguais, significa que estão na mesma altura
        if (pH_indicador - pH_medio) >= 120:
            indicador = 'indicador ' + indicador_ + ': afastado do medio'
        elif (pH_indicador - pH_medio) < 120:
            indicador = 'indicador ' + indicador_ + ': proximo ao medio'

    else:
        indicador = 'indicador ' + indicador_ + ': afastado do medio'

    if medio_ == anelar_:  # se forem iguais, significa que estão na mesma altura
        if (pH_medio - pH_anelar) >= 120:
            medio = 'medio ' + medio_ + ': afastado do anelar'
        elif (pH_medio - pH_anelar) < 120:
            medio = 'medio ' + medio_ + ': proximo ao anelar'
    else:
        medio = 'medio ' + medio_ + ': afastado do anelar'

    if anelar_ == minimo_:
        if (pH_anelar - pH_minimo) >= 120:  # se forem iguais, significa que estão na mesma altura
            anelar = 'anelar ' + anelar_ + ': afastado do minimo'
            minimo = 'minimo ' + minimo_ + ': afastado do anelar'
        if (pH_anelar - pH_minimo) < 120:
            anelar = 'anelar ' + anelar_ + ': proximo ao minimo'
            minimo = 'minimo ' + minimo_ + ': proximo ao anelar'
    else:
        anelar = 'anelar ' + anelar_ + ': afastado do minimo'
        minimo = 'minimo ' + minimo_ + ': afastado do anelar'

    return [polegar, indicador, medio, anelar, minimo]
