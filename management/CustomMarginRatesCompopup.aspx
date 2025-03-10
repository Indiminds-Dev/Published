<%@ page language="C#" autoeventwireup="true" inherits="management_CustomMarginRatesCompopup, App_Web_udicbieo" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Add Margin Rates</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
     <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
<%--     <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
--%>     
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
</head>

<script language="javascript" type="text/javascript">
     function showOption(obj1,obj2,obj3) /////////ajax list call
         {
           var hu = window.location.search.substring(6);
           ajax_showOptions(obj1,obj2,obj3,hu,"Main");
           txtfocusin();
         }
    FieldName='txtInitialMargin';
</script>
<body style="margin: 50px 50px 50px 50px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>   <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
        <table border="0" cellpadding="0" cellspacing="0">
          
            <tr align="left" valign="top">
                <td><b>
                    Instrument : </b></td>
                <td colspan="3">
                    <asp:TextBox ID="txtInstrument" runat="server" Width="294px" onkeyup="showOption(this,'SEARCHINSTRUMENTTOFORTRADEENTRY',event)"></asp:TextBox>
                </td>
            </tr>
            <tr align="left" valign="top">
                <td><b>
                    Initial Margin : </b></td>
                <td>
                    <dxe:ASPxTextBox ID="txtInitialMargin" runat="server" ClientInstanceName="txtInitialMargin" HorizontalAlign="Right"
                        Width="100px">
                        <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                        <ValidationSettings ErrorDisplayMode="None">
                        </ValidationSettings>
                   <ClientSideEvents LostFocus="function(s, e) {lots();}" />
                    </dxe:ASPxTextBox>
                </td>
           
            </tr>
            <tr align="left" valign="top">
                <td><b>Exposure Margin :</b>
                     </td>
          
                 <td>
                    <dxe:ASPxTextBox ID="txtExposureMargin" runat="server" ClientInstanceName="txtInitialMargin" HorizontalAlign="Right"
                        Width="100px">
                        <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                        <ValidationSettings ErrorDisplayMode="None">
                        </ValidationSettings>
                   <ClientSideEvents LostFocus="function(s, e) {lots();}" />
                    </dxe:ASPxTextBox>
                </td>
            </tr>
        
            <tr align="left" valign="top">
                <td colspan="4" align="center">
                    <br />
                    <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Save"
                        Width="100px" OnClick="btn_show_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="display:none;">
                    <asp:TextBox ID="txtInstrument_hidden" runat="server" Width="5px"></asp:TextBox>
                   
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
