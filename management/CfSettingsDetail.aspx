<%@ page language="C#" autoeventwireup="true" inherits="management_CfSettingsDetail, App_Web_5uqmplyf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
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
     function fnAsset(obj)
        {
             if(obj=="a")
                Hide('Td_SelectAsset');
             else
                Show('Td_SelectAsset');
        }       
         function Hide(obj)
          {
             document.getElementById(obj).style.display='none';
          }
        function Show(obj)
         {
           document.getElementById(obj).style.display='inline';
         }
      
  
 FieldName='txtproductid';
</script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div><asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMainB">
                <tr>
                    <td class="Ecoheadtxt" style="text-align: center;">
                        CF-Settings Detail OF: <asp:Label ID="lblClientName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Asset :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbAssetAll" runat="server" Checked="True" GroupName="e" onclick="fnAsset('a')" />
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdAssetSelected" runat="server" GroupName="e" onclick="fnAsset('b')" />Selected
                                            </td>
                                            <td style="display: none;" id="Td_SelectAsset" runat="server">
                                                <asp:TextBox ID="txtAsset" runat="server" Width="200px" Font-Size="10px" onkeyup="ajax_showOptions(this,'ShowClientFORMarginStocks',event,'Product')"></asp:TextBox>
                                            </td>
                                            <td style="display: none;">
                                                <asp:TextBox ID="txtAsset_hidden" runat="server" Width="5px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft"> 
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Slab Code :</td>
                                            <td>
                                                <asp:DropDownList ID="ddlSlab" runat="server" Font-Size="10px" OnSelectedIndexChanged="ddlSlab_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Rate :</td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <dxe:ASPxTextBox runat="server" width="125px" ClientInstanceName="txtrate" ID="txtrate"
                                                            onkeypress="return noNumbers(event)">
                                                            <masksettings mask="<0..99g>.<00..999999>" />
                                                            <validationsettings errordisplaymode="None"></validationsettings>
                                                        </dxe:ASPxTextBox>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlSlab" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <td style="text-align: left;" colspan="8">
                                            <asp:Button runat="server" ID="btnSave" Width="44px" CssClass="btnUpdate" Text="Save"
                                                Height="23px" Style="cursor: pointer" OnClick="btnSave_Click"></asp:Button>
                                            <asp:Button runat="server" ID="btnCancel" CssClass="btnUpdate" Text="Cancel" Height="23px"
                                                OnClick="btnCancel_Click"></asp:Button></td>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>