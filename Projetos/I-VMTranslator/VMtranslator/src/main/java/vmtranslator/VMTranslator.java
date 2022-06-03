/**
 * Curso: Elementos de Sistemas
 * Arquivo: VMTranslator.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 *
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */
package vmtranslator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;

/**
 * Classe principal que orquestra a tradução do arquivo em linguagem de máquina virtual à pilha.
 * Opções:
 * <arquivo vm>         primeiro parametro é o nome do arquivo vm a ser aberto
 * -o <arquivo nasm>    parametro indica onde será salvo o arquivo gerado .nasm
 * -n                   parametro indica não colocar rotina de bootstrap (conveniente para testar)
 */
class VMTranslator {
    public static void main(String[] args) {

        if (args.length < 1)  // checa se arquivo foi passado
            Error.error("informe o nome do arquivo vm");

        boolean isDir = false;
        String inputFilename = null;
        String outputFilename = null;
        boolean debug = false;
        boolean bootstrap = true;

        for (int i = 0; i < args.length; i++) {
            switch (args[i].charAt(0)) {
                case '-':
                    if (args[i].charAt(1) == 'h') {
                        System.out.println("Opções");
                        System.out.println("<arquivo> : programa em linguagem de máquina a ser carregado");
                        System.out.println("-o <arquivo> : nome do arquivo para salvar no formato NASM");
                        System.out.println("-n : não colocar rotina de bootstrap (conveniente para testar)");
                        System.out.println("-s : simulador");

                    } else if (args[i].charAt(1) == 'o') {
                        outputFilename = args[i + 1]; // arquivo output
                        i++;
                    } else if (args[i].charAt(1) == 'n') {
                        bootstrap = false; // não insere rotina de bootstrap
                    } else {
                        Error.error("Argumento não reconhecido: " + args[i]);
                    }
                    break;
                default:
                    inputFilename = args[i];
                    break;
            }
        }

        try {

            Path path = new File(inputFilename).getCanonicalFile().toPath().toAbsolutePath();

            ArrayList<String> files = new ArrayList<String>();

            // Cria um arquivo de saída dependendo se diretório.
            if (Files.isDirectory(path)) {
                isDir = true;
                int indexName = path.getNameCount() - 1;
                if (path.getName(indexName).toString().equals(".")) {
                    indexName--;
                }

                if (outputFilename == null) {
                    outputFilename = path.toString() +
                            File.separator +
                            path.getName(indexName).toString() + ".nasm";
                }

                DirectoryStream<Path> directoryStream = Files.newDirectoryStream(path);
                for (Path p : directoryStream) {

                    String extension = "";
                    int i = p.toString().lastIndexOf('.');
                    if (i > 0) {
                        extension = p.toString().substring(i + 1);
                    }
                    if (extension.equals("vm")) {
                        files.add(p.toString());
                    }
                }
            } else {
                files.add(inputFilename);
                if (outputFilename == null) {
                    outputFilename = inputFilename.substring(0, inputFilename.lastIndexOf('.')) + ".nasm";
                }
            }

            /** Inicializa VMTranslator **/
            VMtranslate vmtranslate = new VMtranslate(files, outputFilename, isDir, bootstrap);

            /** Executa tradução de VM para nasm **/
            vmtranslate.run();


        } catch (FileNotFoundException e) {
            Error.error("Arquivo nao encontrado :" + inputFilename + "\' ");
            System.exit(1);
        } catch (IOException e) {
            Error.error("uma excessao de i/o foi lancada");
            System.exit(1);
        }
    }
}
