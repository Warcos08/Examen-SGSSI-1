#-------------------------------- FUNCIONES ---------------------------------------
def main():
    cifrado = input("Introduzca el mensaje a descifrar: ")
    letras_orden = ["e","a","o","l","s","n","d","r","u","i","t","c","p","m"]
    abc = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s",
    "t","u","v","w","x","y","z"]
    freq = [0] * 26

    contarApariciones(cifrado, freq, abc)
    obtenerOrden(letras_orden, abc, freq)

def contarApariciones(cifrado, freq, abc):
    i = 0
    for letra in abc:
        apariciones = cifrado.count(letra)
        freq[i] = apariciones
        i += 1

def obtenerOrden(letras_orden, abc, freq):
    print("El análisis de frecuencias ha resultado en: ")
    numero_resultados = 3
    i = 0
    while i < numero_resultados:
        idx = freq.index(max(freq))
        print("La letra " + str(abc[idx]) + " del texto se corresponde con la " + 
        str(letras_orden[i]))
        freq[idx] -= max(freq)
        i += 1

#--------------------------------- MAIN ----------------------------------------
main()
