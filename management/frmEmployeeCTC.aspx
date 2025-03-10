<%@ page language="C#" autoeventwireup="true" inherits="management_frmEmployeeCTC, App_Web__y0k_erv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<head runat="server">
    <title>Untitled Page</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

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
	 FieldName='btnSave';
	 function CallList(obj1,obj2,obj3)
    {
        var obj5='';
        if(obj5 != '18')
        {
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    }
        function OnCloseButtonClick(s, e) {

        var parentWindow = window.parent;

        parentWindow.popup.Hide();

    }
        function MaskMoney(evt) 
    {
    if (!(evt.keyCode == 46 || (evt.keyCode >= 48 && evt.keyCode <= 57))) return false;
    var parts = evt.srcElement.value.split('.');
    if (parts.length > 2) return false;
    if (evt.keyCode == 46) return (parts.length == 1);
    if (parts[0].length >= 14) return false;
    if (parts.length == 2 && parts[1].length >= 2) return false;
    }
    
    function OncmbLeaveEffChange()
    {
        var DOJ =document.getElementById("Hidden_DOJ").value;
        var AlreadyAssignedDate =document.getElementById("Hidden_LEF").value;
        var NewDate = cCmbLeaveEff.GetDate();
        CompareDate(DOJ,NewDate,"LE","Selected Date Can not Be Less Than DOJ Date!!!",cCmbLeaveEff,AlreadyAssignedDate);   
    }
    function OnJoiningDateChange()
    {
        var DOJ =document.getElementById("Hidden_DOJ").value;
        var AlreadyAssignedDate =document.getElementById("Hidden_CTCAppFrom").value;
        var NewDate = cJoiningDate.GetDate();
        CompareDate(DOJ,NewDate,"LE","Selected Date Can not Be Less Than DOJ Date!!!",cJoiningDate,AlreadyAssignedDate);       
    }

    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        CTC Aplicable From:
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="JoiningDate" ClientInstanceName="cJoiningDate" runat="server" DateOnError="Today" EditFormat="Custom"
                            TabIndex="0">
                            <ClientSideEvents DateChanged="OnJoiningDateChange" />
                        </dxe:ASPxDateEdit>
                    </td>
                    <td>
                        Organization
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbOrganization" runat="server" Width="170px" TabIndex="1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Job Responsibility
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbJobResponse" runat="server" Width="170px" TabIndex="2">
                        </asp:DropDownList>
                    </td>
                    <td>
                        Branch
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbBranch" runat="server" Width="170px" TabIndex="3">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Designation
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbDesg" runat="server" Width="170px" TabIndex="4">
                        </asp:DropDownList>
                    </td>
                    <td>
                        Employee Type
                    </td>
                    <td>
                        <asp:DropDownList ID="EmpType" runat="server" Width="170px" TabIndex="5">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Department
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbDept" runat="server" Width="170px" TabIndex="6">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Report To</td>
                    <td colspan="3">
                        <asp:TextBox ID="txtReportTo" runat="server" Width="300px" TabIndex="7"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReportTo"
                            ErrorMessage="Required."></asp:RequiredFieldValidator>
                        <asp:HiddenField ID="txtReportTo_hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                           Additional Reporting Head</td>
                    <td colspan="3">
                        <asp:TextBox ID="txtAReportHead" runat="server" Width="300px" TabIndex="8"></asp:TextBox>
                        <asp:HiddenField ID="txtAReportHead_hidden" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                           Colleague</td>
                    <td colspan="3">
                        <asp:TextBox ID="txtColleague" runat="server" Width="300px" TabIndex="9"></asp:TextBox>
                        <asp:HiddenField ID="txtColleague_hidden" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td>
                        Current CTC
                    </td>
                    <td>
                        <asp:TextBox ID="txtCTC" runat="server" Width="170px" TabIndex="10"></asp:TextBox>
                    </td>
                    <td>
                        Basic
                    </td>
                    <td>
                        <asp:TextBox ID="txtBasic" runat="server" Width="170px" TabIndex="11"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        HRA
                    </td>
                    <td>
                        <asp:TextBox ID="txtHRA" runat="server" Width="170px" TabIndex="12"></asp:TextBox>
                    </td>
                    <td>
                        CCA
                    </td>
                    <td>
                        <asp:TextBox ID="txtCCA" runat="server" Width="170px" TabIndex="13"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        SP. Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtSpAl" runat="server" Width="170px" TabIndex="14"></asp:TextBox>
                    </td>
                    <td>
                        Children Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtChAL" runat="server" Width="170px" TabIndex="15"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        PF
                    </td>
                    <td>
                        <asp:TextBox ID="txtPf" runat="server" Width="170px" TabIndex="16"></asp:TextBox>
                    </td>
                    <td>
                        Medical Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtMedAl" runat="server" Width="170px" TabIndex="17"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        LTA
                    </td>
                    <td>
                        <asp:TextBox ID="txtLTA" runat="server" Width="170px" TabIndex="18"></asp:TextBox>
                    </td>
                    <td>
                        Convence
                    </td>
                    <td>
                        <asp:TextBox ID="txtConvence" runat="server" Width="170px" TabIndex="19"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mobile Phone Exp.
                    </td>
                    <td>
                        <asp:TextBox ID="txtMbAl" runat="server" Width="170px" TabIndex="20"></asp:TextBox>
                    </td>
                    <td>
                        Car Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtCarAl" runat="server" Width="170px" TabIndex="21"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Uniform Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtUniform" runat="server" Width="170px" TabIndex="22"></asp:TextBox>
                    </td>
                    <td>
                        Books Periodicals Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtBook" runat="server" Width="170px" TabIndex="23"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Seminar Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtSeminar" runat="server" Width="170px" TabIndex="24"></asp:TextBox>
                    </td>
                    <td>
                        Other Allowance
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther" runat="server" Width="170px" TabIndex="25"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Working Hour
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbWorkingHr" runat="server" Width="170px" TabIndex="26">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required." ControlToValidate="cmbWorkingHr"></asp:RequiredFieldValidator></td>
                    <td>
                        Leave Policy
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbLeaveP" runat="server" Width="170px" TabIndex="27">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Leave Effective From
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="cmbLeaveEff" ClientInstanceName="cCmbLeaveEff" runat="server" DateOnError="Today" EditFormat="Custom"
                            TabIndex="28">
                            <ClientSideEvents DateChanged="OncmbLeaveEffChange" />
                        </dxe:ASPxDateEdit>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cmbLeaveP"
                            ErrorMessage="Required."></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        Remarks
                    </td>
                    <td>
                        <asp:TextBox ID="txtRemarks" runat="server" Width="370px" Height="60px" TabIndex="29"></asp:TextBox>
                          </td>
                       <td>
                     <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="a"
                            TabIndex="30">
                        </dxe:ASPxButton>
                        </td><td>
                          <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Text="Discard"  VerticalAlign="Bottom" Width="50px">
                     <ClientSideEvents Click="OnCloseButtonClick" />
                    </dxe:ASPxButton>
                    </td>
                </tr>
                <tr>
                <td colspan="4">
                </td>
                </tr>
            </table>
            <asp:HiddenField ID="Hidden_DOJ" runat="server" />
            <asp:HiddenField ID="Hidden_LEF" runat="server" />
            <asp:HiddenField ID="Hidden_CTCAppFrom" runat="server" />
        </div>
    </form>
</body>
</html>
