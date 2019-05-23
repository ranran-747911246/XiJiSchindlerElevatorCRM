<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/html-table.tld" prefix="table"%>
<link rel="stylesheet" type="text/css" href="<html:rewrite forward='formCSS'/>">
<script language="javascript" defer="defer" src="<html:rewrite forward='DatePickerJS'/>"></script>
<html:errors />
<br>
<html:form action="/ServeTable.do">
<html:hidden property="property(genReport)" styleId="genReport" />
  <table>
    <tr>
    <td>       
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ˮ��:
      </td>
      <td>
        <html:text property="property(billno)" styleClass="default_input" />
      </td> 
        <td>      
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������:
      </td>
      <td>
        <html:text property="property(attn)"  styleClass="default_input" />
      </td>
      <td>      
        &nbsp;&nbsp;�ҷ���λ����:
      </td>
      <td>
        <html:text property="property(companyname)" size="30" styleClass="default_input" />
      </td>          
    </tr>
    <tr> 
         <td>       
      &nbsp;&nbsp;ά�ĺ�ͬ��:
      </td>
      <td>
        <html:text property="property(MaintContractNo)" styleClass="default_input" />
      </td> 
       <td>       
      &nbsp;&nbsp;ί�к�ͬ��:
      </td>
      <td>
        <html:text property="property(outContractNo)" styleClass="default_input" />
      </td> 
                       
      <td>       
        &nbsp;&nbsp;<bean:message key="maintContract.maintDivision" />:
      </td>
      <td>
        <html:select property="property(maintDivision)">
		  <html:options collection="maintDivisionList" property="grcid" labelProperty="grcname"/>
        </html:select>
      </td>      
    </tr>
    <tr>
      <td >&nbsp;&nbsp;&nbsp;&nbsp;ҵ�����:</td>
      <td >
      <html:select property="property(busType)">
      <html:option value="%">ȫ��</html:option>
      <html:option value="W">ά��</html:option>
      <html:option value="G">����</html:option>
      </html:select>
      </td> 
      <td> 
       &nbsp;&nbsp;&nbsp;&nbsp;���״̬:
      </td>
      <td>
        <html:select property="property(auditStatus)">
          <html:option value="%">ȫ��</html:option>
		  <html:option value="Y">�����</html:option>
		  <html:option value="N">δ���</html:option>
        </html:select>
      </td>
    </tr>
  </table>
  <br>
  <table:table id="guiOutsourcingContract" name="outsourcingContractAuditList">
    <logic:iterate id="element" name="outsourcingContractAuditList">
      <table:define id="c_cb">
        <html:hidden name="element" property="billno"/>
        <html:radio property="checkBoxList(ids)" styleId="ids" value="${element.billno}" />
        <html:hidden name="element" property="submitType"/>
        <html:hidden name="element" property="auditStatus"/>
      </table:define>
      <table:define id="c_billNo">
        <a href="<html:rewrite page='/outsourcingContractAuditAction.do'/>?method=toDisplayRecord&id=<bean:write name="element"  property="billno"/>">
          <bean:write name="element" property="billno" />
        </a>
      </table:define>
      <table:define id="c_maintContractNo">
          <bean:write name="element" property="maintContractNo" />
      </table:define>
      <table:define id="c_attn">
        <bean:write name="element" property="attn" />
      </table:define>
      <table:define id="c_busType">
        <bean:write name="element" property="busType" />
      </table:define>
      <table:define id="c_signingDate">
        <bean:write name="element" property="signingDate" />
      </table:define>
      <table:define id="c_submitType">
        <bean:write name="element" property="submitType" />
      </table:define>
      <table:define id="c_auditStatus">
        <bean:write name="element" property="auditStatus" />
      </table:define>
      <table:define id="c_maintDivision">
        <bean:write name="element" property="maintDivision" />
      </table:define>
      <table:define id="c_companyId">
        <bean:write name="element" property="companyId" />
      </table:define>
      
      <table:define id="c_outContractNo">
        <bean:write name="element" property="outContractNo" />
      </table:define>
      <table:tr />
    </logic:iterate>
  </table:table>
</html:form>