package pac2.utils;

public class Data {
	
	public String ident;
	public String source;
	public String type;
	public String scope = "Default";
	
	public String toString(){
		return "["+ident+"]\t\t["+source+"]\t["+type+"]\t["+scope+"]\t";
	}
	
	public void clear(){
		ident = "";
		source = "";
		type = "";
		scope = "";
	}

}
