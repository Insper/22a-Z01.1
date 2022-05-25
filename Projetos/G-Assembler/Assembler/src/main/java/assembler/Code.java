/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

import java.util.HashMap;
import java.util.Map;
import java.lang.*;
/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        /* TODO: implementar */

        Map <String, Integer> destine = new HashMap<>();
        destine.put("%A"  , 1);
        destine.put("%D"  , 10);
        destine.put("(%A)", 100);

        int finalDestiny = 0;
        int concatenaveis;
        String aux;
        switch (mnemnonic[0]){

            case "movw" : 
                for (int i=2; i<mnemnonic.length;i++){
                    finalDestiny += destine.get(mnemnonic[i]);
                }
                aux = String.valueOf(finalDestiny);
                concatenaveis = 4 - aux.length();
                for (int i = 0; i < concatenaveis; i++) {
                    aux = '0' + aux;
                }
                return aux;
            case "addw" :
            case "subw" :
            case "rsubw" :
            case "andw" : 
            case "orw"  : 
                for (int i=3; i<mnemnonic.length;i++){
                    finalDestiny += destine.get(mnemnonic[i]);
                }
                aux = String.valueOf(finalDestiny);
                concatenaveis = 4 - aux.length();
                for (int i = 0; i < concatenaveis; i++) {
                    aux = '0' + aux;
                }
                return aux;
            case "incw" : 
            case "decw" :
            case "notw" :
            case "negw" :
                for (int i=1; i<mnemnonic.length;i++){
                    finalDestiny += destine.get(mnemnonic[i]);
                }
                aux = String.valueOf(finalDestiny);
                concatenaveis = 4 - aux.length();
                for (int i = 0; i < concatenaveis; i++) {
                    aux = '0' + aux;
                }
                return aux;
            default     : return "0000";
        }
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        /* TODO: implementar */
    	return "";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        /* TODO: implementar */
        switch (mnemnonic[0]){
            case "jg"  : return "001";
            case "je"  : return "010";
            case "jge" : return "011";
            case "jl"  : return "100";
            case "jne" : return "101";
            case "jle" : return "110";
            case "jmp" : return "111";
            default    : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        /* TODO: implementar */
    	return "";
    }

}
