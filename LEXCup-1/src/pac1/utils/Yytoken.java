package pac1.utils;

public class Yytoken {
	
	public int m_numToken;
	public String m_text;
	public int m_line;
	public String m_compo;
	public int m_charBegin;
	
	
	public int getM_numToken() {
		return m_numToken;
	}


	public void setM_numToken(int m_numToken) {
		this.m_numToken = m_numToken;
	}


	public String getM_text() {
		return m_text;
	}


	public void setM_text(String m_text) {
		this.m_text = m_text;
	}


	public int getM_line() {
		return m_line;
	}


	public void setM_line(int m_line) {
		this.m_line = m_line;
	}


	public String getM_compo() {
		return m_compo;
	}


	public void setM_compo(String m_compo) {
		this.m_compo = m_compo;
	}


	public int getM_charBegin() {
		return m_charBegin;
	}


	public void setM_charBegin(int m_charBegin) {
		this.m_charBegin = m_charBegin;
	}
	

	public Yytoken(int numToken,String text,String compo,int line,int charBegin){
		
		this.m_numToken = numToken;
		this.m_text = text;
		this.m_compo = compo;
		this.m_line = line;
		this.m_charBegin = charBegin;
	}
	
	
	public String toString(){
		
		return "Token #"+this.m_numToken+" : "+m_text+" CLexico "+m_compo+" Line: "+m_line+" Column: "+m_charBegin;
		
	}
	
}
