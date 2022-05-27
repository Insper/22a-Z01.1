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
     *
     * @param mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        String destino = "";
        if (mnemnonic.length > 4) {
            return "0111";
        }
        switch (mnemnonic[0]) {
            case "movw":
                if (mnemnonic.length == 3) {
                    switch (mnemnonic[2]) {
                        case "(%A)":
                            return "0100";
                        case "%D":
                            return "0010";
                        case "%A":
                            return "0001";
                    }
                }
                if (mnemnonic.length == 4) {
                    switch (mnemnonic[2]) {
                        case "(%A)":
                            switch (mnemnonic[3]) {
                                case "%A":
                                    return "0101";
                                case "%D":
                                    return "0110";
                            }
                        case "%D":
                            switch (mnemnonic[3]) {
                                case "(%A)":
                                    return "0110";
                                case "%A":
                                    return "0011";
                            }
                        case "%A":
                            switch (mnemnonic[3]) {
                                case "(%A)":
                                    return "0101";
                                case "%D":
                                    return "0011";
                            }
                    }
                }
            case "addw":
                switch (mnemnonic[3]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "incw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "decw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "nop":
                return "0000";
            case "subw":
                switch (mnemnonic[3]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "rsubw":
                switch (mnemnonic[3]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "notw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "negw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "andw":
                switch (mnemnonic[3]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "orw":
                switch (mnemnonic[3]) {
                    case "(%A)":
                        return "0100";
                    case "%D":
                        return "0010";
                    case "%A":
                        return "0001";
                }
            case "jmp":
                return "0000";
            case "jg":
                return "0000";
            case "je":
                return "0000";
            case "jge":
                return "0000";
            case "jl":
                return "0000";
            case "jne":
                return "0000";
            case "jle":
                return "0000";
        }
        return "0000";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     *
     * @param mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "movw":
                switch (mnemnonic[1]) {
                    case "%A":
                        switch (mnemnonic[2]) {
                            case "%D":
                                return "000110000";
                            case "(%A)":
                                return "000110000";
                        }

                    case "%D":
                        switch (mnemnonic[2]) {
                            case "%A":
                                return "000001100";
                            case "(%A)":
                                return "000001100";
                        }

                    case "(%A)":
                        switch (mnemnonic[2]) {
                            case "%A":
                                return "001110000";
                            case "%D":
                                return "001110000";
                        }
                }

            case "addw":
                switch (mnemnonic[1]) {

                    case "%A":
                        switch (mnemnonic[2]) {
                            case "%D":
                                switch (mnemnonic[3]) {
                                    case "%D":
                                        return "000000010";
                                }
                        }
                    case "(%A)":
                        switch (mnemnonic[2]) {
                            case "%D":
                                switch (mnemnonic[3]) {
                                    case "%D":
                                        return "001000010";
                                }
                        }
                    case "$1":
                        switch (mnemnonic[2]) {
                            case "(%A)":
                                switch (mnemnonic[3]) {
                                    case "%D":
                                        return "001110111";
                                }
                        }
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

            case "subw":
                switch (mnemnonic[1]) {
                    case "%D":
                        switch (mnemnonic[2]) {
                            case "(%A)":
                                switch (mnemnonic[3]) {
                                    case "%A":
                                        return "001010011";
                                }
                        }
                    case "(%A)":
                        switch (mnemnonic[2]) {
                            case "$1":
                                switch (mnemnonic[3]) {
                                    case "%A":
                                        return "001110010";
                                }
                        }
                }

            case "rsubw":
                switch (mnemnonic[1]) {
                    case "%D":
                        switch (mnemnonic[2]) {
                            case "(%A)":
                                switch (mnemnonic[3]) {
                                    case "%A":
                                        return "001000111";
                                }
                        }
                }

            case "decw":
                switch (mnemnonic[1]) {
                    case "%A":
                        return "000110010";
                    case "%D":
                        return "000001110";
                }

            case "notw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001101";
                    case "%A":
                        return "000110001";
                }

            case "negw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001111";
                    case "%A":
                        return "000110011";
                }

            case "andw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        switch (mnemnonic[2]) {
                            case "%D":
                                switch (mnemnonic[3]) {
                                    case "%D":
                                        return "001000000";
                                }
                        }
                    case "%D":
                        switch (mnemnonic[2]) {
                            case "%A":
                                switch (mnemnonic[3]) {
                                    case "%A":
                                        return "000000000";
                                }
                        }
                }

            case "orw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        switch (mnemnonic[2]) {
                            case "%D":
                                switch (mnemnonic[3]) {
                                    case "%D":
                                        return "001010101";
                                }
                        }
                    case "%D":
                        switch (mnemnonic[2]) {
                            case "%A":
                                switch (mnemnonic[3]) {
                                    case "%A":
                                        return "000010101";
                                }
                        }
                }

            case "jmp":
                return "000001100";
            case "jg":
                return "000001100";
            case "je":
                return "000001100";
            case "jge":
                return "000001100";
            case "jl":
                return "000001100";
            case "jne":
                return "000001100";
            case "jle":
                return "000001100";

            default:
                return "000000000";
        }
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     *
     * @param mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "jmp":
                return "111";
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
            default:
                return "000";

        }
    }


    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     *
     * @param symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        /* TODO: implementar */
        int number_int = Integer.parseInt(symbol);
        String string_binary = "";

            while (number_int > 0) {
                string_binary = ((number_int % 2) == 0 ? "0" : "1") + string_binary;
                number_int = number_int / 2;
            }
            if (string_binary.length() <= 15){
                int contador = 15 - string_binary.length();
                int zeros = 0;
                String adicionais = "";
                while (zeros<=contador){
                    adicionais += "0";
                    zeros += 1;
                }
                string_binary = adicionais + string_binary;
            }
            return string_binary;

    }
}