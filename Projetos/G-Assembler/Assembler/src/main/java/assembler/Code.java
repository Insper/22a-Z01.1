/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

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
        if (mnemnonic[0].charAt(0) == 'j'){
            return "0000";
        }

        if(mnemnonic[0].equals("movw")){
            if(mnemnonic.length == 4){
                switch (mnemnonic[mnemnonic.length-2]+mnemnonic[mnemnonic.length-1]){
                    case "%D%(A)" :
                    case "%(A)%D" :
                        return "0110";

                    case "%D%A" :
                    case "%A%D" :
                        return "0011";

                    case "%A%(A)" :
                    case "%(A)%A" :
                        return "0101";

                }
            }else if(mnemnonic.length == 3){
                switch (mnemnonic[mnemnonic.length-1]){
                    case "%D": return "0010";
                    case "%A" : return "0001";
                    case "(%A)" : return "0100";
                }
            }

        }else{
            switch (mnemnonic[mnemnonic.length-1]){
                case "%D": return "0010";
                case "%A" : return "0001";
                case "(%A)" : return "0100";
            }
        }
        return "0000";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	return "";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch(mnemnonic[0]){
            case "jmp" : return "111";
            case "jle" : return "110";
            case "jne" : return "101";
            case "jl" : return "100";
            case "jge" : return "011";
            case "je" : return "010";
            case "jg" : return "001";
            default : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        int decimal = Integer.parseInt(symbol);
        String binary = Integer.toBinaryString(decimal);
        int dif = binary.length() - 16;
        if (binary.length() <  0){
            new String(new char[dif]).replace("\0", "0");
        }
        return binary;
    }

}
