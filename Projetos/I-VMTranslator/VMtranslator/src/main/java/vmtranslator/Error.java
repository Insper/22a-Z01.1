/**
 * Curso: Elementos de Sistemas
 * Arquivo: Error.java
 * Created by Luciano Soares <lpsoares@insper.edu.br> 
 * Date: 2/05/2017
 *
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */
package vmtranslator;

class Error {
    public static void error(String message) {
        System.err.println("Erro: " + message);
    }
}
