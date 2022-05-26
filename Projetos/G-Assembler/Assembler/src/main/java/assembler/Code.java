/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

import java.util.ArrayList;

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
        // A   -> 1 -> 0001
        // D   -> 2 -> 0010
        // (A) -> 4 -> 0100

        int destination = 0;
        ArrayList<String> destinationMnemonics = new ArrayList<>();

        String command = mnemnonic[0];
        if (command.equals("movw") && mnemnonic.length == 4) {
            // Destino pode ser as duas últimas coisas caso hajam 3 argumentos no movw
            destinationMnemonics.add(mnemnonic[2]);
            destinationMnemonics.add(mnemnonic[3]);
        } else {
            destinationMnemonics.add(mnemnonic[mnemnonic.length-1]);
        }

        for (String element : destinationMnemonics) {
            switch (element) {
                case "%A":
                    destination += 1;
                    break;
                case "%D":
                    destination += 2;
                    break;
                case "(%A)":
                    destination += 4;
                    break;
            }
        }

        String bin = Integer.toBinaryString(destination);
    	return String.format("%4s", bin).replace(' ', '0');
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "movw":
                switch (mnemnonic[1]) {
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
            case "notw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001101";
                    case "%A":
                        return "000110001";
                    case "(%A)":
                        return "001110001";
                }
            case "negw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001111";
                    case "%A":
                        return "000110011";
                    case "(%A)":
                        return "001110011";
                }
            case "incw":
                switch (mnemnonic[1]) {
                    case "%A":
                        return "000110111";
                    case "%D":
                        return "000011111";
                    case "(%A)":
                        return "001110111";
                }
            case "andw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        return "001000000";
                    case "%D":
                        return "000000000";
                    case "%A":
                        return "000000000";
                }
            case "addw":
                switch (mnemnonic[1]) {
                    case "%A":
                        return "000000010";
                    case "(%A)":
                        return "001000010";
                    case "%D":
                        return "000000010";
                    case "$1":
                        return "001110111";
                }
            case "decw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001110";
                    case "%A":
                        return "000110010";
                    case "(%A)":
                        return "001110010";
                }
            case "orw":
                switch (mnemnonic[1]) {
                    case "%D":
                    case "%A":
                        return "000010101";
                    case "(%A)":
                        return "001010101";
                }
            case "subw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "001010011";
                    case "(%A)":
                        return "001110010";
                }
            case "rsubw":
                if ("%D".equals(mnemnonic[1])) {
                    return "001000111";
                }
            default:
                return "000001100";
        }
    }
    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "jmp":
                return "111";
            case "je":
                return "010";
            case "jne":
                return "101";
            case "jg":
                return "001";
            case "jge":
                return "011";
            case "jl":
                return "100";
            case "jle":
                return "110";
            default:
                return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        // Transformar o número decimal contido na string symbol em binário
        String bin = Integer.toBinaryString(Integer.parseInt(symbol));

        // Adicionar padding de zeros à esquerda string pois queremos sempre 16 bits
    	return String.format("%16s", bin).replace(' ', '0');
    }

}
