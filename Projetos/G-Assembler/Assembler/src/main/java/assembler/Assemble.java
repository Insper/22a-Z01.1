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
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.stream.Collectors;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)

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
    }

    public void warnMissingNops() throws FileNotFoundException {
        Parser parser = new Parser(inputFile);

        boolean nextShouldBeNop = false;
        int index = 0;
        while (parser.advance()) {
            String command = parser.command();
            Parser.CommandType commandType = parser.commandType(command);

            if (nextShouldBeNop) {
                if (command.startsWith("nop")) {
                    nextShouldBeNop = false;
                } else {
                    System.out.println("Um nop é necessário na linha " + index + " pois a linha anterior é um jump");
                }
            }

            if (commandType == Parser.CommandType.C_COMMAND && command.startsWith("j")) {
                nextShouldBeNop = true;
            }

            index++;
        }
    }

    public void addMissingNops() throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        String fileContent = reader.lines().collect(Collectors.joining(System.lineSeparator()));
        reader.close();

        ArrayList<String> lines = new ArrayList<>();

        for (String l : fileContent.split("\n")) {
            lines.add(l);
        }

        ArrayList<Integer> nopNeededIndexes = new ArrayList<>();
        ArrayList<Integer> nopPadding = new ArrayList<>();
        boolean addNop = false;
        int index = 0;
        int offset = 0;
        int linePadding = 0;
        for (String line : lines) {
            line = line.trim();

            if (addNop) {
                if (!line.startsWith("nop")) {
                    nopNeededIndexes.add(index + offset);
                    offset++;
                }
                addNop = false;
            } else if (line.length() > 0 && line.charAt(0) == 'j') {
                nopPadding.add(linePadding);
                addNop = true;
            }

            linePadding = line.indexOf(line.trim());
            index++;
        }

        int count = 0;
        for (int ind : nopNeededIndexes) {
            System.out.println(ind);
            lines.add(ind, " ".repeat(nopPadding.get(count)) + "nop");
            count++;
        }

        BufferedWriter writer = new BufferedWriter(new FileWriter(inputFile));
        writer.write(String.join("\n", lines));
        writer.close();
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
                if (!this.table.contains(label)) {
                    this.table.addEntry(label, romAddress);
                }
            } else {
                /**
                 * Adicionamos ao contador do endereço apenas em comandos de outros tipos,
                 * pois uma label não é uma realmente uma instrução e não deve contar como uma.
                 */
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
        int ramAddress = 16;
        while (parser.advance()){
            if (parser.commandType(parser.command()) == Parser.CommandType.A_COMMAND) {
                String symbol = parser.symbol(parser.command());
                if (!Character.isDigit(symbol.charAt(0))){
                    if (!this.table.contains(symbol)) {
                        this.table.addEntry(symbol, ramAddress);
                        ramAddress++;
                    }
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
                case C_COMMAND: // outros comandos
                    String[] mnemonics = parser.instruction(parser.command());

                    instruction = "10"             // 2 bits
                            + Code.comp(mnemonics) // 9 bits
                            + Code.dest(mnemonics) // 4 bits
                            + Code.jump(mnemonics) // 3 bits
                    ;

                    break;
            case A_COMMAND: // leaw $X, %A
                String valor = parser.symbol(parser.command());

                // Substitui o valor pelo endereço correspondente na tabela caso ele não seja um int
                // Para os casos de $LABELS ao invés de $1, $2, etc.
                if (!valor.matches("-?\\d+")) {
                    valor = this.table.getAddress(valor) + "";
                }

                String valorBinario = Code.toBinary(valor);

                instruction = "00" + valorBinario;
                break;
            default:
                continue;
            }
            // Escreve no arquivo .hack a instrução
            if(outHACK!=null) {
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
