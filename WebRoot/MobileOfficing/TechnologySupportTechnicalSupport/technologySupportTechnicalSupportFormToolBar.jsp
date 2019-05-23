<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page import="com.gzunicorn.common.util.SysConfig"%>

<script language="javascript">

//����ToolBar
function CreateToolBar(){
  SetToolBarHandle(true);
  SetToolBarHeight(20);

  AddToolBarItemEx("ReturnBtn","../../common/images/toolbar/back.gif","","",'<bean:message key="toolbar.return"/>',"65","0","returnMethod()");
  <logic:notPresent name="display">  
  <%-- �Ƿ��п�д��Ȩ��--%>
  <logic:equal name="<%=SysConfig.TOOLBAR_RIGHT%>" property="ntechnologysupporttechnicalsupport" value="Y"> 
    //AddToolBarItemEx("SaveBtn","../../common/images/toolbar/save.gif","","",'<bean:message key="toolbar.save"/>',"65","1","saveMethod()");
    AddToolBarItemEx("SaveReturnBtn","../../common/images/toolbar/save_back.gif","","",'<bean:message key="toolbar.returnsave"/>',"80","1","saveReturnMethod()");
  </logic:equal>
  </logic:notPresent>
  window.document.getElementById("toolbar").innerHTML=GenToolBar("TabToolBar_Manage","TextToolBar_Black","Style_Over","Style_Out","Style_Down","Style_Check");
}

//ȥ���ո�
String.prototype.trim = function(){return this.replace(/(^\s*)|(\s*$)/g,"");}

//����
function returnMethod(){
  window.location = '<html:rewrite page="/technologySupportTechnicalSupportSearchAction.do"/>?method=toSearchRecord';
}

//����
function saveMethod(){
  document.technologySupportTechnicalSupportForm.isreturn.value = "N";
  document.technologySupportTechnicalSupportForm.submit();
}

//���淵��
function saveReturnMethod(){
	var msprocessRem=document.getElementById("tsprocessRem").value;
	if(msprocessRem.trim()==""){
		alert("������� ���");
		return;
	}
	
	document.technologySupportTechnicalSupportForm.isreturn.value = "Y";
    document.technologySupportTechnicalSupportForm.submit();
}

//������֤
function checkForm(){  
  var object = document.principalForm; //ָ����������
  for ( var i = 0; i < object.length; i++ ) {
    var value = object[i].value;
    var name = object[i].name; 
    
    if(name == "principalId"){
      if(value == null || value == ''){
        alert("�����˴��벻��Ϊ�գ�");
        return false;      
      }
    }
    
    if(name == "principalName"){
      if(value == null || value == ''){
        alert("���������Ʋ���Ϊ�գ�");    
        return false;      
      }        
    }
    
    if(name == "phone"){
      if(value == null || value == ''){
        alert("�����˵绰����Ϊ�գ�");
        return false;      
      }    
    }    
    
  }
  return true;
}

//����
function downloadFile(id){
	var uri = '<html:rewrite page="/technologySupportTechnicalSupportAction.do"/>?method=toDownLoadFiles';
		uri +='&filesid='+ id;
		uri +='&folder=TechnologySupport.file.upload.folder';
	window.location = uri;
	//window.open(url);
}

var XMLHttpReq = false;
//����XMLHttpRequest����       
function createXMLHttpRequest() {
if(window.XMLHttpRequest) { //Mozilla �����
XMLHttpReq = new XMLHttpRequest();
}else if (window.ActiveXObject) { // IE�����
XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
}
}

//����������
function sendRequestDelFile(url) {
createXMLHttpRequest();
XMLHttpReq.open("post", url, true);
XMLHttpReq.onreadystatechange = processResponseDelFile;//ָ����Ӧ����
XMLHttpReq.send(null);  // ��������
}
// ����������Ϣ����

  function processResponseDelFile() {
   	if (XMLHttpReq.readyState == 4) { // �ж϶���״̬
       	if (XMLHttpReq.status == 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ        	
       	
          	var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;	
          	//document.getElementById("messagestring").innerHTML=res;
          	if(res=="Y"){
          		tbs.parentElement.parentElement.removeChild(tbs.parentElement);
          		partitionGrade();
          	}else{
          		alert("ɾ��ʧ�ܣ�");
          	}        	
          	//alert(document.getElementById("messagestring").innerHTML+";123");
       	} else { //ҳ�治����
             window.alert("���������ҳ�����쳣��");
       	}
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