/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    private final BufferedReader fileReader;
    public String inputFile;		        // arquivo de leitura
    public int lineNumber = 0;		     	// linha atual do arquivo (nao do codigo gerado)
    public String currentCommand = "";      // comando atual
    public String currentLine;			    // linha de codigo atual
    public boolean verificaNop = false;
    public boolean implementaNop = false;


    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
        this.inputFile = file;
        this.fileReader = new BufferedReader(new FileReader(file));
        this.lineNumber = 0;
    }

    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() {
        /* ja esta pronto */
        while(true){
            try {
                currentLine = fileReader.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }
            lineNumber++;
            if (currentLine == null)
                return false;  // caso não haja mais comandos
            currentCommand = currentLine.replaceAll(";.*$", "").trim();
            if (currentCommand.equals(""))
                continue;
            return true;   // caso um comando seja encontrado
        }
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
        /* ja esta pronto */
        return currentCommand;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
        String[] terms = command.split(" ");
        if (terms[0].equals("leaw"))
            return CommandType.A_COMMAND;
        else if (terms[0].endsWith(":"))
            return CommandType.L_COMMAND;
        else
            return CommandType.C_COMMAND;
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command) { // leaw $0,%A


        String command1 = command.replace("$", ""); // = "leaw 0 A
        String command2 = command1.replaceAll(",", " ");
        String command3 = command2.replaceAll("%", "");
        String[] terms = command3.split(" "); // [leaw 0 A]
        String simbolo = terms[1];
        return simbolo;
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
        String[] terms = command.split(" ");
        String rotulo = terms[0];
        rotulo = rotulo.replaceAll(":", "");
        return rotulo;
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
        String argumento_para_splitar_a_cada_espaco_em_branco = "[\\s,]+";
        return command.split( argumento_para_splitar_a_cada_espaco_em_branco) ;
    }

    /**
    * Implementação do conceito A e B para verificar se há nop
    * depois de um jump
     * @throws IOException 
    * */
    public boolean checaNop() throws IOException { 
        String[] terms = currentCommand.split(" ");
        String primeiroTermo = terms[0];
        if (implementaNop) {
            implementaNop = false;
            currentCommand = "nop";
            close();
            Parser parser = new Parser(inputFile);
            for (int i = 0; i < lineNumber-1; i++) {
                currentLine = fileReader.readLine();
            }
            System.out.println("NOP implementado artificialmente na linha " + String.valueOf(lineNumber));
            return true;
        }
        else if (verificaNop) {
            verificaNop = false;
            if (!primeiroTermo.equals("nop")) {
                /** conceito B seria um throw new Exception("NOP não implementado"); nessa linha */
                implementaNop = true;
            }
        }
        else if (Arrays.asList("jmp", "je", "jne", "jg", "jge", "jl", "jle").contains(primeiroTermo)){
            verificaNop = true;
        }
        return false;
    }

}