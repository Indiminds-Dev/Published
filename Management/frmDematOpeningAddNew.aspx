<%@ page language="C#" autoeventwireup="true" inherits="management_frmDematOpeningAddNew, App_Web_leuczwkw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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

    <script language="javascript" type="text/javascript">
  
    var globvar;
    function keyVal(obj)
    {
    
      var pr = new Array();
      pr=obj.split('~');
      globvar=pr[0];
        document.getElementById('txtScrip_hidden').value=pr[0];
        if(document.getElementById('txtScrip_hidden').value !='undefined')
        {
         document.getElementById('txtISIN').value=pr[1];
        }
           
    }
     function CallList(obj1,obj2,obj3)
    {
      ajax_showOptions(obj1,obj2,obj3,null,'Sub');
    
    }
    function CallList1(obj1,obj2,obj3)
    {
       ajax_showOptions(obj1,obj2,obj3,null,'Main');
    }
    
     function CallList2(obj1,obj2,obj3)
    {
           ajax_showOptions(obj1,obj2,obj3,globvar);
    }
    function pageload()
    {
       var txt=document.getElementById('txtClient');
       txt.focus();
    }
    FieldName='UpdateButton';
  
   
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
            </asp:ScriptManager>
            <table class="TableMain100" align="center">
            <tr>
            <td>
            <asp:Label ID="txtError" runat="server" Text=""></asp:Label>
            </td>
            </tr>
                <tr>
                    <td>
                        <table width="600px" align="center">
                            <%-- <tr>
                                <td width="200px">
                                    Demat Opening Stocks For :
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListFor"  runat="server" Width="200px"  OnChange="javascript:TypeSelect1(this);"  OnSelectedIndexChanged="DropDownListFor_SelectedIndexChanged">
                                        <asp:ListItem Value="CM">Client Margin </asp:ListItem>
                                        <asp:ListItem Value="PH">Pro-Holding </asp:ListItem>
                                        <asp:ListItem Value="PO">Holding In Pool A/c </asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td width="200px">
                                    Select Account :
                                </td>
                                <td>
                                    <asp:DropDownList ID="DDAcountType" runat="server" Width="200px">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td width="200px">
                                    Opening Stock As On:
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="TxtApplicableDate" runat="server" EditFormat="Custom" UseMaskBehavior="true">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton>
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>--%>
                            <tr>
                                <td width="150px">
                                    Select Client:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtClient" runat="server" Width="300px"></asp:TextBox>
                                    <asp:HiddenField runat="server" ID="txtClient_hidden" Visible="true" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClient"
                                         ErrorMessage="Rquired!."></asp:RequiredFieldValidator></td>
                            </tr>
                           <%-- <tr>
                                <td colspan="2">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table width="600px" align="center">--%>
                                                <tr>
                                                    <td width="150px">
                                                        Scrip:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtScrip" runat="server" Width="300px" ></asp:TextBox>
                                                        <asp:HiddenField runat="server" ID="txtScrip_hidden" Visible="true" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtScrip"
                                                             ErrorMessage="Rquired!."></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td width="150px">
                                                        ISIN:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtISIN" runat="server" Width="300px"></asp:TextBox>
                                                        <asp:HiddenField runat="server" ID="txtISIN_hidden" Visible="true" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtISIN"
                                                            ErrorMessage="Rquired!."></asp:RequiredFieldValidator></td>
                                                </tr>
                                            <%--</table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>--%>
                            <tr id="trSett" runat="server">
                                <td width="150px">
                                    Settlement No:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSettlementNo" runat="server" Width="300px"></asp:TextBox>                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSettlementNo"
                                         ErrorMessage="Rquired!."></asp:RequiredFieldValidator>
                                    <asp:HiddenField runat="server" ID="txtSettlementNo_hidden" Visible="true" />
                                </td>
                            </tr>
                            <tr>
                                <td width="150px">
                                    Quantity:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtQuantity" runat="server" Width="300px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtQuantity"
                                        ErrorMessage="Rquired!."></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td width="150px">
                                    Remarks:
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtRemarks" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="150px">
                                </td>
                                <td>
                                    <asp:Button ID="btnSave" CssClass="btnUpdate" runat="server" Text="Save" OnClick="btnSave_Click1" />
                                    <input id="btnClose" type="button" name="Cancel" value="Cancel" onclick="javascript:parent.editwin.close();"
                                        class="btnUpdate" />
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
