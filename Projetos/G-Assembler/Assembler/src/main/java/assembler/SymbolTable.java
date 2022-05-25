/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;

import java.util.HashMap;

/**
 * Mantém uma tabela com a correspondência entre os rótulos simbólicos e endereços numéricos de memória.
 */
public class SymbolTable {

    private HashMap<String, Integer> symbolTable;

    /**
     * Cria a tabela de símbolos.
     */
    public SymbolTable() {
        symbolTable = new HashMap<String, Integer>();
        initialize();
    }

    /**
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {
        symbolTable.put(symbol, address);
    }

    /**
     * Confere se o símbolo informado já foi inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return Verdadeiro se símbolo está na tabela de símbolos, Falso se não está na tabela de símbolos.
     */
    public Boolean contains(String symbol) {
        if (symbolTable.containsKey(symbol)){
            return true;
        }else{
            return false;
        }
    }

    /**
     * Retorna o valor númerico associado a um símbolo já inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return valor numérico associado ao símbolo procurado.
     */
    public Integer getAddress(String symbol) {
        int key = symbolTable.get(symbol);
    	return key;
    }

    /**
     *  Inicializa a tabela de simbolos com os simbolos pre definidos
     *  exemplo: R0, R1, ...
     *  SP, LCL, ARG, THIS, THAT
     *  SCREEN, KBD, ..
     */
    //
    public void initialize() {
        // Exemplo: Registradores Virtuais
        this.addEntry("R0", 0);
        this.addEntry("R1", 1);
        this.addEntry("R2", 2);
        this.addEntry("R3", 3);
        this.addEntry("R4", 4);
        this.addEntry("R5", 5);
        this.addEntry("R6", 6);
        this.addEntry("R7", 7);
        this.addEntry("R8", 8);
        this.addEntry("R9", 9);
        this.addEntry("R10", 10);
        this.addEntry("R11", 11);
        this.addEntry("R12", 12);
        this.addEntry("R13", 13);
        this.addEntry("R14", 14);
        this.addEntry("R15", 15);
        this.addEntry("SP", 0);
        this.addEntry("LCL", 1);
        this.addEntry("ARG", 2);
        this.addEntry("THIS", 3);
        this.addEntry("THAT", 4);
        this.addEntry("SCREEN", 16384);
        this.addEntry("LED", 21184);
        this.addEntry("SW", 21185);
    }
}
