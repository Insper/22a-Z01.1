/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

//import com.sun.org.apache.bcel.internal.generic.RET;
//import com.sun.org.apache.bcel.internal.generic.RETURN;

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
        switch (mnemnonic[0]){
            case "movw":
                switch (mnemnonic[1]){
                    case "%A":
                        return "000110000";
                    case "%D":
                        return "000001100";
                    case "(%A)":
                        return "001110000";
                    case "$1":
                        return "000111111";
                    case "$0":
                        return "000101010";
                }
            case "addw":
                switch (mnemnonic[1]){
                    case "%A":
                    case "%D":
                        return "000000010";
                    case "(%A)":
                        return "001000010";
                    case "$1":
                        return "001110111";
                }
            case "incw":
                switch (mnemnonic[1]){
                    case "%A":
                        return "000110111";
                    case "%D":
                        return "000011111";
                    case "(%A)":
                        return "001110111";
                }
            case "subw":
                switch (mnemnonic[1]){
                    case "%D":
                        return "001010011";
                    case "(%A)":
                        return "001110010";
                }
            case "rsubw":
                return "001000111";
            case "decw":
                switch (mnemnonic[1]){
                    case "%A":
                        return "000110010";
                    case "(%A)":
                        return "001110010";
                    case "%D":
                        return "000001110";
                }
            case "notw":
                switch (mnemnonic[1]){
                    case "%A":
                        return "000110001";
                    case "(%A)":
                        return "001110001";
                    case "%D":
                        return "000001101";
                }
            case "negw":
                switch (mnemnonic[1]){
                    case "%A":
                        return "000110011";
                    case "(%A)":
                        return "001110011";
                    case "%D":
                        return "000001111";
                }
            case "andw":
                switch (mnemnonic[1]){
                    case "(%A)":
                        return "001000000";
                    case "%D":
                    case "%A":
                        return "000000000";
                }
            case "orw":
                switch (mnemnonic[1]){
                    case "(%A)":
                        return "001010101";
                    case "%D":
                    case "%A":
                        return "000010101";
                }
            case "jmp":
            case "je":
            case "jne":
            case "jg":
            case "jge":
            case "jl":
            case "jle": return "000001100";
            default: return "";
        }
    }
    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
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
        String binario = Integer.toBinaryString(Integer.valueOf(symbol).intValue());
        int concatenaveis;
        concatenaveis = 16 - binario.length();
        for (int i = 0; i < concatenaveis; i++) {
            binario = '0' + binario;
        }
        return binario;
    }
}
