<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page import="com.gzunicorn.common.util.SysConfig" %>

<script language="javascript" defer="defer" src="<html:rewrite forward='DatePickerJS'/>"></script>
<script language="javascript" src="<html:rewrite page="/common/javascript/checkinput.js"/>"></script>
<script language="javascript" src="<html:rewrite page="/common/javascript/dynamictable.js"/>"></script>
<script language="javascript" src="<html:rewrite page="/common/javascript/openwindow.js"/>"></script>

<script language="javascript">

//关于ToolBar
function CreateToolBar(){
  SetToolBarHandle(true);
  SetToolBarHeight(20);

  <logic:equal name="typejsp" value="Yes">
    AddToolBarItemEx("SaveSubmitBtn","../../common/images/toolbar/close.gif","","",'关闭',"60","0","window.close()");
  </logic:equal>
  <logic:notPresent name="typejsp">
    AddToolBarItemEx("ReturnBtn","../../common/images/toolbar/back.gif","","",'<bean:message key="toolbar.return"/>',"65","0","returnMethod()");
  </logic:notPresent>
  <logic:notPresent name="display">  
	  <%-- 是否有可写的权限--%>
	  <logic:equal name="<%=SysConfig.TOOLBAR_RIGHT%>" property="naccountspayablemanage" value="Y"> 
	    AddToolBarItemEx("SaveBtn","../../common/images/toolbar/save.gif","","",'<bean:message key="toolbar.save"/>',"65","1","saveMethod()");   
	    <logic:notPresent name="Backfill">
	      AddToolBarItemEx("SaveReturnBtn","../../common/images/toolbar/save.gif","","",'保存并提交',"100","1","saveReturnMethod()");
	    </logic:notPresent>
	  </logic:equal>
  </logic:notPresent>
  
  window.document.getElementById("toolbar").innerHTML=GenToolBar("TabToolBar_Manage","TextToolBar_Black","Style_Over","Style_Out","Style_Down","Style_Check");

}
//返回
function returnMethod(){
  window.location = '<html:rewrite page="/accountsPayableManageSearchAction.do"/>?method=toSearchRecord';
}


//保存
function saveMethod(){
  if(checkColumnInput(accountsPayableManageForm)){
  	
	  if(document.getElementById("preMoney")!=null && !isNaN(document.getElementById("preMoney").value)){
		  if(parseFloat(document.getElementById("preMoney").value)<=${noBuiltReceivables}){
		  	var zero=0;
		  	if(zero!=${noBuiltReceivables}){
			  document.accountsPayableManageForm.isreturn.value = "N";
			  document.accountsPayableManageForm.submitType.value = "N";
			  document.accountsPayableManageForm.submit();
			  }else{
		    	alert("该记录已经没有未建应付款金额！");
		    }
		  }else{
			  alert("应付款金额不能大于未建应付款金额！");
		  }
	  }else{
		  alert("应付款金额只能输入数字！");
	  }


    
  }
  
}

//保存返回
function saveReturnMethod(){
	var c = document.accountsPayableManageForm.money;
	if(c.value!=""&&c.value!=null){
	 if(isNaN(c.value))
	 {
		var tile="应付款金额必须为小数或整数";
		  alert(tile);
		  return;
	 }
	}
  inputTextTrim();  
  if(checkColumnInput(accountsPayableManageForm)){
      document.accountsPayableManageForm.isreturn.value = "N";
      document.accountsPayableManageForm.submitType.value = "Y";
      document.accountsPayableManageForm.submit();
    } 
}

function judgePreMoney(object,receivables){
	var objv=object.value.substring(0,object.value.length-1);
	if(!isNaN(object.value)){
		if(parseFloat(object.value)>receivables){
			alert("应收款金额不能大于未建应收款金额！");
			object.value=0;
		}
	}else{
		alert("应收款金额只能输入数字！");
		object.value=0;
	}
}


function f_check_number3(){
    if((event.keyCode>=48 && event.keyCode<=57) || event.keyCode==46 ){
    }else{
    event.keyCode=0;
     }
 }
</script>

  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="22" class="table_outline3" valign="bottom" width="100%">
            <div id="toolbar" align="center">
            <script language="javascript">
              CreateToolBar();
            </script>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>