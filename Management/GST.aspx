<%@ page language="C#" autoeventwireup="true" inherits="management_GST, App_Web_sggmuspu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <!--___________________These files are for datetime calander___________________-->
    <link type="text/css" rel="stylesheet" href="../CSS/dhtmlgoodies_calendar.css?random=20051112"
        media="screen" />

    <script type="text/javascript" src="../JSFUNCTION/dhtmlgoodies_calendar.js?random=20060118"></script>

    <!--___________________________________________________________________________-->
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

         function textValidation()
           {
              
               var ob3=document.getElementById("hdType");
               var typeb = ob3.value;
               var str = document.getElementById('txtGroup').value;
               var str1 = ddlcmpname.GetValue();
               var str2 = ddlsegment.GetValue();
               var str3 = ddlsegmentdp.GetValue();
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
              if (typeb=="9" || typeb=="10")
              {
                  if(str3==null)
                   {
                   alert("Please select Segment.");
                   return false;
                   }
               
               }
               else
               {
                    if(str2==null)
                      {
                      alert("Please select Segment.");
                      return false;
                      }
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
  
         function  Valueseg(e1)
         {
            dd=e1;
         
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
       function display()
        {
          document.getElementById("tdlevelsegment").style.display = "inline";
          document.getElementById("tdsegment").style.display = "inline";
          document.getElementById("ddlsegmentdp").style.display = "none";
        }
        function displaynsdl()
        {
          document.getElementById("tdlevelsegment").style.display = "inline";
          document.getElementById("tdsegment").style.display = "inline";
          document.getElementById("ddlsegment").style.display = "none";
        }
        function ALERT()
        {
          alert('This Date Already Exist for this combination.\n Date Should be Greater than Or Less Than From Previous Date');
        
        }
        function displaysubclient()
        {
          document.getElementById("tdrsubacc").style.display = "inline";
        }
        function displaysubclientnot()
        {
         document.getElementById("tdrsubacc").style.display = "none";
        }
        function displayGST()
        {
          document.getElementById("tdunsubacc").style.display = "inline";
        }
        function displayGSTnot()
        {
         document.getElementById("tdunsubacc").style.display = "none";
        }
         function CallAjax(obj1,obj2,obj3)
        {
        FieldName='Button1';
        ajax_showOptions(obj1,obj2,obj3);
        }
        function winclose()
        {
        parent.editwin.close();
        }
//-->
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellcenter">
                        <table style="border: solid 3px lightblue; width: auto" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="text-align: center">
                                    <table style="border: solid 1px blue; width: auto">
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="lbl6" runat="server" Width="40px" Text="Group:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <asp:TextBox ID="txtGroup" Width="160px" runat="server" Font-Size="11px"></asp:TextBox>
                                                <asp:TextBox ID="txtGroup_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Company Name:" Width="90px" ID="ASPxLabel1">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;" class="Ecoheadtxt">
                                                <dxe:ASPxComboBox runat="server" Font-Size="10px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name"
                                                    ValueField="cmp_internalid" ID="ddlcmpname" Width="220px">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" id="tdlevelsegment" runat="server">
                                                <dxe:ASPxLabel runat="server" Text="Segment :" ID="ASPxLabel2" Width="60px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;" class="Ecoheadtxt" id="tdsegment" runat="server">
                                                <dxe:ASPxComboBox runat="server" Font-Size="10px" DropDownStyle="DropDown" Width="120px"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String"
                                                    DataSourceID="AccessDataSourceSegment" TextField="segment_name" ValueField="exch_internalId"
                                                    ClientInstanceName="ddlsegment" ID="ddlsegment">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="CGST Rate:" ID="ASPxLabel3">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                                <dxe:ASPxTextBox runat="server" ID="txtCGSTrate" onkeypress="return noNumbers(event)"
                                                    Width="130px">
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="IGST Rate:" ID="ASPxLabel5">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                                <dxe:ASPxTextBox runat="server" ID="txtIGSTrate" onkeypress="return noNumbers(event)"
                                                    Width="130px">
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="SGST Rate:" ID="ASPxLabel4">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                                <dxe:ASPxTextBox runat="server" ID="txtSGSTrate" onkeypress="return noNumbers(event)"
                                                    Width="130px">
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                        
                                        
                                        
                                         <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="UTT Rate:" ID="ASPxLabel8">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                                <dxe:ASPxTextBox runat="server" ID="txtUTT" onkeypress="return noNumbers(event)"
                                                    Width="130px">
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                         
                                         
                                        
                                        
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Date:" ID="ASPxLabel6">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;" class="Ecoheadtxt">
                                                <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="130px"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" ID="Dateedit">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td runat="server" id="Td16" class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Charge To:" ID="ASPxLabel23">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td runat="server" id="Td17" style="text-align: left" class="Ecoheadtxt">
                                                <asp:DropDownList runat="server" Width="129px" ID="cmbcharge">
                                                    <asp:ListItem Value="All">All</asp:ListItem>
                                                    <asp:ListItem Value="None">None</asp:ListItem>
                                                    <asp:ListItem Value="Selected">selected</asp:ListItem>
                                                    <asp:ListItem Value="All But Selected">All But Selected</asp:ListItem>
                                                    <asp:ListItem Value="NA">Not Applicable</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        
                                        
                                        
                                        
                                        
                                        <tr style="display:none">
                                            <td class="Ecoheadtxt" style="text-align: left;" colspan="2">
                                                <dxe:ASPxLabel runat="server" Text="Post Into:" ID="ASPxLabel410">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Realised:" ID="ASPxLabel10">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt" colspan="2">
                                                <dxe:ASPxComboBox runat="server" Width="239px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" ID="ddlrmainacc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left; display: none;" class="Ecoheadtxt" id="tdrsubacc" runat="server"
                                                colspan="2">
                                                <dxe:ASPxComboBox runat="server" Width="240px" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc"
                                                    TextField="SubAccount_Name" ValueField="SubAccount_ReferenceID" ClientInstanceName="ddlrsubacc"
                                                    ID="ddlrsubacc" OnCallback="ddlrsubacc_Callback">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="UnRealised:" ID="ASPxLabel7">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt" colspan="2">
                                                <dxe:ASPxComboBox runat="server" Width="240px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" ID="ddlunracc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountUnChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left; display: none;" colspan="2" class="Ecoheadtxt" runat="server"
                                                id="tdunsubacc">
                                                <dxe:ASPxComboBox runat="server" Width="240px" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc"
                                                    TextField="SubAccount_Name" ValueField="SubAccount_ReferenceID" ClientInstanceName="ddlunrsubacc"
                                                    ID="ddlunrsubacc" OnCallback="ddlunrsubacc_Callback">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" colspan="6" style="text-align: center">
                                                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btnUpdate" OnClick="Button1_Click">
                                                </asp:Button>
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
        <%-- BeginRegion DataSources --%>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company] where cmp_internalid in(select exch_compid from tbl_master_companyExchange)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceSegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select A.EXCH_INTERNALID AS exch_internalId ,isnull((TME.EXH_ShortName + '-' + A.EXCH_SEGMENTID),exch_membershipType) AS segment_name from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE WHERE  TMCE.EXCH_COMPID=@CompId ) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID">
            <SelectParameters>
                <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceaccount" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT MainAccount_Name,MainAccount_AccountCode FROM [Master_MainAccount]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceSubAcc" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT SubAccount_Name,SubAccount_ReferenceID FROM [Master_SubAccount] WHERE SubAccount_MainAcReferenceID
IN (SELECT MainAccount_AccountCode FROM [Master_MainAccount] WHERE (MainAccount_SubLedgerType='Custom')
and (MainAccount_AccountCode=@RfId))
 ">
            <SelectParameters>
                <asp:Parameter Name="RfId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hdType" runat="server" />
        <%-- EndRegion --%>
    </form>
</body>
</html>
