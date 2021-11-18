pontos = []
posicoes = []


# Para verificar se os dedos estão dobrados ou esticados,
# esta função faz a comparação da distancia entre pontos
# e adiciona a lista de posições se o dedo está esticado, acima ou abaixo da base do dedo se está próximo ou afastado do dedo subsequente.
def verificar_posicao_DEDOS(pontos, dedo, mao):
     for indx, p in enumerate(reversed(pontos)):
        # print(indx, p[0])
        if indx == 2:
            # base do dedo
            baseDedo_V = p[1]
            baseDedo_H = p[0]
        if indx == 1:
            pontoAnterior_H = p[0]
        if indx == 0:
            # ponta do dedo
            pontaDedo_V = p[1]
            pontaDedo_H = p[0]
            # print('pontaDedo_V', pontaDedo_V)

    if mao == 'acima':  # se a posição da mão está voltada para cima
        if dedo == 'polegar':  # o dedo polegar se move mais na horizontal do que na vertical
            if pontaDedo_H <= pontoAnterior_H: 
                if (
                        baseDedo_H - pontaDedo_H) > 70:  
                    return posicoes.append('esticado horizontal')
                elif (baseDedo_H - pontaDedo_H) <= 30:
                    return posicoes.append('esticado vertical')
                else:  # senão está dobrado
                    return posicoes.append('dobrado')
            elif pontaDedo_V < baseDedo_V: 
                return posicoes.append('esticado vertical')
            else:  # senão está dobrado
                return posicoes.append('dobrado')

        elif pontaDedo_V < baseDedo_V:  
            return posicoes.append('esticado vertical')
        else:  # senão está dobrado
            return posicoes.append('dobrado')

    else:  # se a posição da mão estiver "abaixo"
        if dedo == 'polegar':  
            if (
                    baseDedo_H - pontaDedo_H) < 70: 
                return posicoes.append('esticado horizontal')
            elif (baseDedo_H - pontaDedo_H) >= 30:
                return posicoes.append('esticado vertical')
            else:  # senão está dobrado
                return posicoes.append('dobrado')

        elif pontaDedo_V > baseDedo_V: 
            return posicoes.append('esticado vertical')
        else:  # senão está dobrado
            return posicoes.append('dobrado')


def verificar_posicao_CORPO(pontos):
    posicao1 = 0
    posicao2 = 0

    for indx, p in enumerate(pontos):
        # print(indx, p[0])
        if indx == 0:
            posicao1 = p[0] + p[1]
            print('posicao1', posicao1)
        if indx == 1:
            posicao2 = p[0] + p[1]
            print('posicao2', posicao2)

    if (posicao2 - posicao1) >= 0:
        # print('(p3 - p2) = ',(p3 - p2), 'R1')
        # print('(p2 - p1) = ',(p2 - p1), 'R2')
        # print('(p1 - p0) = ',(p1 - p0), 'R3')
        return 'esticado'

    else:
        # print('(p3 - p2) = ',(p3 - p2), 'R1')
        # print('(p2 - p1) = ',(p2 - p1), 'R2')
        # print('(p1 - p0) = ',(p1 - p0), 'R3')
        return 'dobrado'
