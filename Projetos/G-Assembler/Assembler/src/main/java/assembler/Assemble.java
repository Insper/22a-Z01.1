/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br>
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;


/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)
    private boolean nopFlag;
    private boolean isJump;
    /*
     * inicializa assembler
     * @param inFile
     * @param outFileHack
     * @param debug
     * @throws IOException
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
        // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos
        nopFlag = false;
        isJump=false;
    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de novos Labels e Endereços de memórias (variáveis)
     * e atualiza a tabela de símbolos com os endereços (table).
     *
     * Dependencia : Parser, SymbolTable
     * @return
     */
    public SymbolTable fillSymbolTable() throws FileNotFoundException, IOException {

        // primeira passada pelo código deve buscar os labels
        // LOOP:
        // END:
        Parser parser = new Parser(inputFile);
        int romAddress = 0;
        while (parser.advance()){
            if (parser.commandType(parser.command()) == Parser.CommandType.L_COMMAND) {
                String label = parser.label(parser.command());
                boolean contem = table.contains(label);
                if (contem == false) {
                    table.addEntry(label, romAddress);
                }
                // deve verificar se tal label já existe na tabela,
                // se não, deve inserir. Caso contrário, ignorar.
            }
            else {
                romAddress++;
            }
        }
        parser.close();

        // a segunda passada pelo código deve buscar pelas variáveis
        // leaw $var1, %A
        // leaw $X, %A
        // para cada nova variável deve ser alocado um endereço,
        // começando no RAM[15] e seguindo em diante.
        parser = new Parser(inputFile);
        int ramAddress = 15;
        while (parser.advance()){
            if (parser.commandType(parser.command()) == Parser.CommandType.A_COMMAND) {
                String symbol = parser.symbol(parser.command());
                if (Character.isDigit(symbol.charAt(0))){
                    boolean contem =  table.contains(symbol);
                    if (contem == false) {
                        table.addEntry(symbol, ramAddress);
                        ramAddress++;
                    }
                    // deve verificar se tal símbolo já existe na tabela,
                    // se não, deve inserir associando um endereço de
                    // memória RAM a ele.
                }
            }
        }
        parser.close();
        return table;
    }

    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
        String instruction  = "";

        /**
         * Aqui devemos varrer o código nasm linha a linha
         * e gerar a string 'instruction' para cada linha
         * de instrução válida do nasm
         * seguindo o instruction set
         */
        while (parser.advance()){
            switch (parser.commandType(parser.command())){
                case A_COMMAND:
                    String binario = "";
                    String symbol = parser.symbol(parser.command());
                    try {
                        binario = Code.toBinary(symbol);
                    }

                    catch (Exception e) {
                        int n = table.getAddress(symbol);
                        String n_string = Integer.toString(n);
                        binario = Code.toBinary(n_string);
                    }
                    instruction = "00" + binario;
                    System.out.println(instruction);
                    System.out.println(" - ");
                    break;
                case C_COMMAND:
                    System.out.println(Code.comp(parser.instruction(parser.command())));
                    System.out.println(Code.dest(parser.instruction(parser.command())));
                    System.out.println(Code.jump(parser.instruction(parser.command())));
                    System.out.println(" - ");
                    instruction = "10" + Code.comp(parser.instruction(parser.command())) + Code.dest(parser.instruction(parser.command())) + Code.jump(parser.instruction(parser.command()));

                    if(Code.jump(parser.instruction(parser.command()))!="000"){
                        isJump = true;
                    }

                    break;
                default:
                    instruction = "000000000000000000";
                    continue;
            }
            // Escreve no arquivo .hack a instrução
            if(outHACK!=null) {
                if(isJump && (instruction =="100000011000000000")){
                    if(nopFlag = false){
                        nopFlag = true;
                    }
                    else{
                        System.out.println("Nop nao existe no codigo");
                        nopFlag = false;
                        isJump = false;
                    }

                }
                else{
                    isJump = false;
                    System.out.println("Nop ja foi implementado no codigo");
                }

                outHACK.println(instruction);
            }

            instruction = null;

        }
    }



    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
