<%@ page language="C#" autoeventwireup="true" inherits="management_chargemaster, App_Web_yf04ozfw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

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
    function OnTypeChanged()
    {
       var text=ddltype.GetText().toString();
       if(text=='Brokerage')
       document.getElementById("txtcode").value='GRPBR';        
       else 
       if(text=='Charges')
       document.getElementById("txtcode").value='GRPCH';
       else
       document.getElementById("txtcode").value='GRPDP';
    }
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <table class="TableMain100">
            <tr>
                <td class="gridcellcenter">
                    <table style="border: solid 1px white">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft">
                                            <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Type" Width="58px">
                                            </dxe:ASPxLabel>
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxComboBox runat="server" Width="225px" ID="ddltype" ClientInstanceName="ddltype" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                ValueType="System.String" Height="22px">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnTypeChanged(s); }"></ClientSideEvents>
                                                <ValidationSettings Display="Dynamic" ValidationGroup="a">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
                                            </dxe:ASPxComboBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddltype"
                                                Display="Dynamic" ErrorMessage="Required!." ValidationGroup="a"></asp:RequiredFieldValidator></td>
                                       </tr>
                                       <tr> <td class="gridcellleft">
                                            <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Code">
                                            </dxe:ASPxLabel>
                                        </td>
                                        <td class="Ecoheadtxt" style="text-align: left; ">
                                            &nbsp;
                                            <asp:TextBox ID="txtcode" runat="server" MaxLength="10" Height="21px" Width="225px" ValidationGroup="a"></asp:TextBox>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft">
                                            <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Name">
                                            </dxe:ASPxLabel>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtname" runat="server" ValidationGroup="a" Height="21px" Width="225px"></asp:TextBox>
                                            
                                        </td>
                                        </tr>
                                    <tr>
                                        <td class="gridcellleft">
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                                                ErrorMessage="Required!." Display="Dynamic" ValidationGroup="a"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft">
                                            <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Is Default Group" Height="17px" Width="99px">
                                            </dxe:ASPxLabel>
                                        </td>
                                        <td class="gridcellleft">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdno" runat="server" Checked="True" GroupName="g1" />No</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdyes" runat="server" GroupName="g1" />Yes</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="width: 238px">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="gridcellcenter">
                                            <table>
                                                <tr>
                                                    <td align="right">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:HiddenField ID="hdReferenceBy" runat="server" />
                                                                    <asp:Button ID="btnSave" CssClass="btnUpdate" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="a" />
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
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
