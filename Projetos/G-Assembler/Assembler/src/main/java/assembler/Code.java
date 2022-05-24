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
        String command = mnemnonic[0];

        boolean useMemoryA = false;
        boolean zeroX = false;
        boolean negateX = false;
        boolean zeroY = false;
        boolean negateY = false;
        boolean f =  false;
        boolean negateOut = false;

        ArrayList<String> relevantMnemonics = new ArrayList<>();

        /**
         * O que fazer aqui????
         */

        // Usar o valor da memória ao invés do registrador caso (%A) esteja presente
        for (String mne : relevantMnemonics) {
            if (mne.equals("(%A)")) {
                useMemoryA = true;
            }
        }

    	return "000"
                + (useMemoryA ? "1" : "0")
                + (zeroX ? "1" : "0")
                + (negateX ? "1" : "0")
                + (zeroY ? "1" : "0")
                + (negateY ? "1" : "0")
                +  (f ? "1" : "0")
                + (negateOut ? "1" : "0");
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
