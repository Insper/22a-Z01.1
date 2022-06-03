/**
 * Curso: Elementos de Sistemas
 * Arquivo: VMtranslate.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 *
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */

package vmtranslator;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Classe principal que orquestra a tradução do arquivo em linguagem de máquina virtual à pilha.
 * Opções:
 *   <arquivo vm>         primeiro parametro é o nome do arquivo vm a ser aberto
 *   -o <arquivo nasm>    parametro indica onde será salvo o arquivo gerado .nasm
 *   -n                   parametro indica não colocar rotina de bootstrap (conveniente para testar)
 */
public class VMtranslate {

    ArrayList<String> files;
    String outputFilename;
    boolean isDir;
    boolean bootstrap;

    /**
     * Inicializa o tradutor
     * @param files Lista de arquivos .vm que compoem o projeto
     * @param outputFilename Arquivo de saida .nasm
     * @param isDir Indica se o que foi passado é um dir ou nao
     * @param bootstrap rotinas de inicializacao do codigo
     */
    public VMtranslate(ArrayList<String> files, String outputFilename, boolean isDir, boolean bootstrap){
        this.files = files;                         // Lista de arquivos .vm que compoem o projeto
        this.outputFilename = outputFilename;       // Arquivo de saida .nasm
        this.isDir = isDir;                         // Indica se o que foi passado é um dir ou nao
        this.bootstrap = bootstrap;                 // bootstrap = rotinas de inicializacao do codigo
    }

    /**
     * Executa o tradutor de vm para nasm
     *  varre todos os arquivos que compoem o codigo
     *  e gera um unico nasm de saida com o nome
     *  da pasta do projeto, por exmeplo :
     *  mult/
     *       - Main.vm
     *       - mult.vm
     *  gera :
     *     mult.nasm
     *  Que possui os dois modulos.
     * @throws IOException
     * @throws FileNotFoundException
     */
    public void run() throws IOException, FileNotFoundException {
        Code code = new Code(outputFilename);

        if (bootstrap || isDir) {
            code.writeInit(bootstrap, isDir);
        }

        /**
         * O VM translate deve percorrer um ou mais arquivos que compoem o projeto
         * (no caso de codigos que possuem funcoes) e traduzir o codigo VM desses
         * arquivos para uma unica saida.
         */
        for (String file : files) {

            /**
             * Para cada arquivo, inicializar o parser
             * e o code.
             */
            Parser parser = new Parser(file);
            code.vmfile(file);

            // Avança enquanto houver linhas para traduzir
            while (parser.advance()) {
                /**
                 * Dependendo do tipo de comando chama o método do
                 * code correto para traduzir o comando
                 * por exemplo
                 *  C_LABEL:
                 *     code.writeLabel(parser.arg1(parser.command()));
                 */
                switch (parser.commandType(parser.command())) {
                    case C_PUSH:
                    case C_POP:
                        code.writePushPop(parser.commandType(parser.command()),
                                parser.arg1(parser.command()),
                                parser.arg2(parser.command()));
                        break;
                    case C_LABEL:
                        code.writeLabel(parser.arg1(parser.command()));
                        break;
                    case C_GOTO:
                        code.writeGoto(parser.arg1(parser.command()));
                        break;
                    case C_IF:
                        code.writeIf(parser.arg1(parser.command()));
                        break;
                    case C_FUNCTION:
                        code.writeFunction(parser.arg1(parser.command()),
                                parser.arg2(parser.command()));
                        break;
                    case C_RETURN:
                        code.writeReturn();
                        break;
                    case C_CALL:
                        code.writeCall(parser.arg1(parser.command()),
                                parser.arg2(parser.command()));
                        break;
                    case C_ARITHMETIC:
                        code.writeArithmetic(parser.command());
                        break;
                    default:
                        Error.error("Comando não reconhecido");
                        break;
                }
            }

            parser.close();
        }
        code.outputFile.println("; End");

        code.close();

    }
}
