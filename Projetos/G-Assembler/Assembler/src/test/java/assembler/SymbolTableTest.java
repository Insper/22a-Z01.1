/**
 * Curso: Elementos de Sistemas
 * Arquivo: ParserTest.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 16/04/2017
 */
package assembler;
import org.junit.Test;
import org.junit.AfterClass;
import org.junit.Rule;

import java.io.IOException;
import java.io.PrintWriter;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

import static org.junit.Assert.*;

public class SymbolTableTest {

    Parser parser = null;
    private static StringBuilder builder = new StringBuilder();

    SymbolTable table = null;

    /**
     * Create the test case
     */
    public SymbolTableTest() {
        table = new SymbolTable();
    }

 @AfterClass
    public static void afterClass() throws IOException {
        String logFileName = "logJSymbolTable.txt";
        PrintWriter logFile = new PrintWriter(logFileName, "UTF-8");
        logFile.write(builder.toString());
        logFile.close();
    }

    @Rule
    public TestWatcher watchman = new TestWatcher() {

        @Override
        protected void failed(Throwable e, Description description) {
            if (description != null) {
                builder.append("FAIL : ");
                builder.append(description.getMethodName());
                builder.append("\n");
            }
        }

        @Override
        protected void succeeded(Description description) {
            if (description != null) {
                builder.append("OK  : ");
                builder.append(description.getMethodName());
                builder.append("\n");
            }
        }
    };

