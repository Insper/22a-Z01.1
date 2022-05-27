/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

import java.util.HashMap;

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

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("%A","0001");  //Put elements in Map
        map.put("%D","0010");
        map.put("(%A)","0100");
        String op = mnemnonic[0];
        String destine = mnemnonic[mnemnonic.length - 1];
        if (mnemnonic.length < 2){
            return "0000";
        } else if (mnemnonic.length < 4 || (mnemnonic.length == 4 && !(op.equals("movw"))) ) {
            return map.get(destine);
        } else if (mnemnonic.length == 4 && (op.equals("movw"))){
            int number1 = Integer.parseInt(map.get(mnemnonic[mnemnonic.length - 1]), 2);
            int number2 = Integer.parseInt(map.get(mnemnonic[mnemnonic.length - 2]), 2);
            int number3 = number1 + number2;
            String output = Integer.toBinaryString(number3);
            while (output.length() < 4){
                output = '0' + output;
            }
            return output;
        }
        return "";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {

        String output = "00";
        String r0 = "";
        boolean flag = false;
        String op = mnemnonic[0];
        if (mnemnonic.length == 1){
            return "000001100";
        }
        if (op.equals("nop")){
            return "";
        }

        String calc = "";
        if (op.equals("movw")){
            String origin = mnemnonic[1];
            if (origin.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            if (origin.equals("%A") || origin.equals("(%A)")){
                calc = "110000";
            } else if (origin.equals("%D")){
                calc = "001100";
            } else if (origin.equals("$-1")){
                calc = "111010";
            } else if (origin.equals("$0")){
                calc = "101010";
            } else if (origin.equals("$1")){
                calc = "111111";
            }
        } else if (op.equals("addw")){
            String a = mnemnonic[1];
            String b = mnemnonic[2];

            if (a.equals("(%A)") || b.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            String destiny = mnemnonic[3];
            if (!flag) {
                if ((a.equals("%D") && b.equals("%A")) || (a.equals("%A") && b.equals("%D"))){
                    calc = "000010";
                } else if ((a.equals("$1") && b.equals("%A")) || (a.equals("%A") && b.equals("$1"))) {
                    calc = "110111";
                } else {
                    calc = "011111";
                }
            } else {
                if ((a.equals("%D") && b.equals("(%A)")) || (a.equals("(%A)") && b.equals("%D"))){
                    calc = "000010";
                } else if ((a.equals("$1") && b.equals("(%A)")) || (a.equals("(%A)") && b.equals("$1"))) {
                    calc = "110111";
                }
            }

        } else if (op.equals("incw")) {

            String origin = mnemnonic[1];
            if (origin.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            String destiny = mnemnonic[1];
            if (!flag){
                if (destiny.equals("%D")) {
                    calc = "011111";
                } else {
                    calc = "110111";
                }
            } else{
                calc = "110111";
            }
        } else if(op.equals("subw")){
            String a = mnemnonic[1];
            String b = mnemnonic[2];

            if (a.equals("(%A)") || b.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            if (!flag){
                if (a.equals("%D") && b.equals("%A")){
                    calc = "010011";
                } else if (a.equals("%A") && b.equals("%D")){
                    calc = "000111";
                }
            } else {
                if (a.equals("%D") && b.equals("(%A)")){
                    calc = "010011";
                } else if (a.equals("(%A)") && b.equals("%D")){
                    calc = "000111";
                } else if ((a.equals("(%A)") && b.equals("$1")) || (b.equals("(%A)") && a.equals("$1"))){
                    calc = "110010";

                }
            }
        } else if (op.equals("rsubw")){
            String b = mnemnonic[1];
            String a = mnemnonic[2];

            if (a.equals("(%A)") || b.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            if (!flag){
                if (a.equals("%D") && b.equals("%A")){
                    calc = "010011";
                } else if (a.equals("%A") && b.equals("%D")){
                    calc = "000111";
                }
            } else {
                if (a.equals("%D") && b.equals("(%A)")){
                    calc = "010011";
                } else if (a.equals("(%A)") && b.equals("%D")){
                    calc = "000111";
                }
            }
        } else if (op.equals("decw")){

            String origin = mnemnonic[1];
            if (origin.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            String destiny = origin;
            if (!flag){
                if (destiny.equals("%D")) {
                    calc = "001110";
                } else {
                    calc = "110010";
                }
            } else {
                calc = "110111";
            }
        } else if (op.equals("notw")) {

            String origin = mnemnonic[1];
            if (origin.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            String symbol = origin;
            if (symbol.equals("%A") || symbol.equals("(%A)")){
                calc = "110001";
            } else if (symbol.equals("%D")){
                calc = "001101";
            }
        } else if (op.equals("negw")) {
            String origin = mnemnonic[1];
            if (origin.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            String symbol = origin;
            if (symbol.equals("%A") || symbol.equals("(%A)")) {
                calc = "110011";
            } else if (symbol.equals("%D")) {
                calc = "001111";
            }
        } else if (op.equals("andw")){

            String a = mnemnonic[1];
            String b = mnemnonic[2];
            if (a.equals("(%A)") || b.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            String destiny = mnemnonic[3];
            if (!flag) {
                if ((a.equals("%D") && b.equals("%A")) || (a.equals("%A") && b.equals("%D"))){
                    calc = "000000";
                }
            } else {
                if ((a.equals("%D") && b.equals("(%A)")) || (a.equals("(%A)") && b.equals("%D"))){
                    calc = "000000";
                }
            }
        } else if (op.equals("orw")){
            String a = mnemnonic[1];
            String b = mnemnonic[2];

            if (a.equals("(%A)") || b.equals("(%A)")){
                flag = true;
                r0 = "1";
            } else {
                flag = false;
                r0 = "0";
            }

            String destiny = mnemnonic[3];
            if (!flag) {
                if ((a.equals("%D") && b.equals("%A")) || (a.equals("%A") && b.equals("%D"))){
                    calc = "010101";
                }
            } else {
                if ((a.equals("%D") && b.equals("(%A)")) || (a.equals("(%A)") && b.equals("%D"))){
                    calc = "010101";
                }
            }
        }

        output = output + r0 + calc;
        return output;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {

        switch (mnemnonic[0]){
            case "jg" : return "001";

            case "je" : return "010";

            case "jge" : return "011";

            case "jl" : return "100";

            case "jne" : return "101";

            case "jle" : return "110";

            case "jmp"  : return "111";

            default    : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {

        int number = Integer.parseInt(symbol);
        String output = Integer.toBinaryString(number);
        while(output.length() < 16) {
            output = '0' + output;
        }
        return output;
    }

}
