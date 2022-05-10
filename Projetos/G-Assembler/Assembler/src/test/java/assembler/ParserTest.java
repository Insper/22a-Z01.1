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

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

import java.util.Arrays;

public class ParserTest {

    Parser parser = null;
    private static StringBuilder builder = new StringBuilder();

    /**
     * Create the test case
     *
     */
    public ParserTest() {
        try {
            parser = new Parser("src/test/resources/testEmpty.nasm");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @AfterClass
    public static void afterClass() throws IOException {
        String logFileName = "logJParser.txt";
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
     * Teste para a instrução commandType
     */
    @Test
    public void testParser_commandType() {

    	try {
    		org.junit.Assume.assumeNotNull( parser.commandType("nop") );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }
    	
        try {
        	
            assertTrue("leaw $0,%A",parser.commandType("leaw $0,%A")==Parser.CommandType.A_COMMAND);
            assertTrue("abc:",parser.commandType("abc:")==Parser.CommandType.L_COMMAND);
            assertTrue("movw %A,%D",parser.commandType("movw %A,%D")==Parser.CommandType.C_COMMAND);

            assertTrue("TESTE:",parser.commandType("TESTE:")==Parser.CommandType.L_COMMAND);
            assertTrue("leaw $100,%A",parser.commandType("leaw $100,%A")==Parser.CommandType.A_COMMAND);
            assertTrue("Z0:",parser.commandType("Z0:")==Parser.CommandType.L_COMMAND);
            assertTrue("movw %D,%A",parser.commandType("movw %D,%A")==Parser.CommandType.C_COMMAND);
            assertTrue("jmp",parser.commandType("jmp")==Parser.CommandType.C_COMMAND);
            assertTrue("nop",parser.commandType("nop")==Parser.CommandType.C_COMMAND);

	    } catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Teste para a instrução label
     */
    @Test
    public void testParser_label() {
    	
        try {

            assertTrue("abc:",parser.label("abc:").equals("abc"));
            assertTrue("TESTE:",parser.label("TESTE:").equals("TESTE"));
            assertTrue("Z0:",parser.label("Z0:").equals("Z0"));
	    	
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
     
    /**
     * Teste para a instrução symbol
     */
    @Test
    public void testParser_symbol() {

    	try {
    		org.junit.Assume.assumeNotNull( parser.symbol("leaw $0,%A") );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }
        try {

	            assertTrue("leaw $0,%A",parser.symbol("leaw $0,%A").equals("0"));
	            assertTrue("leaw $i,%A",parser.symbol("leaw $i,%A").equals("i"));
	            assertTrue("leaw $LOOP,%A",parser.symbol("leaw $LOOP,%A").equals("LOOP"));
	            assertTrue("leaw $12345,%A",parser.symbol("leaw $12345,%A").equals("12345"));
	        
        } catch(Exception e) {
            e.printStackTrace();
        }
    }       

    /**
     * Teste para a instrução instruction
     */
    @Test
    public void testParser_instruction() {

    	try {
    		org.junit.Assume.assumeTrue( parser.instruction("nop") != null );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }
    	
        try {
    	
            assertTrue("leaw $0,%A",Arrays.equals(parser.instruction("leaw $0,%A"),new String[] {"leaw","$0","%A"}));
            assertTrue("leaw $i,%A",Arrays.equals(parser.instruction("leaw $i,%A"),new String[] {"leaw","$i","%A"}));
            assertTrue("leaw $LOOP,%A",Arrays.equals(parser.instruction("leaw $LOOP,%A"),new String[] {"leaw","$LOOP","%A"}));
            assertTrue("leaw $12345,%A",Arrays.equals(parser.instruction("leaw $12345,%A"),new String[] {"leaw","$12345","%A"}));
            assertTrue("movw %A,%D",Arrays.equals(parser.instruction("movw %A,%D"),new String[] {"movw","%A","%D"}));
            assertTrue("movw %D,%A",Arrays.equals(parser.instruction("movw %D,%A"),new String[] {"movw","%D","%A"}));
            assertTrue("jmp",Arrays.equals(parser.instruction("jmp"),new String[] {"jmp"}));
            assertTrue("nop",Arrays.equals(parser.instruction("nop"),new String[] {"nop"}));
            assertTrue("addw %S,%A,%D",Arrays.equals(parser.instruction("addw %S,%A,%D"),new String[] {"addw","%S","%A","%D"}));
            assertTrue("decw %A",Arrays.equals(parser.instruction("decw %A"),new String[] {"decw","%A"}));
            assertTrue("decw %D",Arrays.equals(parser.instruction("decw %D"),new String[] {"decw","%D"}));
            assertTrue("notw %S",Arrays.equals(parser.instruction("notw %S"),new String[] {"notw","%S"}));
            assertTrue("notw %D",Arrays.equals(parser.instruction("notw %D"),new String[] {"notw","%D"}));
            assertTrue("negw %A",Arrays.equals(parser.instruction("negw %A"),new String[] {"negw","%A"}));
            assertTrue("negw %D",Arrays.equals(parser.instruction("negw %D"),new String[] {"negw","%D"}));
          
        } catch(Exception e) {
            e.printStackTrace();
        }

    }  

    /**
     * Teste para a instrução instruction
     */
    @Test
    public void testParser_advance() {
    	
    	try {
    		Parser parser_testEmpty = new Parser("src/test/resources/testEmpty.nasm");
    		org.junit.Assume.assumeNotNull( parser_testEmpty.advance() );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }
    	
        try {
    	
            Parser parser_testLeaw = new Parser("src/test/resources/testLeaw.nasm");
            assertTrue("Parser advance()",parser_testLeaw.advance());
            assertTrue("Parser leaw $0,%A",parser_testLeaw.command().equals("leaw $0,%A"));
            assertTrue("Parser advance()",parser_testLeaw.advance());
            assertTrue("Parser leaw $1,%A",parser_testLeaw.command().equals("leaw $1,%A"));
            assertTrue("Parser advance()",parser_testLeaw.advance());
            assertTrue("Parser leaw $2,%A",parser_testLeaw.command().equals("leaw $2,%A"));
            assertTrue("Parser advance()",parser_testLeaw.advance());
            assertTrue("Parser leaw $R0,%A",parser_testLeaw.command().equals("leaw $R0,%A"));
            assertTrue("Parser advance()",parser_testLeaw.advance());
            assertTrue("Parser leaw $R1,%A",parser_testLeaw.command().equals("leaw $R1,%A"));
            assertTrue("Parser advance()",parser_testLeaw.advance());
            assertTrue("Parser leaw $R2,%A",parser_testLeaw.command().equals("leaw $R2,%A"));
            assertFalse("Parser advance()",parser_testLeaw.advance());


            Parser parser_testJump = new Parser("src/test/resources/testJump.nasm");
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser jmp",parser_testJump.command().equals("jmp"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser nop",parser_testJump.command().equals("nop"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser jne",parser_testJump.command().equals("jne"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser nop",parser_testJump.command().equals("nop"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser je",parser_testJump.command().equals("je"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser nop",parser_testJump.command().equals("nop"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser jge",parser_testJump.command().equals("jge"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser jg",parser_testJump.command().equals("jg"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser jle",parser_testJump.command().equals("jle"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser jl",parser_testJump.command().equals("jl"));
            assertTrue("Parser advance()",parser_testJump.advance());
            assertTrue("Parser jmp",parser_testJump.command().equals("jmp"));
            assertFalse("Parser advance()",parser_testJump.advance());

            Parser parser_testComp = new Parser("src/test/resources/testComp.nasm");
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser movw %A,%D",parser_testComp.command().equals("movw %A,%D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser addw %A,%D,%D",parser_testComp.command().equals("addw %A,%D,%D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser movw %D,%A",parser_testComp.command().equals("movw %D,%A"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser movw %D,(%A)",parser_testComp.command().equals("movw %D,(%A)"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser incw %D",parser_testComp.command().equals("incw %D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser nop",parser_testComp.command().equals("nop"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser movw (%A),%D",parser_testComp.command().equals("movw (%A),%D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser addw (%A),%D,%D",parser_testComp.command().equals("addw (%A),%D,%D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser subw %D,(%A),%A",parser_testComp.command().equals("subw %D,(%A),%A"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser rsubw %D,(%A),%A",parser_testComp.command().equals("rsubw %D,(%A),%A"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser decw %A",parser_testComp.command().equals("decw %A"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser decw %D",parser_testComp.command().equals("decw %D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser notw %A",parser_testComp.command().equals("notw %A"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser notw %D",parser_testComp.command().equals("notw %D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser negw %A",parser_testComp.command().equals("negw %A"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser negw %D",parser_testComp.command().equals("negw %D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser andw (%A),%D,%D",parser_testComp.command().equals("andw (%A),%D,%D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser andw %D,%A,%A",parser_testComp.command().equals("andw %D,%A,%A"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser orw (%A),%D,%D",parser_testComp.command().equals("orw (%A),%D,%D"));
            assertTrue("Parser advance()",parser_testComp.advance());
            assertTrue("Parser orw %D,%A,%A",parser_testComp.command().equals("orw %D,%A,%A"));

        } catch(Exception e) {
            e.printStackTrace();
        }

    }  

}
