<%@ page language="C#" autoeventwireup="true" inherits="management_frm_SendParameterForSMS, App_Web_5uqmplyf" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
    
    //--------New Part Developed By Goutam Das ------------------
          
     groupvalue="";
     Mainvalue=""; 
       FieldName="btnEmail";
        function Page_Load()
        {
         document.getElementById('TdFilter').style.display='none';
	     document.getElementById('TdSelect').style.display='none';
	     document.getElementById('TdFilter1').style.display='none';
	   //  document.getElementById('TrForGroup').style.display='none';
        }
        
        
        function fngrouptype(obj)
        {
       
          if(obj=="0")
            {
             document.getElementById('td_allselect').style.display='none';               
             alert('Please Select Group Type !');
            }
            else
            {
             document.getElementById('td_allselect').style.display='inline';               
            }
        }
        
        function btnAddsubscriptionlist_click()
        {
       
            var userid = document.getElementById('txtsubscriptionID');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtsubscriptionID_hidden');
                var listBox = document.getElementById('lstSuscriptions');
                var tLength = listBox.length;
                //alert(tLength);
                
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtsubscriptionID');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtsubscriptionID');
            s.focus();
            s.select();
        }  
        function btnRemovefromsubscriptionlist_click()
        {
            
            var listBox = document.getElementById('lstSuscriptions');
            var tLength = listBox.length;
            
            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++) 
            {
                if (listBox.options[i].selected && listBox.options[i].value != "") 
                {
                    
                }
                else 
                {
                    arrLookup[listBox.options[i].text] = listBox.options[i].value;
                    arrTbox[j] = listBox.options[i].text;
                    j++;
                }
            }
            listBox.length = 0;
            for (i = 0; i < j; i++) 
            {
                var no = new Option();
                no.value = arrLookup[arrTbox[i]];
                no.text = arrTbox[i];
                listBox[i]=no;
            }
        }
        
         function FunClientScrip(objID,objListFun,objEvent)
        {
              var cmbVal;
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
                {
                    if(document.getElementById('rdbranchAll').checked==true)
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Branch';
                           cmbVal=cmbVal+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value+'~'+Mainvalue;
                       }
                   else
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Branch';
                           cmbVal=cmbVal+'~'+'Selected'+'~'+groupvalue+'~'+Mainvalue;
                       }
                }
               else //////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Group';
                           cmbVal=cmbVal+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value+'~'+Mainvalue;
                       }
                   else
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Group';
                           cmbVal=cmbVal+'~'+'Selected'+'~'+groupvalue+'~'+Mainvalue;
                       }
               }
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value+'~'+Mainvalue;
            }
        
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);
        }
        
        
        function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('lstSuscriptions');
	        var cmb= document.getElementById('cmbsearchOption');
            var listIDs='';
            var i;
            if(listBoxSubs.length > 0)
            {                
                for(i=0;i<listBoxSubs.length;i++)
                {
                    if(listIDs == '')
                        listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                    else
                        listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                }
                var sendData = cmb.value + '~' + listIDs;
                CallServer(sendData,"");
            }
	        var i;
            for(i=listBoxSubs.options.length-1;i>=0;i--)
            {
                listBoxSubs.remove(i);
            }
            document.getElementById('TdFilter').style.display='none';
	        document.getElementById('TdSelect').style.display='none';
	        document.getElementById('TdFilter1').style.display='none';
	        
	    }
	    
	       
	    function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
            if(Data[0]=='Group')
            {
                groupvalue=Data[1];
                document.getElementById('HdnGroup').value=Data[1];
            }
            if(Data[0]=='Branch')
            {
                groupvalue=Data[1];
                document.getElementById('HdnBranchId').value=Data[1];
                 var btn = document.getElementById('btnhide');
                 btn.click();                 
            }  
            if(Data[0]=='Clients')
            {
                document.getElementById('HdnClients').value=Data[1];
            }  
        } 
        
          function AllSelct(obj,obj1)
          {
            var FilTer=document.getElementById('cmbsearchOption');
            if(obj!='a')
            {
                if(obj1=='C')
                    FilTer.value='Clients';
                else if(obj1=='B')    
                    FilTer.value='Branch';
                else if(obj1=='G')    
                   FilTer.value='Group';
                else if(obj1=='S')    
                    FilTer.value='Segment';
                document.getElementById('TdFilter').style.display='inline';
                document.getElementById('TdFilter1').style.display='inline';
                document.getElementById('TdSelect').style.display='inline';
            }
            else
            {
             document.getElementById('TdFilter').style.display='none';
             document.getElementById('TdFilter1').style.display='none';
             document.getElementById('TdSelect').style.display='none';
            }
           
          }
          
          function  fnddlGroup(obj)
           {
                if(obj=="0")
                {
                    document.getElementById('td_group').style.display='none';
                    document.getElementById('td_branch').style.display='inline';
                }
                else
                {
                    document.getElementById('td_group').style.display='inline';
                    document.getElementById('td_branch').style.display='none';
                    var btn = document.getElementById('btnhide');
                    btn.click();
                }
           }
    
    //--------New Part Developed By Goutam Das ------------------
    
