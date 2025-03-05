<%@ page language="C#" autoeventwireup="true" inherits="management_dpheads, App_Web_vvdfezxa" %>

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
   function SignOff()
    {
        window.parent.SignOff();
    }
    function OnAccountChanged(ddlrmainacc)
    {
       CallServer('AccRel' + '~' + ddlrmainacc.GetValue().toString(), ""); 
       ddlrsubacc.PerformCallback(ddlrmainacc.GetValue().toString());
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
    }
    
    function displaysubclient()
    {
      document.getElementById("tdrsubacc").style.display = "inline";
    }
    function displaysubclientnot()
    {
     document.getElementById("tdrsubacc").style.display = "none";
    }
        
    </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form2" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <table style="width: 100px; z-index: 101;border:solid 1px white;">
                                    
                                          <tr>
                                               <td class="gridcellleft"><dxe:ASPxLabel ID="lbl1" runat="server" width="100px"  Text="Code:" ></dxe:ASPxLabel></td>
                                               <td class="gridcellleft"><dxe:ASPxTextBox runat="server"  ID="txtcode" width="120px"></dxe:ASPxTextBox></td>
                                               
                                               
                                                <td class="gridcellleft"><dxe:ASPxLabel ID="lbl2" runat="server" width="100px"  Text="Name:" ></dxe:ASPxLabel></td>
                                               <td class="gridcellleft"><dxe:ASPxTextBox runat="server"  ID="txtname" width="240px"></dxe:ASPxTextBox></td>
                                                         
                                          </tr>
                                             
                                               <tr>
                                                                  
                                                    <td  class="gridcellleft" >
                                                     <dxe:ASPxLabel runat="server" Text="Main Account:"  ID="ASPxLabel10"></dxe:ASPxLabel>
                                                     </td>
                                                     <td style="text-align:left" class="gridcellleft" colspan="2">
                                                     <dxe:ASPxComboBox runat="server" width="220px" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name" ValueField="MainAccount_AccountCode"  ID="ddlrmainacc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountChanged(s); }"></ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                     </td>

                                                     <td style="text-align:left;display:none;" class="gridcellleft" id="tdrsubacc" runat="server" colspan="2" >
                                                     <dxe:ASPxComboBox runat="server" width="220px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc" TextField="SubAccount_Name" ValueField="SubAccount_Code" ClientInstanceName="ddlrsubacc" ID="ddlrsubacc" OnCallback="ddlrsubacc_Callback"></dxe:ASPxComboBox>
                                                     </td>
                                                                                        
                                            </tr>
                                                 
                                                <tr>
                                                      <td class="gridcellleft" style="width: 50%" >
                                                        <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="SrvTax/GST Applicable:"></dxe:ASPxLabel>
                                                      </td>
                                                    
                                                      <td class="gridcellleft" style="text-align: left; width: 22%;">
                                                        <table>
                                                          <tr>
                                                            <td >
                                                            <asp:CheckBox id="chklock" runat="server" />
                                                            </td><%-- <asp:RadioButton  ID="rdno" runat="server"  Checked="true" GroupName="g1"/>No</td>--%>
                                                          <%--  <td > <asp:RadioButton ID="rdyes" runat="server" GroupName="g1"/>Yes</td>--%>
                                                          </tr>
                                                        </table>
                                                      </td>
                                       
                                               </tr>
                                                                                 
                                               <tr>
                                                  <td class="gridcellleft" colspan="6">
                                                     <asp:Button  ID="Button1" runat="server" Text="Save" OnClientClick="return aa();" OnClick="Button1_Click" style="cursor:pointer" CssClass="btnUpdate" >
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
                <asp:SqlDataSource ID="AccessDataSourceaccount" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
    
        SelectCommand="SELECT MainAccount_Name,ltrim(rtrim(MainAccount_AccountCode)) as MainAccount_AccountCode FROM [Master_MainAccount]"></asp:SqlDataSource> 
        
        <asp:SqlDataSource ID="AccessDataSourceSubAcc" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"  
          SelectCommand="SELECT SubAccount_Name,SubAccount_Code FROM [Master_SubAccount] WHERE SubAccount_MainAcReferenceID
IN (SELECT MainAccount_AccountCode FROM [Master_MainAccount] WHERE (MainAccount_SubLedgerType='Custom')
and (MainAccount_AccountCode=@RfId))
 ">
        <SelectParameters>
            <asp:Parameter Name="RfId"  Type="String"/>
        </SelectParameters></asp:SqlDataSource>
    </form>
</body>
</html>
