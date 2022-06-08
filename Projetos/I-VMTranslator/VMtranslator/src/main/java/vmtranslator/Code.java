/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */

package vmtranslator;

import java.util.*;
import java.io.*;
import java.nio.file.*;

/**
 * Traduz da linguagem vm para códigos assembly.
 */
public class Code {

    PrintWriter outputFile = null;  // arquivo .nasm de saída
    String filename = null;         // arquivo .vm de entrada
    int lineCode = 0;               // Linha do codigo vm que gerou as instrucoes
    int cont = 0;
    /**
     * Abre o arquivo de saida e prepara para escrever
     * @param filename nome do arquivo NASM que receberá o código traduzido.
     */
    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando aritmético.
     * @param  command comando aritmético a ser analisado.
     */
    public void writeArithmetic(String command) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command.equals("add")) {
            commands.add(String.format("; %d - ADD", lineCode++));
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("decw %A");
            commands.add("addw (%A), %D, %D");
            commands.add("movw %D, (%A)");
            //commands.add("addw $1, %A, %D");
            //commands.add("leaw $0, %A");
            //commands.add("movw %D, (%A)");

        } else if (command.equals("sub")) {
            commands.add(String.format("; %d - SUB", lineCode++));
            // IMPLEMENTAR AQUI O LAB
            // LEMBRAR DE USAR A FUNÇÃO commands.add()!
        } else if (command.equals("neg")) {
            commands.add(String.format("; %d - NEG", lineCode++));

        } else if (command.equals("eq")) {
            commands.add(String.format("; %d - EQ", lineCode++));

        } else if (command.equals("gt")) {
            commands.add(String.format("; %d - GT", lineCode++));

        } else if (command.equals("lt")) {
            commands.add(String.format("; %d - LT", lineCode++));

        } else if (command.equals("and")) {
            commands.add(String.format("; %d - AND", lineCode++));

        } else if (command.equals("or")) {
            commands.add(String.format("; %d - OR", lineCode++));

        } else if (command.equals("not")) {

        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando de Push ou Pop.
     * @param  command comando de push ou pop a ser analisado.
     * @param  segment segmento de memória a ser usado pelo comando.
     * @param  index índice do segkento de memória a ser usado pelo comando.
     */
    public void writePushPop(Parser.CommandType command, String segment, Integer index) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command == Parser.CommandType.C_POP) {
            commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                Error.error("Não faz sentido POP com constant");
            } else if (segment.equals("local")) {
                //decrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("decw %D");
                commands.add("movw %D,(%A)");


                commands.add("leaw $"+index+",%A");
                commands.add("movw %A,%D");
                commands.add("leaw $1,%A"); // movendo primeiro endereco do local para A
                commands.add("movw (%A),%A");
                commands.add("addw %A,%D,%D"); // guardando endereco do local em D
                commands.add("leaw $13,%A");
                commands.add("movw %D,(%A)"); //guardando endereco do local na ram 13

                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw (%A),%D");//movendo o que esta no topo da pilha para D

                commands.add("leaw $13,%A"); //acessando ram 13
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");

                commands.add("leaw $0,%A"); //zerando o topo do stack
                commands.add("movw %A,%D");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");


            } else if (segment.equals("argument")) {
                //decrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("decw %D");
                commands.add("movw %D,(%A)");

                commands.add("leaw $"+index+",%A");
                commands.add("movw %A,%D");
                commands.add("leaw $2,%A"); // movendo primeiro endereco do argument para A
                commands.add("movw (%A),%A");
                commands.add("addw %A,%D,%D"); // guardando endereco do local em D
                commands.add("leaw $13,%A");
                commands.add("movw %D,(%A)"); //guardando endereco do local na ram 13

                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw (%A),%D");//movendo o que esta no topo da pilha para D

                commands.add("leaw $13,%A"); //acessando ram 13
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");

                commands.add("leaw $0,%A"); //zerando o topo do stack
                commands.add("movw %A,%D");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");


            } else if (segment.equals("this")) {
                //decrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("decw %D");
                commands.add("movw %D,(%A)");

                commands.add("leaw $"+index+",%A");
                commands.add("movw %A,%D");
                commands.add("leaw $3,%A"); // movendo primeiro endereco do this para A
                commands.add("movw (%A),%A");
                commands.add("addw %A,%D,%D"); // guardando endereco do this em D
                commands.add("leaw $13,%A");
                commands.add("movw %D,(%A)"); //guardando endereco do this na ram 13

                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw (%A),%D");//movendo o que esta no topo da pilha para D

                commands.add("leaw $13,%A"); //acessando ram 13
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");

                commands.add("leaw $0,%A"); //zerando o topo do stack
                commands.add("movw %A,%D");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");


            } else if (segment.equals("that")) {
                //decrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("decw %D");
                commands.add("movw %D,(%A)");

                commands.add("leaw $"+index+",%A");
                commands.add("movw %A,%D");
                commands.add("leaw $4,%A"); // movendo primeiro endereco do that para A
                commands.add("movw (%A),%A");
                commands.add("addw %A,%D,%D"); // guardando endereco do that em D
                commands.add("leaw $13,%A");
                commands.add("movw %D,(%A)"); //guardando endereco do that na ram 13

                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw (%A),%D");//movendo o que esta no topo da pilha para D

                commands.add("leaw $13,%A"); //acessando ram 13
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");

                commands.add("leaw $0,%A"); //zerando o topo do stack
                commands.add("movw %A,%D");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");


            } else if (segment.equals("static")) {
                //decrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("decw %D");
                commands.add("movw %D,(%A)");

                commands.add("leaw $"+index+",%A");
                commands.add("movw %A,%D");
                commands.add("leaw $16,%A"); // movendo primeiro endereco do static para A
                commands.add("addw %A,%D,%D"); // guardando endereco do static em D
                commands.add("leaw $13,%A");
                commands.add("movw %D,(%A)"); //guardando endereco do static na ram 13

                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw (%A),%D");//movendo o que esta no topo da pilha para D

                commands.add("leaw $13,%A"); //acessando ram 13
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");

                commands.add("leaw $0,%A"); //zerando o topo do stack
                commands.add("movw %A,%D");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");


            } else if (segment.equals("temp")) {
                //decrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("decw %D");
                commands.add("movw %D,(%A)");

                commands.add("leaw $"+index+",%A");
                commands.add("movw %A,%D");
                commands.add("leaw $5,%A"); // movendo primeiro endereco do temp para A
                commands.add("addw %A,%D,%D"); // guardando endereco do temp em D
                commands.add("leaw $13,%A");
                commands.add("movw %D,(%A)"); //guardando endereco do temp na ram 13

                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw (%A),%D");//movendo o que esta no topo da pilha para D

                commands.add("leaw $13,%A"); //acessando ram 13
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");

                commands.add("leaw $0,%A"); //zerando o topo do stack
                commands.add("movw %A,%D");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");


            } else if (segment.equals("pointer")) {
                //decrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("decw %D");
                commands.add("movw %D,(%A)");
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw (%A),%D");
                if(index==0) {
                    commands.add("leaw $3,%A");
                } else {
                    commands.add("leaw $4,%A");

                }
                commands.add("movw %D,(%A)");
            }
        } else if (command == Parser.CommandType.C_PUSH) {
            commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
// carrega a constant em %A e move para %D
                commands.add("leaw $"+ index + ", %A");
                commands.add("movw %A, %D");
// carrega o calor do SP e move a constant
// para o topo da pilha
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");
// altera stack pointer: SP = SP + 1
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("local")) {

                commands.add("leaw $1,%A"); //pegando posicao do primeiro local na pilha
                commands.add("movw (%A),%D");
                commands.add("leaw $"+index+",%A");
                commands.add("addw %A,%D,%A"); // somando o index com a posicao do local 0 na pilha
                commands.add("movw (%A),%D");
                //move D para o topo da pilha
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");
                //incrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D,(%A)");

            } else if (segment.equals("argument")) {
                commands.add("leaw $2,%A"); //pegando posicao do primeiro arg na pilha
                commands.add("movw (%A),%D");
                commands.add("leaw $"+index+",%A");
                commands.add("addw %A,%D,%A"); // somando o index com a posicao do local 0 na pilha
                commands.add("movw (%A),%D");
                //move D para o topo da pilha
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");
                //incrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D,(%A)");
            } else if (segment.equals("this")) {
                commands.add("leaw $3,%A"); //pegando posicao do primeiro this na pilha
                commands.add("movw (%A),%D");
                commands.add("leaw $"+index+",%A");
                commands.add("addw %A,%D,%A"); // somando o index com a posicao do this 0 na pilha
                commands.add("movw (%A),%D");
                //move D para o topo da pilha
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");
                //incrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D,(%A)");
            } else if (segment.equals("that")) {
                commands.add("leaw $4,%A"); //pegando posicao do primeiro that na pilha
                commands.add("movw (%A),%D");
                commands.add("leaw $"+index+",%A");
                commands.add("addw %A,%D,%A"); // somando o index com a posicao do that 0 na pilha
                commands.add("movw (%A),%D");
                //move D para o topo da pilha
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");
                //incrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D,(%A)");
            } else if (segment.equals("static")) {
                commands.add("leaw $16,%A"); //pegando posicao do primeiro static
                commands.add("leaw $"+index+",%A");
                commands.add("addw %A,%D,%A"); // somando o index com a posicao do static 0 na pilha
                commands.add("movw (%A),%D");
                //move D para o topo da pilha
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");
                //incrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D,(%A)");
            } else if (segment.equals("temp")) {
                commands.add("leaw $5,%A"); //pegando posicao do primeiro temp na pilha
                commands.add("movw %A,%D");
                commands.add("leaw $"+index+",%A");
                commands.add("addw %A,%D,%A"); // somando o index com a posicao do temp 0 na pilha
                commands.add("movw (%A),%D");
                //move D para o topo da pilha
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%A");
                commands.add("movw %D,(%A)");
                //incrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D,(%A)");
            } else if (segment.equals("pointer")) {
                if(index==0) { // IMPLEMENTAR E VER SE O RESTO DA LOGICA ESTA CERTO
                    commands.add("leaw $3,%A");
                    commands.add("movw (%A),%D");
                } else {
                    commands.add("leaw $4,%A");
                    commands.add("movw (%A),%D");
                }
                commands.add("leaw $0,%A");
                commands.add("leaw (%A),%A");
                commands.add("movw %D,(%A)");
                //incrementa SP
                commands.add("leaw $0,%A");
                commands.add("movw (%A),%D");
                commands.add("incw %D");
                commands.add("movw %D,(%A)");
            }
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para inicializar o processo da VM (bootstrap).
     * Também prepara a chamada para a função Sys.init
     * O código deve ser colocado no início do arquivo de saída.
     */
    public void writeInit(boolean bootstrap, boolean isDir) {

        List<String> commands = new ArrayList<String>();

        if(bootstrap || isDir)
            commands.add( "; Inicialização para VM" );

        if(bootstrap) {
            commands.add("leaw $256,%A");
            commands.add("movw %A,%D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D,(%A)");
        }

        if(isDir){
            commands.add("leaw $Main.main, %A");
            commands.add("jmp");
            commands.add("nop");
        }

        if(bootstrap || isDir) {
            String[] stringArray = new String[commands.size()];
            commands.toArray(stringArray);
            write(stringArray);
        }
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar o labels (marcadores de jump).
     * @param  label define nome do label (marcador) a ser escrito.
     */
    public void writeLabel(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add( label+":" );
        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto (jumps).
     * Realiza um jump incondicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeGoto(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Incondicional", lineCode++));
        commands.add("leaw $"+label+",%A");
        commands.add("jmp");
        commands.add("nop");
        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto condicional (jumps condicionais).
     * Realiza um jump condicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeIf(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Condicional", lineCode++));
        commands.add("leaw $0,%A");
        commands.add("movw (%A),%A"); //guardando no topo da pilha-1 em D
        commands.add("decw %A");
        commands.add("movw (%A),%D");
        commands.add("leaw $-1,%A");
        commands.add("subw %A,%D,%D"); // checando se o valor e igual a true
        commands.add("leaw $PULA,%A");
        commands.add("je %D");
        commands.add("nop");
        commands.add("PULA:"); // pulando
        commands.add("leaw $"+label+",%A");
        commands.add("jmp");
        commands.add("nop");
        commands.add("NAOPULA:");
//incrementa SP
        commands.add("leaw $0,%A");
        commands.add("movw (%A),%D");
        commands.add("incw %D");
        commands.add("movw %D,(%A)");
        commands.add("END:");
        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

     }

    /**
     * Grava no arquivo de saida as instruções em Assembly para uma chamada de função (Call).
     * @param  functionName nome da função a ser "chamada" pelo call.
     * @param  numArgs número de argumentos a serem passados na função call.
     */
    public void writeCall(String functionName, Integer numArgs) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - chamada de funcao %s", lineCode++, functionName));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para o retorno de uma sub rotina.
     */
    public void writeReturn() {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Retorno de função", lineCode++));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para a declaração de uma função.
     * @param  functionName nome da função a ser criada.
     * @param  numLocals número de argumentos a serem passados na função call.
     */
    public void writeFunction(String functionName, Integer numLocals) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Declarando função %s", lineCode++, functionName));

    }

    /**
     * Armazena o nome do arquivo vm de origem.
     * Usado para definir os dados estáticos do código (por arquivo).
     * @param file nome do arquivo sendo tratado.
     */
    public void vmfile(String file) {

        int i = file.lastIndexOf(File.separator);
        int j = file.lastIndexOf('.');
        this.filename = file.substring(i+1,j);

    }

    // grava as instruções em Assembly no arquivo de saída
    public void write(String[] stringArray) {
        // gravando comandos no arquivos
        for (String s: stringArray) {
            this.outputFile.println(s);
        }
    }

    // fecha o arquivo de escrita
    public void close() throws IOException {
        this.outputFile.close();
    }

}
