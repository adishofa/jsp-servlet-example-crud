package com.mitrais.rms.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class Link extends SimpleTagSupport {
	private String href;
	private String type;
	
	public void doTag() throws JspException, IOException {
		PageContext pageContext = (PageContext) getJspContext();
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		String relLink = request.getContextPath()+"/"+this.href;
		JspWriter out = getJspContext().getOut();
		out.println("<link rel=\""+type+"\" href=\""+relLink+"\">");
	}
    
    public void setHref(String href) {
    	this.href = href;
    }
    public void setType(String type) {
    	this.type = type;
    }
    
    public String getHref() {
    	return href;
    }
    public String getType() {
    	return type;
    }
    
}
