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

                    case "%D(%A)" :
                    case "(%A)%D" :
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
        /* TODO: implementar */
        if (mnemnonic[0].equals("movw")) {
            switch (mnemnonic[1]) {
                case "%A":
                    return "000110000";
                case "%D":
                    return "000001100";
                case "(%A)":
                    return "001110000";
                case "$0":
                    return "000101010";
                case "$1":
                    return "000111111";
                case "$-1":
                    return "000111010";
            }
        }
        if (mnemnonic[0].equals("addw")) {
            switch (mnemnonic[1] + mnemnonic[2]) {
                case "%D$1":
                case "$1%D":
                    return "000011111";

                case "%A$1":
                case "$1%A":
                    return "000110111";

                case "(%A)$1":
                case "$1(%A)":
                    return "001110111";

                case "%D$-1":
                case "$-1%D":
                    return "000001110";

                case "%A$-1":
                case "$-1%A":
                    return "000110010";

                case "(%A)$-1":
                case "$-1(%A)":
                    return "001110010";

                case "%A%D":
                case "%D%A":
                    return "000000010";

                case "(%A)%D":
                case "%D(%A)":
                    return "001000010";

                default:
                    return "000000000";


            }
        }
        if (mnemnonic[0].equals("subw")) {
            switch (mnemnonic[1] + mnemnonic[2]) {
                case "%D%A":
                    return "000010011";
                case "%D(%A)":
                    return "001010011";
                case "%A%D":
                    return "000000111";
                case "(%A)%D":
                    return "001000111";
                case "%A$1":
                    return "000110010";
                case "(%A)$1":
                    return "001110010";
                case "%D$1":
                    return "000001110";

                default:
                    return "000000000";


            }
        }
        if (mnemnonic[0].equals("incw")) {
            switch (mnemnonic[1]) {
                case "%A":
                    return "000110111";
                case "%D":
                    return "000011111";
                case "(%A)":
                    return "001110111";
            }
        }
        if (mnemnonic[0].equals("decw")) {
            switch (mnemnonic[1]) {
                case "%A":
                    return "000110010";
                case "%D":
                    return "000001110";
            }
        }
        if (mnemnonic[0].equals("rsubw")) {
            switch (mnemnonic[1] + mnemnonic[2]) {
                case "%A%D":
                    return "000010011";
                case "(%A)%D":
                    return "001010011";
                case "%D%A":
                    return "000000111";
                case "%D(%A)":
                    return "001000111";
                default:
                    return "000000000";
            }
        }
            if (mnemnonic[0].equals("andw")) {
                switch (mnemnonic[1] + mnemnonic[2]) {
                    case "%D%A":
                    case "%A%D":
                        return "000000000";
                    case "(%A)%D":
                    case "%D(%A)":
                        return "001000000";
                    default:
                        return "000000000";
                }
            }
            if (mnemnonic[0].equals("orw")) {
                switch (mnemnonic[1] + mnemnonic[2]) {
                    case "%D%A":
                    case "%A%D":
                        return "000010101";
                    case "(%A)%D":
                    case "%D(%A)":
                        return "001010101";
                    default:
                        return "000000000";
                }
            }
            if (mnemnonic[0].equals("notw")) {
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001101";
                    case "%A":
                        return "000110001";
                    case "(%A)":
                        return "001110001";
                    default:
                        return "000000000";
                }
            }
            if (mnemnonic[0].equals("negw")) {
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001111";
                    case "%A":
                        return "000110011";
                    case "(%A)":
                        return "001110011";
                    default:
                        return "000000000";
                }
            }
            if (mnemnonic[0].charAt(0) == 'j') {
                return "000001100";
            } else {
                return "000000000";
            }
    }


        /**
         * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
         * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
         * @retujpmrn Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
         */
        public static String jump(String[] mnemnonic) {
            /* TODO: implementar */
            switch (mnemnonic[0]) {
                case "jg":
                    return "001";
                case "je":
                    return "010";
                case "jge":
                    return "011";
                case "jl":
                    return "100";
                case "jne":
                    return "101";
                case "jle":
                    return "110";
                case "jmp":
                    return "111";
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
            /* TODO: implementar */
            int num = Integer.parseInt(symbol);
            String bin = Integer.toBinaryString(num);
            while(bin.length() < 16) {
                bin = "0" + bin;
            }
            return bin;
        }

    }
