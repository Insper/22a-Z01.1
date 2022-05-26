/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    private final BufferedReader fileReader;
    public String inputFile;		        // arquivo de leitura
    public int lineNumber = 0;		     	// linha atual do arquivo (nao do codigo gerado)
    public String currentLine;			    // linha de codigo atual


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
        boolean next;
        try {
            currentLine = fileReader.readLine();
            next = currentLine != null;
            while (next) {
                if (currentLine.length() == 0 || currentLine.charAt(0) == ';') {
                    currentLine = fileReader.readLine();
                    if (currentLine != null) {
                        next = true;
                    } else {
                        return false;
                    }
                } else {
                    return true;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return false;
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
        // Comentários
        int comment = currentLine.indexOf(";");
        if (comment != -1) {
            currentLine = currentLine.substring(0, comment).trim();

        } else {
            currentLine = currentLine.trim();
        }
        /* ja esta pronto */
        return currentLine;
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
        String[] parts = command.split(" ");
        if(parts[0].equals("leaw")){
            return CommandType.A_COMMAND;
        } else if(parts[0].contains(":")){
            return CommandType.L_COMMAND;
        } else {
            return CommandType.C_COMMAND;
        }
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command) {
        command = command.replaceAll("\\$", "").trim();
        command = command.replaceAll(",", " ").trim();
        String[] parts = command.split(" ");
    	return parts[1];
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
        StringBuffer sb= new StringBuffer(command);
        int indexLastChar = sb.length()-1;
        StringBuffer label = sb.deleteCharAt(indexLastChar);
        return label.toString();
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
        String[] split;
        String replace = command.replace(" ", "");
        if (command.charAt(0) == 'j') {
            String replace2 = replace.replace("%", " %");
            split = replace2.split(" ");
        } else {
            String replace2 = replace.replace("w", "w ");
            String replace3 = replace2.replace(",", " ");
            split = replace3.split(" ");
        }

        if (!commandType(command).equals(CommandType.L_COMMAND)) {
            return split;
        } else {
            return new String[1];
        }
    }


}
