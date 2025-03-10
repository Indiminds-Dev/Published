<%@ page language="C#" autoeventwireup="true" inherits="management_RootUserDetails, App_Web_1jeyysc_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    
        <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <%--New Work 24/02/2023--%>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>
    <%--End of New Work 24/02/2023--%>

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
    
    <script type="text/javascript" language="javascript">
    
     FieldName='test';
     
      function CallList(obj1,obj2,obj3)
    {
        var obj5='';
        if(obj5 != '18')
        {
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    }
    //New Work 24/02/2023
    function OnChangePasswordClick() 
    {
        var keyValue = document.getElementById('hdnId').value;
        var url='ChangeUserPasswordPopUp.aspx?id='+keyValue;
//        parent.OnMoreInfoClick(url,"Change User Password",'500px','200px',"Y");
        editwin=dhtmlmodal.open("Editbox", "iframe", url,"Change User Password","width=500px,height=300px,center=1,resize=0,top=500", "recal");
        editwin.onclose=function()
         {
             window.location='../management/RootUserDetails.aspx?id='+keyValue;
         }
    }
    //End of New Work 24/02/2023
    
//New Work
//    function validate() {
//    var WhichRights = document.getElementById('txtReportTo_hidden').value;
//            if (document.getElementById("<%=txtReportTo.ClientID %>").value == "") {
//                alert("Company name can not be blank");
//                document.getElementById("<%=txtReportTo.ClientID %>").focus();
//                return false;
//            }
//            return true;
//        } 
        
//        function VerifyPAN(obj) {
//            if (obj == 'emp') {
//                if (document.getElementById('chkVerify').checked == true) {
////                    document.getElementById('chkVerify').checked == false;
//var WhichRights = document.getElementById('txtReportTo_hidden').value;
//        }
//End of New Work
        
        
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function Close()
    {
        parent.editwin.close();
    }
    function Cancel_Click()
    {
       parent.editwin.close();
    }
    </script>
        
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="2" style="text-align: center;">
                    <span style="color: #0000cc"><span style="text-decoration: underline"><strong>User Information</strong></span>&nbsp;</span></td>
            </tr>
            <tr>
                <td style="width: 20%" align="right">
                    User Name&nbsp; :</td>
                <td style="width: 60%" align="left">
                    <asp:TextBox ID='txtusername' runat="server" Width="200px" ValidationGroup="a"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvuserName" runat="server" ControlToValidate="txtusername"
                        ErrorMessage="User Name Not Be Null !!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 20%" align="right">
                    Login Id&nbsp; :</td>
                <td style="width: 60%" align="left">
                    <asp:TextBox ID='txtloginid' runat="server" Width="200px" ValidationGroup="a"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLiginId" runat="server" ControlToValidate="txtloginid"
                        ErrorMessage="Ligin Id Not Be Null !!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tbody id="user_password" runat="server" visible="true">
                <tr>
                    <td style="width: 20%" align="right">
                        Password&nbsp; :</td>
                    <td style="width: 60%" align="left">
                        <asp:TextBox ID='txtpassword' runat="server" Width="200px" TextMode="Password" ValidationGroup="a"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtpassword"
                            ErrorMessage="Password Not Be Null !!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
                </tr>
            </tbody>
            <%--New Work 24/02/2023--%>
            <tbody id="Change_Password" runat="server" visible="false">
                <tr>
                    <td style="width: 20%" align="right">
                        <a href="javascript:void(0);" style="color: Blue; text-decoration: underline; font-size: small"
                        onclick="OnChangePasswordClick()" title="Click here to change user's password.">Change Password</a>
                    </td>
                </tr>                
            </tbody>
            <%--End of New Work 24/02/2023--%>
            <tr>
                <td style="width: 20%" align="right">
                    Associated Employee :</td>
                <td style="width: 60%" align="left">
                <%--OnTextChanged="txtReportTo_TextChanged" AutoPostBack="true" onblur="return validate()"--%>
                       <asp:TextBox ID="txtReportTo" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReportTo"
                            ErrorMessage="Required." ValidationGroup="a"></asp:RequiredFieldValidator>
                        <asp:HiddenField ID="txtReportTo_hidden" runat="server" />
                </td>
            </tr>
            <%--New Work--%>
            <tr>
                <td style="width: 20%" align="right">
                    Secondary Authentication Required ?</td>
                <td style="width: 60%" align="left">
                <%--OnCheckedChanged="ChckedChanged" AutoPostBack="true"--%>
                    <asp:CheckBox ID="chkVerify" runat="Server" Checked="false" Enabled="true"/>
                    <asp:Label id="Message" runat="server" Text="PAN No. of the selected Associated Employee is required for the Authentication." ForeColor="red"/>
                </td>
            </tr>
            <%--End of New Work
            <%--New Work 20/02/2023--%>
            <tr>
                <td style="width: 20%" align="right">
                    Disable this User</td>
                <td style="width: 60%" align="left">
                    <asp:CheckBox ID="chkUsrActive" runat="Server" Checked="false" Enabled="true"/>
                </td>
            </tr>
            <%--End of New Work 20/02/2023--%>
            <tr>
            <td colspan="2" align="center">
            <table id="test" width="100%">
            <tr>
                <td align="right" style="width: 20%">
                    Data Entry Profile :
                </td>
                <td align="left" style="width: 60%">
                    <asp:DropDownList ID="ddDataEntry" runat="server">
                        <asp:ListItem Value="F">Final</asp:ListItem>
                        <asp:ListItem Value="P">Provisional</asp:ListItem>
                        <asp:ListItem Value="M">Maker</asp:ListItem>
                        <asp:ListItem Value="C">Checker</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="text-align: left">
                    <dxe:ASPxCheckBox ID="cbSuperUser" runat="server" Text="Super User">
                    </dxe:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td style="width: 80%" colspan="2" align="center">
                    <asp:GridView ID="grdUserAccess" runat="Server" AutoGenerateColumns="False" BorderColor="CornflowerBlue"
                        BackColor="White" BorderStyle="Solid" BorderWidth="2px" CellPadding="4" Width="50%"
                        OnRowDataBound="grdUserAccess_RowDataBound">
                        <RowStyle BackColor="LightSteelBlue" ForeColor="#330099"></RowStyle>
                        <SelectedRowStyle BackColor="LightSteelBlue" ForeColor="SlateBlue" Font-Bold="True">
                        </SelectedRowStyle>
                        <PagerStyle BackColor="LightSteelBlue" ForeColor="SlateBlue" HorizontalAlign="Center">
                        </PagerStyle>
                        <HeaderStyle BackColor="LightSteelBlue" ForeColor="Black" Font-Bold="True"></HeaderStyle>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSegmentId" runat="server" />
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id")%>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="5%" />
                                <HeaderStyle Width="5%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="SegmentName" HeaderText="Segment">
                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle Width="20%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="User Group">
                                <ItemStyle HorizontalAlign="Left" Width="25%" />
                                <HeaderStyle Width="25%" />
                                <ItemTemplate>
                                    <asp:DropDownList ID="drpUserGroup" runat="server" AppendDataBoundItems="True" Width="250px">
                                        <asp:ListItem Value="0">None</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:DropDownList ID='dropdownlistbranch' runat="Server" AppendDataBoundItems="True"
                        Visible="false">
                        <asp:ListItem Value="0">None</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
            </td>
            </tr>
            
            <tr>
                <td style="width: 20%; height: 26px;" align="right">
                    &nbsp;</td>
                <td style="width: 60%; height: 26px;" align="left">
                    <asp:Button ID="btnUpdate" runat="server" Text="Add/Update" Width="100px" OnClick="btnUpdate_Click"
                        ValidationGroup="a" />
                    <input id="btnCancel" type="button" value="Cancel" onclick="Cancel_Click()" />
                </td>
            </tr>
        </table>
        <%--New Work 24/02/2023--%>
        <asp:HiddenField ID="hdnId" runat="server" />
        <%--End of New Work 24/02/2023--%>
    </form>
</body>
</html>
