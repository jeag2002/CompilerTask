//http://www.cs.princeton.edu/~appel/modern/java/JLex/current/sample.lex


package pac1;

import java.io.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;

import pac1.parser.scanClass;
import pac1.utils.Yytoken;

public class MainPac1 {
	
	
	
	public static void main(String[] args) throws Exception {
		
		System.out.println("------------------------------------------");
		System.out.println("JLEX parser INI							  ");
		System.out.println("------------------------------------------");
		
		if (args.length == 1){
			FileReader fr_M =  CreateFileReader(new File(args[0]));
			alexico(fr_M);
		}else{
			System.out.println("No hay los parametros necesarios");
		}
		
		
		
		System.out.println("------------------------------------------");
		System.out.println("JLEX parser FIN							  ");
		System.out.println("------------------------------------------");
		
	
	}
	
	public static FileReader CreateFileReader(File aIn) throws Exception{
		
		FileReader fr = null;
		fr = new FileReader(aIn);
		return fr;
		
	}
	
	
	public static void Salida(Yytoken token){
		
		Yytoken etoken = token;
		FileWriter ficherosalida = null;
		PrintWriter printwriter = null;
		
		try{
			
			ficherosalida = new FileWriter("./data/output.txt", true);
			printwriter = new PrintWriter(ficherosalida);
			printwriter.println(token);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ficherosalida.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
			
		}
		
	}
	
	
	public static void alexico(FileReader fichero){
		
		scanClass sampleLex = new scanClass(fichero);
		Yytoken token = null;
		Hashtable factoria;
		int errLex=0;
		
		factoria = new Hashtable();
		
		do{
			try{
				token = sampleLex.nextToken();
			}catch(Exception e){
				token = null;
				e.printStackTrace();
			}
			
			if (token!=null){					
				
				Salida(token);
				
				if (token.getM_compo().trim().equalsIgnoreCase("Palabra")){
					if (factoria.containsKey(token.getM_text())){
						Integer data = (Integer)factoria.get(token.getM_text());
						data = new Integer(data.intValue() + 1);
						factoria.put(token.getM_text(), data);
						
					}else{
						factoria.put(token.getM_text(), new Integer("1"));
					}
				}else if(token.getM_compo().trim().equalsIgnoreCase("Unknow")){
					errLex++;
				}
				
				
			}
			
		}while(token!=null);
		
		
		System.out.println("Errores Lexico " + errLex + "\n\n");
		
		Enumeration en = factoria.keys();
		
		while(en.hasMoreElements()){
			String key = (String)en.nextElement();
			Integer value = (Integer)factoria.get(key);
			System.out.println("#key ["+ key+"] ::= " + value.toString());
			
		}
		
		en = null;
		factoria = null;
		
		
	}
	

}
