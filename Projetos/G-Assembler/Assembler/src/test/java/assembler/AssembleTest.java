package assembler;

import org.junit.Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import static org.junit.Assert.*;
import static org.junit.Assert.assertTrue;

public class AssembleTest {

    Assemble assembler = null;
    private String inFile  = "src/test/resources/isEven.nasm";
    private String outFile = "src/test/resources/isEven.hack";

    public AssembleTest() {
        try {
            // Cria objeto assembler auxiliar
            assembler = new Assemble(inFile, outFile, false );
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void fillSymbolTable() throws IOException {
        // Cria tabela de símbolos
        SymbolTable table = assembler.fillSymbolTable();
        assertTrue("R1",table.contains("R1")==true);
        assertTrue("$impar",table.contains("impar")==true);
        assertTrue("$impar",table.getAddress("impar")==12);
        assertTrue("$par",table.contains("par")==true);
        assertTrue("$par",table.getAddress("par")==2);
        assertTrue("$end",table.contains("end")==true);
        assertTrue("$end",table.getAddress("end")==14);
    }

    @Test
    public void generateMachineCode() throws IOException {
       // SymbolTable table = assembler.fillSymbolTable();
        SymbolTable table = assembler.fillSymbolTable();

        assembler.generateMachineCode();
        assembler.close();
        BufferedReader fileReader = new BufferedReader(new FileReader(outFile));
        assertEquals(fileReader.readLine(),"000000000000000101"); // leaw $5, %A
        assertEquals(fileReader.readLine(),"100011100000010000"); // movw (%A), %D
        assertEquals(fileReader.readLine(),"000000000000000001"); // leaw $1, %A
        assertEquals(fileReader.readLine(),"100000000000010000"); // andw %A, %D, %D
        assertEquals(fileReader.readLine(),"000000000000001100"); // leaw $impart, %A
        assertEquals(fileReader.readLine(),"100000011000000001"); // jg
        fileReader.readLine(); // nop "100000000000000000"
        assertEquals(fileReader.readLine(),"000000000000000000"); // leaw $0, %A
        assertEquals(fileReader.readLine(),"100001111110100000"); // movw $1, ($A)
        assertEquals(fileReader.readLine(),"000000000000001110"); // leaw $impart, %A
        assertEquals(fileReader.readLine(),"100000011000000111"); // jg
        fileReader.readLine(); // nop "100000000000000000"
        assertEquals(fileReader.readLine(),"000000000000000000"); // leaw $0, %A
        assertEquals(fileReader.readLine(),"100001010100100000"); // movw $1, ($A)
    }
}
