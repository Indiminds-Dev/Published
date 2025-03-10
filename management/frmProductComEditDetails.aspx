<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductComEditDetails, App_Web_-k9nslwd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />
    <!-- Ajax List Requierd-->
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <!--Other Script-->

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <%--<link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />--%>

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <%-- <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />--%>
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
	 #MainPopUp{padding:5px; width:680px; background-color: #DDECFE;}
    .LableWidth{width:110px;}
    .ContentWidth{width:170px;}
    .btnUpdate{border-right: Blue 1px solid;padding-right: 0px;
	border-top: Blue 1px solid;padding-left: 0px;background: url(../images/EHeaderBack.gif) repeat-x 0px 0px;
	padding-bottom: 0px;
	font: bold 10px/14px Verdana, Arial, Helvetica, sans-serif;
	border-left: Blue 1px solid;
	padding-top: 0px;
	border-bottom: Blue 1px solid;
	height: 28px;
	cursor: pointer;
}
	</style>
    <%--<script type="text/javascript">
       function ClosePopup()
       {
       
            window.opener.location = 'frmProductComDerivatives_iframe.aspx';
            window.self.close();
       }
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div>
            <table style="width: 669px" border="1">
                <tr>
                    <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                        Name :</td>
                    <td style="width: 239px" class="gridcellleft">
                        <asp:TextBox ID="txtAssetName" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td style="font-weight: bold; color: #000099; width: 157px;" class="gridcellleft">
                        &nbsp;Asset Group :</td>
                    <td style="width: 100px" class="gridcellleft">
                        <asp:TextBox ID="txtAssetGroup" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                        Instrument Type :</td>
                    <td style="width: 239px" class="gridcellleft">
                        <asp:TextBox ID="txtInstrumentType" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td style="font-weight: bold; color: #000099; width: 157px;" class="gridcellleft">
                        &nbsp;Option Type:</td>
                    <td style="width: 100px" class="gridcellleft">
                        <asp:TextBox ID="txtOptionType" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                        Excise Style :</td>
                    <td style="width: 239px" class="gridcellleft">
                        <asp:TextBox ID="txtExerciseStyle" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td style="font-weight: bold; color: #000099; width: 157px;" class="gridcellleft">
                        &nbsp;ProductCtt:</td>
                    <td style="width: 100px" class="gridcellleft">
                        <asp:DropDownList ID="ddlProductCtt" runat="server">
                       
                        <asp:ListItem  Value="1">Y</asp:ListItem>
                        <asp:ListItem Value="2">N</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 126px" class="gridcellleft">
                        <asp:HiddenField ID="hdfldvalue" runat="server" />
                       
                                                
                    </td>
                    <td style="width: 239px" class="gridcellleft">
                    </td>
                    <td class="gridcellleft" style="width: 157px">
                        <asp:Button ID="btnSave" class="btnUpdate" runat="server" Text="Save" OnClick="btnSave_Click"  />
                       
                            </td>
                    
                </tr>
            </table>
            </div>--%>
        <div id="MainPopUp">
            <div class="left" style="width: 45%;background-color: #B7CEEC; padding:5px;">
                <div id="DivName" class="Row">
                    <div id="Row0_Col1" class="LFloat_Lable LableWidth">
                        Name
                    </div>
                    <div id="Row0_Col2" class="LFloat_Content ContentWidth">
                        <asp:TextBox ID="txtAssetName" Width="165px" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="DivInstrument" class="Row">
                    <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                        Instrument Type :
                    </div>
                    <div id="Row1_Col2" class="LFloat_Content ContentWidth">
                        <asp:TextBox ID="txtInstrumentType" Width="165px" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="DivExcise" class="Row">
                    <div id="Row2_Col1" class="LFloat_Lable LableWidth">
                        Excise Style :
                    </div>
                    <div id="Row2_Col2" class="LFloat_Content ContentWidth">
                        <asp:TextBox ID="txtExerciseStyle" Width="165px" runat="server"></asp:TextBox>
                    </div>
                </div>
                
                
              <%--  ------------ RMS Fee Start --------------%>
                
                <div id="DivRMS" class="Row">
                    <div id="Div2" class="LFloat_Lable LableWidth">
                       RMS Fee :
                    </div>
                    <div id="Div3" class="LFloat_Content ContentWidth" style="width:35px;">
                        <asp:DropDownList ID="ddlRMS" runat="server">
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="2">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                
                
              <%--  ------------ RMS Fee End  ----------------%>
                
                
            </div>
            <div class="left" style="width: 2%">
                &nbsp;</div>
            <div class="left" style="width: 45%;background-color: #B7CEEC; padding:5px;">
                <div id="DivAsset" class="Row">
                    <div id="Row0_Col3" class="LFloat_Lable LableWidth">
                        Asset Group :
                    </div>
                    <div id="Row0_Col4" class="Content ContentWidth">
                        <asp:TextBox ID="txtAssetGroup" Width="165px" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="DivOption" class="Row">
                    <div id="Row1_Col3" class="LFloat_Lable LableWidth">
                        Option Type:
                    </div>
                    <div id="Row1_Col4" class="Content ContentWidth">
                        <asp:TextBox ID="txtOptionType" Width="165px" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="DivProduct" class="Row">
                    <div id="Row2_Col3" class="LFloat_Lable LableWidth">
                        Product Ctt:
                    </div>
                    <div id="Row2_Col4" class="Content ContentWidth" style="width:35px;">
                        <asp:DropDownList ID="ddlProductCtt" runat="server">
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="2">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <br class="clear" />
            <div id="DivBtn" class="right" style="margin-right:17px; margin-top:-20px;">
            <asp:Button ID="btnSave" CssClass="btnUpdate" Width="90px" runat="server" Text="Save"
                OnClick="btnSave_Click" />
             </div>
            <div style="display: none;">
                <asp:HiddenField ID="hdfldvalue" runat="server" />
            </div>
        </div>
        
        
         
        
        
    </form>
</body>
</html>
