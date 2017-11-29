package pac3.utils;

import java.io.*;
import java.util.*;

public class Data {
	
	public String ident;
	public String source;
	public String type;
	public String scope = "Default";
	public int id = 0;
	
	public String toString(){
		String data = String.format("%10s\t(%10s\t%10s\t%10s\t%10s)",ident,ident,source,type,scope);
		return data;
	}
	
	public void clear(){
		ident = "";
		source = "";
		type = "";
		scope = "";
		id = 0;
	}
	
	@Override
	public boolean equals(Object o) {
	    
		boolean ret = false;
		Data datAux = (Data)o;
		
		if (!this.scope.equals("Default") 
			&& !this.scope.equals("Public") 
			&& !this.scope.equals("Private") 
			&& !datAux.scope.equals("Default") 
			&& !datAux.scope.equals("Public")
			&& !datAux.scope.equals("Private")){
			
				//detecta 
				if (this.scope.equals(datAux.scope)){
					
					//dentro de la misma funcion?
					if (this.id==datAux.id){
						
						if ((this.source == "Parameter") && (datAux.source == "Parameter")){
							ret = (this.ident.equals(datAux.ident));
							if (ret){
								System.out.println("Error Semantico: Detectado Parametro duplicado ["+ this.ident +"] en constructor [" + this.scope + "]");
							}
							
						}else if ((this.source == "Variable") && (datAux.source == "Variable")){
							ret = (this.ident.equals(datAux.ident));
							if (ret){
								System.out.println("Error Semantico: Detectada Variable duplicada [" + this.ident + "] en constructor [" + this.scope + "]");
							}
							
						}else if (((this.source == "Variable") && (datAux.source == "Parameter")) ||
								 ((this.source == "Parameter") && (datAux.source == "Variable"))){
							
							ret = (this.ident.equals(datAux.ident));
							if (ret){
								System.out.println("Error Semantico: Detectada Definicion Parametro-Variable duplicada [" + this.ident + "] en constructor [" + this.scope +"]");
							}
						}
						
					}else{
						if ((this.source == "CONSTRUCTOR") && (datAux.source == "CONSTRUCTOR")){
								if (this.ident.equals(datAux.ident)){
									ret = (this.type.equals(datAux.type));
									if (ret){
										System.out.println("Error Semantico: Detectada Funcion duplicada! [" + this.ident + "(" + (this.type.equals("-")? "NULL" : this.type) + ") ]");
									}
								}
						} else if ((this.source == "Parameter") && (datAux.source == "Parameter")){
							if (this.type.equals(datAux.type)){
								ret = (this.scope.equals(datAux.scope));
							}
						}
					}
			}
			
		}else{
			
			ret = (this.ident.equals(datAux.ident));
			if (ret){
				System.out.println("Error Semantico: Detectada Definicion Atributo duplicada! ["+this.ident+"]");
			}
		}

		return ret;
	}
}
	
	