    /**
     * Teste verificar símbolos padrões, inserido ao iniciar o sistema
     */
    @Test
    public void testSymbolTable_initialization() {
        assertNotNull("Falha a criar o SymbolTable",table);

        try {
        	org.junit.Assume.assumeNotNull( table.contains("X") );		// ignora test
        } catch(Exception e) {
        	org.junit.Assume.assumeNoException(e);
        }

        try {

            assertTrue("Testando se Tabela de Símbolos CONTÉM R0",table.contains("R0"));
            assertTrue("Verificando se R0 vale 0 na Tabela de Símbolos",table.getAddress("R0")==0);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R1",table.contains("R1"));
            assertTrue("Verificando se R1 vale 1 na Tabela de Símbolos",table.getAddress("R1")==1);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R2",table.contains("R2"));
            assertTrue("Verificando se R2 vale 2 na Tabela de Símbolos",table.getAddress("R2")==2);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R3",table.contains("R3"));
            assertTrue("Verificando se R3 vale 3 na Tabela de Símbolos",table.getAddress("R3")==3);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R4",table.contains("R4"));
            assertTrue("Verificando se R4 vale 4 na Tabela de Símbolos",table.getAddress("R4")==4);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R5",table.contains("R5"));
            assertTrue("Verificando se R5 vale 5 na Tabela de Símbolos",table.getAddress("R5")==5);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R6",table.contains("R6"));
            assertTrue("Verificando se R6 vale 6 na Tabela de Símbolos",table.getAddress("R6")==6);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R7",table.contains("R7"));
            assertTrue("Verificando se R7 vale 7 na Tabela de Símbolos",table.getAddress("R7")==7);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R8",table.contains("R8"));
            assertTrue("Verificando se R8 vale 8 na Tabela de Símbolos",table.getAddress("R8")==8);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R9",table.contains("R9"));
            assertTrue("Verificando se R9 vale 9 na Tabela de Símbolos",table.getAddress("R9")==9);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R10",table.contains("R10"));
            assertTrue("Verificando se R10 vale 10 na Tabela de Símbolos",table.getAddress("R10")==10);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R11",table.contains("R11"));
            assertTrue("Verificando se R11 vale 11 na Tabela de Símbolos",table.getAddress("R11")==11);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R12",table.contains("R12"));
            assertTrue("Verificando se R12 vale 12 na Tabela de Símbolos",table.getAddress("R12")==12);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R13",table.contains("R13"));
            assertTrue("Verificando se R13 vale 13 na Tabela de Símbolos",table.getAddress("R13")==13);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R14",table.contains("R14"));
            assertTrue("Verificando se R14 vale 14 na Tabela de Símbolos",table.getAddress("R14")==14);

            assertTrue("Testando se Tabela de Símbolos CONTÉM R15",table.contains("R15"));
            assertTrue("Verificando se R15 vale 15 na Tabela de Símbolos",table.getAddress("R15")==15);

            assertTrue("Testando se Tabela de Símbolos CONTÉM SCREEN",table.contains("SCREEN"));
            assertTrue("Verificando se SCREEN vale 16384 na Tabela de Símbolos",table.getAddress("SCREEN")==16384);

            assertTrue("Testando se Tabela de Símbolos CONTÉM SP",table.contains("SP"));
            assertTrue("Verificando se SP vale 0 na Tabela de Símbolos",table.getAddress("SP")==0);

            assertTrue("Testando se Tabela de Símbolos CONTÉM LCL",table.contains("LCL"));
            assertTrue("Verificando se LCL vale 1 na Tabela de Símbolos",table.getAddress("LCL")==1);

            assertTrue("Testando se Tabela de Símbolos CONTÉM ARG",table.contains("ARG"));
            assertTrue("Verificando se ARG vale 2 na Tabela de Símbolos",table.getAddress("ARG")==2);

            assertTrue("Testando se Tabela de Símbolos CONTÉM THIS",table.contains("THIS"));
            assertTrue("Verificando se THIS vale 3 na Tabela de Símbolos",table.getAddress("THIS")==3);

            assertTrue("Testando se Tabela de Símbolos CONTÉM THAT",table.contains("THAT"));
            assertTrue("Verificando se THAT vale 4 na Tabela de Símbolos",table.getAddress("THAT")==4);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Teste para adicionar e checar se símbolos já inserido
     */
    @Test
    public void testSymbolTable_addEntry() {

    	try {
    		table.addEntry("X",0);
    		org.junit.Assume.assumeNotNull( table.contains("X") );		// ignora test
        } catch(Exception e) {
        	org.junit.Assume.assumeNoException(e);
        }

        try {

            assertFalse("Testando se Tabela de Símbolos NÃO contém A",table.contains("A"));
            table.addEntry("A",127);
            assertTrue("Testando se Tabela de Símbolos CONTÉM A",table.contains("A"));
            assertTrue("Verificando se A vale 127 na Tabela de Símbolos",table.getAddress("A")==127);

            assertFalse("Testando se Tabela de Símbolos NÃO contém i",table.contains("i"));
            table.addEntry("i",16);
            assertTrue("Testando se Tabela de Símbolos CONTÉM A",table.contains("i"));
            assertTrue("Verificando se i vale 16 na Tabela de Símbolos",table.getAddress("i")==16);

            assertFalse("Testando se Tabela de Símbolos NÃO contém WxYz",table.contains("WxYz"));
            table.addEntry("WxYz",16383);
            assertTrue("Testando se Tabela de Símbolos CONTÉM WxYz",table.contains("WxYz"));
            assertTrue("Verificando se WxYz vale 16 na Tabela de Símbolos",table.getAddress("WxYz")==16383);

            assertFalse("Testando se Tabela de Símbolos NÃO contém _123",table.contains("_123"));
            table.addEntry("_123",123);
            assertTrue("Testando se Tabela de Símbolos CONTÉM _123",table.contains("_123"));
            assertTrue("Verificando se _123 vale 16 na Tabela de Símbolos",table.getAddress("_123")==123);

            assertFalse("Testando se Tabela de Símbolos NÃO contém LOOP",table.contains("LOOP"));
            table.addEntry("LOOP",0);
            assertTrue("Testando se Tabela de Símbolos CONTÉM LOOP",table.contains("LOOP"));
            assertTrue("Verificando se LOOP vale 16 na Tabela de Símbolos",table.getAddress("LOOP")==0);

        } catch(Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Teste para adicionar e checar vários símbolos inseridos
     */
    @Test
    public void testSymbolTable_repetitive() {

    	try {
    		table.addEntry("X",0);
    		org.junit.Assume.assumeNotNull( table.contains("X") );		// ignora test
        } catch(Exception e) {
        	org.junit.Assume.assumeNoException(e);
        }

        try {

            for (int i = 0; i < 16384; i++) {
                table.addEntry("TESTE"+i,0);
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Testando intensamente Tabela de Símbolos",table.contains("TESTE"+i));
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Verificando intensamente existência de Símbolos",table.getAddress("TESTE"+i)==0);
            }

            for (int i = 0; i < 16384; i++) {
                table.addEntry("END"+i,16383);
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Testando intensamente Tabela de Símbolos",table.contains("END"+i));
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Verificando intensamente existência de Símbolos",table.getAddress("END"+i)==16383);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

    }


}