function Trim(str)//Function use for checking the values
{
    while (str.substring(0,1) == ' ') // check for white spaces from beginning
    {
        str = str.substring(1, str.length);
    }
    while (str.substring(str.length-1, str.length) == ' ') // check white space from end
    {
        str = str.substring(0,str.length-1);
    }
   
    return str;
}

    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function DisplayCode(obj)
    {

     var btn = document.getElementById('btnEmail');
                 btn.click();   
       AccIDClient.SetValue(obj);
       ClearAll();
       HideAll();
       var AccPartsOpt=obj.split('[');
       var AccParts=obj.split('(');
      
       if(AccPartsOpt.length>1)
       {
            AccIDClient1.SetValue(AccPartsOpt[0]);
            DisplayCodeForOptional(obj);//CALLING FUNCTION FOR OPTIONAL PARAMETERS
       }
       if(AccParts.length>1)
       {
//         
            AccIDClient1.SetValue(AccParts[0]);
            DisplayCodeForMandatory(obj);//CALLING FUNCTION FOR MANDATORY PARAMETERS
       }
     
       
     }
     function DisplayCodeForOptional(obj)
     {
         var AccPartsOpt=obj.split('[');
         if(AccPartsOpt.length=='2')//IF NUMBER OF PARAMETER IS 1
         {
            if(Trim(String(AccPartsOpt[1]).toUpperCase())!='DATE' && Trim(String(AccPartsOpt[1]).toUpperCase())!='DATE]')
            {
                document.getElementById("VariableVisibility1").style.display='inline';
                var ContentLabel=AccPartsOpt[1].split(']');
                document.getElementById("lblVariable1").innerText=ContentLabel[0]+':';
                document.getElementById("lblVariblehid1").value=ContentLabel[0];    
            }
            else if(Trim(String(AccPartsOpt[1]).toUpperCase())=='DATE' || Trim(String(AccPartsOpt[1]).toUpperCase())=='DATE]')
            {
                
                document.getElementById("DateVisibility1").style.display='inline';
                document.getElementById("lblDate1").innerText='Date:';
                document.getElementById("lblDatehid1").value='Date';
                    
            }
         }
         if(AccPartsOpt.length=='3')//IF NUMBER OF PARAMETER IS 2
         {   
            if(Trim(String(AccPartsOpt[1]).toUpperCase())!='DATE]' && Trim(String(AccPartsOpt[1]).toUpperCase())!='DATE_FROM]')
            {    
                document.getElementById("VariableVisibility1").style.display='inline';
                var ContentLabel=AccPartsOpt[1].split(']')
                document.getElementById("lblVariable1").innerText=ContentLabel[0]+':';
                document.getElementById("lblVariblehid1").value=ContentLabel[0];   
                    
            }
            else if(Trim(String(AccPartsOpt[1]).toUpperCase())=='DATE_FROM]')
            {                
                document.getElementById("DateVisibility1").style.display='inline';
                document.getElementById("lblDate1").innerText='From:';
                document.getElementById("lblDatehid1").value='From';
            }
            else if(Trim(String(AccPartsOpt[1]).toUpperCase())=='DATE]')
            {     
                    document.getElementById("DateVisibility1").style.display='inline';
                    document.getElementById("lblDate1").innerText='Date:';
                    document.getElementById("lblDatehid1").value='Date';
            }
            if(Trim(String(AccPartsOpt[2]).toUpperCase())=='DATE]')
            {  
                document.getElementById("DateVisibility1").style.display='inline';
                var ContentLabel=AccPartsOpt[2].split(']')
                document.getElementById("lblDate1").innerText='Date:';
                document.getElementById("lblDatehid1").value='Date';
            }
            else if(Trim(String(AccPartsOpt[2]).toUpperCase())!='DATE]' && Trim(String(AccPartsOpt[2]).toUpperCase())!='DATE_TO]')
            {   
                document.getElementById("VariableVisibility2").style.display='inline';
                var ContentLabel=AccPartsOpt[2].split(']');
                document.getElementById("lblVariable2").innerText=ContentLabel[0]+':';
                document.getElementById("lblVariablehid2").value=ContentLabel[0];
            }
            else if(Trim(String(AccPartsOpt[2]).toUpperCase())=='DATE_TO]')
            {
                document.getElementById("DateVisibility2").style.display='inline';
                document.getElementById("lblDate2").innerText='To:';
                document.getElementById("lbldatehid2").value='To';
            } 
        }
        if(AccPartsOpt.length=='4')//IF NUMBER OF PARAMETER IS 3
        { 
           if(Trim(AccPartsOpt[1])!='DATE')
            {
                document.getElementById("VariableVisibility1").style.display='inline';
                var ContentLabel=AccPartsOpt[1].split(']')
                document.getElementById("lblVariable1").innerText=ContentLabel[0]+':';
                document.getElementById("lblVariblehid1").value=ContentLabel[0];
                
                
            }
            if(Trim(String(AccPartsOpt[2]).toUpperCase())=='DATE_FROM]')//AccPartsOpt[2]=='DATE' ||
            { 
                document.getElementById("DateVisibility1").style.display='inline';
                if(Trim(AccPartsOpt[2])=='DATE_FROM]')
                {
                    document.getElementById("lblDate1").innerText='From:';
                    document.getElementById("lblDatehid1").value='From';
                }
            }

            if(Trim(String(AccPartsOpt[3]).toUpperCase())=='DATE' || Trim(String(AccPartsOpt[3]).toUpperCase())=='DATE_TO]')
            {
                document.getElementById("DateVisibility2").style.display='inline';
                if(Trim(AccPartsOpt[3])=='DATE_TO]')
                {
                    document.getElementById("lblDate2").innerText='To:';
                    document.getElementById("lbldatehid2").value='To';
                }
            }
         }
    }
    function DisplayCodeForMandatory(obj)
     {
         
         var AccParts=obj.split('(');      
         if(AccParts.length=='2')//IF NUMBER OF PARAMETER IS 1
         {
            if(Trim(String(AccParts[1]).toUpperCase())!='DATE')
            {
                document.getElementById("VariableVisibility1").style.display='inline';
                var ContentLabel=AccParts[1].split(')');
                document.getElementById("lblVariable1").innerText='*'+ContentLabel[0]+':';
                document.getElementById("lblVariblehid1").value=ContentLabel[0];
                    
            }
            else if(Trim(String(AccParts[1]).toUpperCase())=='DATE')
            {
                document.getElementById("DateVisibility1").style.display='inline';
                document.getElementById("lblDate1").innerText='*'+'Date:';
                document.getElementById("lblDatehid1").value='Date';    
            }
         }
         if(AccParts.length=='3')//IF NUMBER OF PARAMETER IS 2
         {   
            if(Trim(String(AccParts[1]).toUpperCase())!='DATE)' && Trim(String(AccParts[1]).toUpperCase())!='DATE_FROM)')
            {    
                document.getElementById("VariableVisibility1").style.display='inline';
                var ContentLabel=AccParts[1].split(')')
                document.getElementById("lblVariable1").innerText='*'+ContentLabel[0]+':';
                document.getElementById("lblVariblehid1").value=ContentLabel[0];
                    
            }
            else if(Trim(String(AccParts[1]).toUpperCase())=='DATE_FROM)')
            {                
                document.getElementById("DateVisibility1").style.display='inline';
                document.getElementById("lblDate1").innerText='*'+'From:';
                document.getElementById("lblDatehid1").value='From';    
            }
            else if(Trim(String(AccParts[1]).toUpperCase())=='DATE)')
            {     
                document.getElementById("DateVisibility1").style.display='inline';
                document.getElementById("lblDate1").innerText='*'+'Date:';
                document.getElementById("lblDatehid1").value='Date';
            }
            if(Trim(String(AccParts[2]).toUpperCase())=='DATE)')
            {  
                document.getElementById("DateVisibility1").style.display='inline';
                var ContentLabel=AccParts[2].split(')')
                document.getElementById("lblDate1").innerText='*'+'Date:';
                document.getElementById("lblDatehid1").value='Date';
            }
            else if(Trim(String(AccParts[2]).toUpperCase())!='DATE)' && Trim(String(AccParts[2]).toUpperCase())!='DATE_TO)')
            {   
                document.getElementById("VariableVisibility2").style.display='inline';
                var ContentLabel=AccParts[2].split(')');
                document.getElementById("lblVariable2").innerText='*'+ContentLabel[0]+':';
                document.getElementById("lblVariablehid2").value=ContentLabel[0];
                
            }
            else if(Trim(String(AccParts[2]).toUpperCase())=='DATE_TO)')
            {
                document.getElementById("DateVisibility2").style.display='inline';
                document.getElementById("lblDate2").innerText='*'+'To:';
                document.getElementById("lblDatehid2").value=ContentLabel[0];
            } 
        }
        if(AccPartsOpt.length=='4')//IF NUMBER OF PARAMETER IS 3
        { 
           if(Trim(AccParts[1])!='DATE')
            {
                document.getElementById("VariableVisibility1").style.display='inline';
                var ContentLabel=AccParts[1].split(')')
                document.getElementById("lblVariable1").innerText=ContentLabel[0]+':';
                 document.getElementById("lblVariablehid1").value=ContentLabel[0];
            }
            if(Trim(String(AccParts[2]).toUpperCase())=='DATE_FROM)')//AccPartsOpt[2]=='DATE' ||
            { 
                document.getElementById("DateVisibility1").style.display='inline';
                if(Trim(AccParts[2])=='DATE_FROM)')
                {
                    document.getElementById("lblDate1").innerText='From:';
                    document.getElementById("lblDatehid1").value='From';
                }
            }

            if(Trim(String(AccParts[3]).toUpperCase())=='DATE' || Trim(String(AccParts[3]).toUpperCase())=='DATE_TO)')
            {
                document.getElementById("DateVisibility2").style.display='inline';
                if(Trim(AccPartsOpt[3])=='DATE_TO)')
                {
                    document.getElementById("lblDate2").innerText='To:';
                    document.getElementById("lblDatehid1").value='To';
                }
            }
         }
    }
   function HideAll()
   {
        document.getElementById("DateVisibility1").style.display='none';
        document.getElementById("DateVisibility2").style.display='none';
        document.getElementById("VariableVisibility1").style.display='none';
        document.getElementById("VariableVisibility2").style.display='none';
   }
   function CheckWheatherMandatory()
   {
    var val=document.getElementById("lblVariable1").innerText;
    var check=val.split('*');
    if(check.length>1)
    {
        if(document.getElementById("txtVariable1").value=='')
        {
            var val1=check[1].split(':');
            alert(val1[0]+' can Not be blank');
            return false;
        }
    }
    var val2=document.getElementById("lblVariable2").innerText;
    var check2=val2.split('*');
    if(check2.length>1)
    {
       
        if(document.getElementById("txtVariable2").value=='')
        {
            var val3=check2[1].split(':');
            alert(val3[0]+' can Not be blank');
            return false;
        }
    }
    if(document.getElementById("DateVisibility1").style.display=='inline')
    {
        var val4=document.getElementById("lblDate1").innerText;
        var check3=val4.split('*');
        if(check3.length>1)
        {
           
            if(document.getElementById("AspxDate1_I").value=='')
            {
                var val5=check3[1].split(':');
                alert(val5[0]+' can Not be blank');
                return false;
            }
        }
    }
    var val6=document.getElementById("lblDate2").innerText;
    var check4=val6.split('*');
    if(check4.length>1)
    {
        if(document.getElementById("AspxDate2_I").value=='')
        {
            var val6=check4[1].split(':');
            alert(val6[0]+' can Not be blank');
            return false;
        }
    }
   }
   function ClearAll()
   {
       
        document.getElementById("txtVariable1").value='';
        document.getElementById("txtVariable2").value='';
        document.getElementById("AspxDate1_I").value='';
        document.getElementById("AspxDate2_I").value='';
   }
   
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
        </asp:ScriptManager>
        <table class="TableMain100">
            <tr>
                <td colspan="2" class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Email And SMS Notification</span></strong>
                </td>
            </tr>
            <tr>
                <td style="width: 60%" valign="top">
                    <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                        border="1">
                        <%--<tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
                    <table>--%>
                        <tr>
                            <td class="gridcellleft">
                                <asp:Label ID="Label1" runat="server" Text="Topic:"></asp:Label>
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxComboBox ID="dpDescription" runat="server" DataSourceID="sqlDescription"
                                    EnableIncrementalFiltering="true" ValueField="topics_accesscode" TextField="topics_description"
                                    ClientInstanceName="dpDescription" Width="400px">
                                    <ClientSideEvents SelectedIndexChanged="function(s,e){DisplayCode(s.GetValue())}" />
                                </dxe:ASPxComboBox>
                                <asp:SqlDataSource ID="sqlDescription" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                    >
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <asp:Label ID="Label2" runat="server" Text="Subject:"></asp:Label>
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxTextBox ID="txtSubject" runat="server" Width="400px" ClientInstanceName="AccIDClient1"
                                    ReadOnly="true" Visible="true">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <asp:Label ID="Label11" runat="server" Text="Access Code:"></asp:Label></td>
                            <td class="gridcellleft">
                                <dxe:ASPxTextBox ID="txtAccID" runat="server" ReadOnly="true" ClientInstanceName="AccIDClient"
                                    Width="400px">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr id="VariableVisibility1" style="display: none">
                            <td class="gridcellleft">
                                <asp:Label ID="lblVariable1" runat="server" Text="Label"></asp:Label>
                                <asp:HiddenField ID="lblVariblehid1" runat="server" />
                            </td>
                            <td class="gridcellleft">
                                <asp:TextBox ID="txtVariable1" runat="server" Width="175px"></asp:TextBox></td>
                        </tr>
                        <tr id="VariableVisibility2" style="display: none">
                            <td class="gridcellleft">
                                <asp:Label ID="lblVariable2" runat="server" Text="Label"></asp:Label>
                                <asp:HiddenField ID="lblVariablehid2" runat="server" />
                            </td>
                            <td class="gridcellleft">
                                <asp:TextBox ID="txtVariable2" runat="server" Width="175px"></asp:TextBox></td>
                        </tr>
                        <tr id="DateVisibility1" style="display: none">
                            <td class="gridcellleft">
                                <asp:Label ID="lblDate1" runat="server" Text="label"></asp:Label>
                                <asp:HiddenField ID="lblDatehid1" runat="server" />
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxDateEdit ID="AspxDate1" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Width="175px" EditFormatString="dd-MM-yyyy">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr id="DateVisibility2" style="display: none">
                            <td class="gridcellleft">
                                <asp:Label ID="lblDate2" runat="server" Text="Label"></asp:Label>
                                <asp:HiddenField ID="lbldatehid2" runat="server" />
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxDateEdit ID="AspxDate2" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Width="175px" EditFormatString="dd-MM-yyyy">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr id="TrForGroup">
                            <td class="gridcellleft">
                                Branch/Group :</td>
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlGroup" runat="server" Width="80px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                <asp:ListItem Value="0">Branch</asp:ListItem>
                                                <asp:ListItem Value="1">Group</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td id="td_branch">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="AllSelct('a','B')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="a" onclick="AllSelct('b','B')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="td_group" style="display: none;" colspan="2">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="10px" onchange="fngrouptype(this.value)">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td id="td_allselect" style="display: none;">
                                                        <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                                            onclick="AllSelct('a','G')" />
                                                        All
                                                        <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="AllSelct('b','G')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="TrForClient">
                            <td class="gridcellleft">
                                Client :</td>
                            <td align="left">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbALLSCL" runat="server" Checked="True" GroupName="c" onclick="AllSelct('a','C')" /></td>
                                        <td>
                                            All Subscription Client</td>
                                        <td>
                                            <asp:RadioButton ID="radAllCL" runat="server" GroupName="c" onclick="AllSelct('a','C')" />
                                        </td>
                                        <td>
                                            All Client
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSCL" runat="server" GroupName="c" onclick="AllSelct('b','C')" /></td>
                                        <td>
                                            Selected Client</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                Notification Type:
                            </td>
                            <td class="gridcellleft">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="CmbNotType" Width="85px" Font-Size="10px" runat="server">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnEmail" EventName="Click"></asp:AsyncPostBackTrigger>
                                    </Triggers>
                                </asp:UpdatePanel>
                          
                            </td>
                        </tr>
                        <%--          </table>
                    </asp:Panel>
                </td>
            </tr>--%>
                    </table>
                </td>
                <td style="vertical-align: top">
                    <table>
                        <tr>
                            <td class="gridcellleft" style="vertical-align: top; text-align: left;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td id="TdFilter1" style="height: 23px">
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Width="85px" Font-Size="11px"
                                                Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <asp:ListItem>Group</asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td id="TdFilter" style="height: 23px">
                                            <asp:TextBox ID="txtsubscriptionID" runat="server" Font-Size="12px" Width="253" onkeyup="FunClientScrip(this,'ShowClientForNotification',event)"></asp:TextBox><a
                                                id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                        style="color: #009900; font-size: 8pt;">&nbsp;</span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left; vertical-align: top;">
                                <table cellpadding="0" cellspacing="0" id="TdSelect">
                                    <tr>
                                        <td style="padding-left: 7px">
                                            <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="90px" Width="253px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                            <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
                <tr>
                    <td colspan="2">
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                        <ProgressTemplate>
                                            <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                                top:50px ;background-color: white; layer-background-color: white; height: 80;
                                                width: 150;'>
                                                <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td height='25' align='center' bgcolor='#FFFFFF'>
                                                                        <img src='../images/progress.gif' width='18' height='18'></td>
                                                                    <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                                        <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            
                <tr>
                            <td colspan="2">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                <asp:Button ID="BtnSubmit" runat="server" Text="Send" CssClass="btnUpdate" OnClick="BtnSubmit_Click"
                                    OnClientClick="return CheckWheatherMandatory();" />
                                    </ContentTemplate>
                                    <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />   
                                    </Triggers>
                                    </asp:UpdatePanel>
                            </td>
            </tr>
            <tr>
                <td colspan="2" style="display: none;">
                    <asp:SqlDataSource ID="sqlMode" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                    </asp:SqlDataSource>
                    <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                    <asp:Button ID="btnEmail" runat="server" Text="Button" OnClick="btnEmail_Click" />
                    <asp:HiddenField ID="HdnClients" runat="server" />
                    <asp:HiddenField ID="HdnGroup" runat="server" />
                    <asp:HiddenField ID="HdnBranchId" runat="server" />
                    <asp:TextBox ID="txtsubscriptionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
