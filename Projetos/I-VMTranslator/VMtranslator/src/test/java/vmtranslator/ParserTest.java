/**
 * Curso: Elementos de Sistemas
 * Arquivo: ParserTest.java
 * Created by Luciano Soares <lpsoares@insper.edu.br> 
 * Date: 2/05/2017
 */

package vmtranslator;

import org.junit.Test;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;

import vmtranslator.Parser;

public class ParserTest {

	Parser parser = null;

	/**
	 * Create the test case
	 *
	 */
	public ParserTest() {
		try {
			parser = new Parser("src/test/resources/SimpleAdd.vm");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Teste para a instrução commandType
	 */
	@Test
	public void testParser_advance() {

		try {

			parser = new Parser("src/test/resources/SimplePushAdd.vm");

			assertTrue(parser.advance() == true);
			assertTrue(parser.command().equals("push constant 5"));
			assertTrue(parser.advance() == true);
			assertTrue(parser.command().equals("push constant 9"));
			assertTrue(parser.advance() == true);
			assertTrue(parser.command().equals("add"));
			assertTrue(parser.advance() == false);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	/**
	 * Teste para a instrução commandType
	 */
	@Test
	public void testParser_commandType() {

		try {
			org.junit.Assume.assumeNotNull( parser.commandType("push constant 0") ); // ignora test
		} catch(Exception e) { 
			org.junit.Assume.assumeNoException(e);
		}
		
		try {
			
			assertTrue("add",parser.commandType("add")==Parser.CommandType.C_ARITHMETIC);
			assertTrue("push constant 0",parser.commandType("push constant 0")==Parser.CommandType.C_PUSH);
			assertTrue("pop temp 0",parser.commandType("pop temp 0")==Parser.CommandType.C_POP);
			assertTrue("label LOOP",parser.commandType("label LOOP")==Parser.CommandType.C_LABEL);
			assertTrue("goto LOOP",parser.commandType("goto LOOP")==Parser.CommandType.C_GOTO);
			assertTrue("if-goto LOOP",parser.commandType("if-goto LOOP")==Parser.CommandType.C_IF);
			assertTrue("function Sys.init 0",parser.commandType("function Sys.init 0")==Parser.CommandType.C_FUNCTION);
			assertTrue("return",parser.commandType("return")==Parser.CommandType.C_RETURN);
			assertTrue("call Sys.init 0",parser.commandType("call Sys.init 0")==Parser.CommandType.C_CALL);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Teste para a instrução arg1
	 */
	@Test
	public void testParser_arg1() {
		
		try {
			org.junit.Assume.assumeNotNull( parser.arg1("push constant 0") );		// ignora test
		} catch(Exception e) { 
			org.junit.Assume.assumeNoException(e);
		}
		
		try {

			assertTrue("add",parser.arg1("add").equals("add"));
			assertTrue("sub",parser.arg1("sub").equals("sub"));
			assertTrue("neg",parser.arg1("neg").equals("neg"));
			assertTrue("eq",parser.arg1("eq").equals("eq"));
			assertTrue("gt",parser.arg1("gt").equals("gt"));
			assertTrue("lt",parser.arg1("lt").equals("lt"));
			assertTrue("and",parser.arg1("and").equals("and"));
			assertTrue("or",parser.arg1("or").equals("or"));
			assertTrue("not",parser.arg1("not").equals("not"));

			assertTrue("push constant 0",parser.arg1("push constant 0").equals("constant"));
			assertTrue("push constant 1234",parser.arg1("push constant 1234").equals("constant"));
			assertTrue("push local 2",parser.arg1("push local 2").equals("local"));
			assertTrue("pop temp 3",parser.arg1("pop temp 3").equals("temp"));
			assertTrue("pop argument 5",parser.arg1("pop argument 5").equals("argument"));
			assertTrue("pop this 100",parser.arg1("pop this 100").equals("this"));
			assertTrue("push that 200",parser.arg1("push that 200").equals("that"));
			assertTrue("push pointer 0",parser.arg1("push pointer 0").equals("pointer"));
			assertTrue("push pointer 1",parser.arg1("push pointer 1").equals("pointer"));
			assertTrue("pop pointer 0",parser.arg1("pop pointer 0").equals("pointer"));
			assertTrue("pop pointer 1",parser.arg1("pop pointer 1").equals("pointer"));
			assertTrue("pop static 1",parser.arg1("pop static 1").equals("static"));
			assertTrue("push static 3",parser.arg1("push static 3").equals("static"));

			assertTrue("function Sys.init 0",parser.arg1("function Sys.init 0").equals("Sys.init"));
			assertTrue("call Sys.init 0",parser.arg1("call Sys.init 0").equals("Sys.init"));
			assertTrue("function Soma 2",parser.arg1("function Soma 2").equals("Soma"));
			assertTrue("call Soma 2",parser.arg1("call Soma 2").equals("Soma"));

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	 
	/**
	 * Teste para a instrução arg2
	 */
	@Test
	public void testParser_arg2() {

		try {
			org.junit.Assume.assumeNotNull( parser.arg2("push constant 0") );		// ignora test
		} catch(Exception e) { 
			org.junit.Assume.assumeNoException(e);
		}
		try {

			assertTrue("push constant 0",parser.arg2("push constant 0") == 0 );
			assertTrue("push constant 1234",parser.arg2("push constant 1234") == 1234 );
			assertTrue("push local 2",parser.arg2("push local 2") == 2 );
			assertTrue("pop temp 3",parser.arg2("pop temp 3") == 3 );
			assertTrue("pop argument 5",parser.arg2("pop argument 5") == 5 );
			assertTrue("pop this 100",parser.arg2("pop this 100") == 100 );
			assertTrue("push that 200",parser.arg2("push that 200") == 200 );
			assertTrue("push pointer 0",parser.arg2("push pointer 0") == 0 );
			assertTrue("push pointer 1",parser.arg2("push pointer 1") == 1 );
			assertTrue("pop pointer 0",parser.arg2("pop pointer 0") == 0 );
			assertTrue("pop pointer 1",parser.arg2("pop pointer 1") == 1 );
			assertTrue("pop static 1",parser.arg2("pop static 1") == 1 );
			assertTrue("push static 3",parser.arg2("push static 3") == 3 );

			assertTrue("function Sys.init 0",parser.arg2("function Sys.init 0") == 0 );
			assertTrue("call Sys.init 0",parser.arg2("call Sys.init 0") == 0 );
			assertTrue("function Soma 2",parser.arg2("function Soma 2") == 2 );
			assertTrue("call Soma 2",parser.arg2("call Soma 2") == 2 );
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}       

}