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
        /* TODO: implementar */
    	return "";
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
        switch (mnemnonic[0]){
            case "jmp"  : return "111";
            case "jg" : return "001";
            case "je"  : return "010";
            case "jge" : return "011";
            case "jl"  : return "100";
            case "jle" : return "110";
            case "jne"  : return "101";
            default    : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        int i = Integer.parseInt(symbol);
        StringBuilder binary = new StringBuilder("0000000000000000");
        if (i == 0){
            return "0000000000000000";
        }
        if (i == 1){
            return "0000000000000001";
        }
        else{
            if ((i % 2) != 0) {
                binary.setCharAt(15, '1');
                i -= 1; }
            if (i - 32768 >= 0) {
                binary.setCharAt(0, '1');
                i -= 32768; }
            if (i - 16384 >= 0) {
                binary.setCharAt(1, '1');
                i -= 16384; }
            if (i - 8192 >= 0) {
                binary.setCharAt(2, '1');
                i -= 8192; }
            if (i - 4096 >= 0) {
                binary.setCharAt(3, '1');
                i -= 4096; }
            if (i - 2048 >= 0) {
                binary.setCharAt(4, '1');
                i -= 2048; }
            if (i - 1024 >= 0) {
                binary.setCharAt(5, '1');
                i -= 1024; }
            if (i - 512 >= 0) {
                binary.setCharAt(6, '1');
                i -= 512; }
            if (i - 256 >= 0) {
                binary.setCharAt(7, '1');
                i -= 256; }
            if (i - 128 >= 0) {
                binary.setCharAt(8, '1');
                i -= 128; }
            if (i - 64 >= 0) {
                binary.setCharAt(9, '1');
                i -= 64; }
            if (i - 32 >= 0) {
                binary.setCharAt(10, '1');
                i -= 32; }
            if (i - 16 >= 0) {
                binary.setCharAt(11, '1');
                i -= 16; }
            if (i - 8 >= 0) {
                binary.setCharAt(12, '1');
                i -= 8; }
            if (i - 4 >= 0) {
                binary.setCharAt(13, '1');
                i -= 4; }
            if (i - 2 >= 0) {
                binary.setCharAt(14, '1');
                i -= 2; }
            return binary.toString();
        }
    }

}
