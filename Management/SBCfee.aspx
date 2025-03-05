<%@ page language="C#" autoeventwireup="true" inherits="management_SBCfee, App_Web_jdrimxnc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
   
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>
    <script language="javascript" type="text/javascript">
// <!CDATA[
//function is called on changing country
 function SignOff()
 {
  window.parent.SignOff();
 }
 function textValidation()
 {
      
     
       var str = document.getElementById('txtGroup').value;
       var str1 = ddlcmpname.GetValue();
       var str2 = ddlsegment.GetValue()
     if(str=="")
          {
          alert("Please select group.");
          return false;
          }
      if(str1=="--Select Company--")
          {
          alert("Please select Company name.");
          return false;
          }
      if(str2==null)
          {
             alert("Please select Segment.");
             return false;
          }
      
 }
function OnTaxChanged(ddltaxapp)
{
    var text=ddltaxapp.GetText().toString();
   
    if(text=="No")
    {
     document.getElementById("trtrancharge").style.display = "none";
    }
    else
    document.getElementById("trtrancharge").style.display = "none";
 }
 function displayt()
{
   document.getElementById("trtrancharge").style.display = "none";

}
function displaynott()
{
   document.getElementById("trtrancharge").style.display = "none";
}

function displayaccount()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
}

function displayaccount1()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
}

function displaynotaccount()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
  }
 function OnChargeChanged(cmbcharge)
{
   var text=cmbcharge.GetText().toString();
   var text1=ddltaxapp.GetText().toString();
   
   if(text=="None")
   {
   
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   }
   else if(text!="None" && text1=="No")
   {
   document.getElementById("trtrancharge").style.display = "inline";
   document.getElementById("accfor").style.display = "inline";
   document.getElementById("trtranclient").style.display = "inline";
    document.getElementById("trtrancharge").style.display = "none";
   }
   else if(text!="None" && text1=="Yes")
   {
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
    document.getElementById("trtrancharge").style.display = "none";
   }
    
}
function noNumbers(e)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                {
                 alert("Please Insert Numeric Only");
                 return false;
                }
         } 
         
          else if(e.which) // Netscape/Firefox/Opera
       {
           keynum = e.which  
           
           if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                 {
                 alert("Please Insert Numeric Only");
                 return false;
                 }     
        }
  }
function OnAccountChanged(ddlrmainacc)
{
  CallServer('AccRel' + '~' + ddlrmainacc.GetValue().toString(), ""); 
   ddlrsubacc.PerformCallback(ddlrmainacc.GetValue().toString());
}
function OnAccountUnChanged(ddlunracc)
{
  CallServer('AccUnRel' + '~' + ddlunracc.GetValue().toString(), ""); 
  ddlunrsubacc.PerformCallback(ddlunracc.GetValue().toString());
}
function display()
{
  document.getElementById("tdlevelsegment").style.display = "inline";
  document.getElementById("tdsegment").style.display = "inline";
}

function displaysubclient()
{
  document.getElementById("tdrsubacc").style.display = "inline";
}
function displaysubclientnot()
{
 document.getElementById("tdrsubacc").style.display = "none";
}
function displaytax()
{
  document.getElementById("tdunsubacc").style.display = "inline";
}
function displaytaxnot()
{
 document.getElementById("tdunsubacc").style.display = "none";
}
function ALERT()
{
  alert('This Date Already Exist for this combination.\n Date Should be Greater than Or Less Than From Previous Date');

}
function ReceiveServerData(rValue)
    {   
   
        var DATA=rValue.split('~');  
        if(DATA[0]=="AccRel")
        {
         if(DATA[1]!="N")
            { 
             document.getElementById("tdrsubacc").style.display = "inline";
            }
            
            else
            {
            document.getElementById("tdrsubacc").style.display = "none";
            }
        }
        
         if(DATA[0]=="AccUnRel")
        {
         if(DATA[1]!="N")
            { 
             document.getElementById("tdunsubacc").style.display = "inline";
            }
            
            else
            {
            document.getElementById("tdunsubacc").style.display = "none";
            }
            
        }
        
          if(DATA[0]=="Segment")
        {
      
         if(DATA[1]!="N")
            { 
            
             document.getElementById("tdlevelsegment").style.display = "inline";
             document.getElementById("tdsegment").style.display = "inline";
            }
            
            else
            {
          
            document.getElementById("tdlevelsegment").style.display = "none";
            document.getElementById("tdsegment").style.display = "none";
            }
            
        }
    }
    
  
      function CallAjax(obj1,obj2,obj3)
    {
        FieldName='cmbSegment';
        ajax_showOptions(obj1,obj2,obj3);
    }
//-->
</script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
  <div>
               <table  class="TableMain100">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <table style="width: 100px; z-index: 101">
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="lbl6" runat="server" Width="120px" Text="Group:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <asp:TextBox ID="txtGroup" runat="server" Font-Size="11px" Width="160px"></asp:TextBox><asp:TextBox
                                                    ID="txtGroup_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox></td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Company:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name"
                                                    ValueField="cmp_internalid" Width="150px" ID="ddlcmpname">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left" id="tdlevelsegment"
                                                runat="server">
                                                <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Segment:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;" id="tdsegment" runat="server">
                                                <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSegment"
                                                    TextField="segment_name" ValueField="exch_internalId" Width="100px" ClientInstanceName="ddlsegment"
                                                    ID="ddlsegment">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Date:" Width="93px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <asp:TextBox runat="server" TabIndex="18" Width="120px" ID="txtdate" Visible="False"></asp:TextBox>
                                                <asp:Image runat="server" ImageUrl="~/images/calendar.jpg" ID="Image1" Visible="False">
                                                </asp:Image>
                                                <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" EditFormat="Custom"
                                                     Width="130px" 
                                                     ID="Dateedit">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                             
                                            <td id="td_fo" runat="server" class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel97" runat="server" Width="150px" Text="Rate For Future:">
                                                </dxe:ASPxLabel>
                                            </td>
                                               
                                            
                                            
                                            <td id="td_old" runat="server" class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtrate" runat="server" Width="100px" TabIndex="4"  onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                                
                                            </td>
                                            
                                           
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Service Tax:" Width="90px" Visible="False">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddltaxapp" Visible="False" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnTaxChanged(s); }"></ClientSideEvents>
                                                    <Items>
                                                        <dxe:ListEditItem Text="No" Value="No"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Yes" Value="Yes"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Charge To:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxComboBox runat="server" Width="93px" ID="cmbcharge" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnChargeChanged(s); }"></ClientSideEvents>
                                                    <Items>
                                                        <dxe:ListEditItem Text="All" Value="All"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="None" Value="None"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Selected" Value="Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="All But Selected" Value="All But Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Not Applicable" Value="NA"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td id="td_oldfo" runat="server" class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel30" runat="server" Width="150px" Text="Rate For Option:">
                                                </dxe:ASPxLabel>
                                            
                                            
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtrate1" runat="server" Width="100px" TabIndex="4"  onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                                
                                            </td>
                                            </td>
                                        </tr>
                                        
                                        
                                        <%-- for account--%>
                                        <tr id="accfor" runat="server" style="display:none">
                                            <td colspan="6" class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel40" runat="server" Text="Accounts for SBC:">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr id="trtranclient" runat="server" style="display:none">
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Clients:" ID="ASPxLabel11">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt" colspan="2">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" Width="170px" ID="ddlrmainacc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left; display: none;" class="Ecoheadtxt" id="tdrsubacc" runat="server"
                                                colspan="2">
                                                <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc"
                                                    TextField="SubAccount_Name" ValueField="SubAccount_Code" Width="170px" ClientInstanceName="ddlrsubacc"
                                                    ID="ddlrsubacc" OnCallback="ddlrsubacc_Callback">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr id="trtrancharge" runat="server" style="display:none">
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="ServTax:" ID="ASPxLabel7">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt" colspan="2">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" Width="170px" ID="ddlunracc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountUnChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left; display: none;" class="Ecoheadtxt" runat="server" id="tdunsubacc"
                                                colspan="2">
                                                <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc"
                                                    TextField="SubAccount_Name" ValueField="SubAccount_Code" Width="170px" ClientInstanceName="ddlunrsubacc"
                                                    ID="ddlunrsubacc" OnCallback="ddlunrsubacc_Callback">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <%--end account--%>
                                        <tr>
                                            <td colspan="6" class="Ecoheadtxt">
                                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"
                                                   CssClass="btnUpdate" ></asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company] where cmp_internalId in(select distinct exch_compid from tbl_master_CompanyExchange)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourcesegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select A.EXCH_INTERNALID AS exch_internalId ,isnull((TME.EXH_ShortName + '-' + A.EXCH_SEGMENTID),exch_membershipType) AS segment_name from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE WHERE  TMCE.EXCH_COMPID=@CompId ) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID ">
            <SelectParameters>
                <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceaccount" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT MainAccount_Name,MainAccount_AccountCode FROM [Master_MainAccount]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceSubAcc" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT SubAccount_Name,SubAccount_Code FROM [Master_SubAccount] WHERE SubAccount_MainAcReferenceID
IN (SELECT MainAccount_AccountCode FROM [Master_MainAccount] WHERE (MainAccount_SubLedgerType='Custom')
and (MainAccount_AccountCode=@RfId))
 ">
            <SelectParameters>
                <asp:Parameter Name="RfId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
