<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_AddNew, App_Web_0payuukt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
  <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
    function Pageload()
    {
     TrGeneral.style.display="inline";
     TrJoin.style.display="none";
     TrCTC.style.display="none";
     TrEmpID.style.display="none";
     
    }
    
    function ForJoin()
    {
     TrGeneral.style.display="none";
     TrJoin.style.display="inline";
     TrCTC.style.display="none";
     TrEmpID.style.display="none";
     
    }
   function ForCTC()
    {
     TrGeneral.style.display="none";
     TrJoin.style.display="none";
     TrCTC.style.display="inline";
     TrEmpID.style.display="none";
     
    }
    function ForEMPID()
    {
     TrGeneral.style.display="none";
     TrJoin.style.display="none";
     TrCTC.style.display="none";
     TrEmpID.style.display="inline";
     
    }
    
    function ValidateGeneral()
    {
     if(document.getElementById("txtFirstNmae").value =='')
      {
       alert('Employee First Name is Required!..');
       return false;
      }
    
    }
    function ValidateDOJ()
    {
   
     if(cmbDOJ.GetText() =='01-01-0100' || cmbDOJ.GetText() =='01-01-1900' || cmbDOJ.GetText() =='' || cmbDOJ.GetText() =='01010100' )
      {
       alert('Joining Date is Required!.');
       return false;
      }
    }
    function ValidateCTC()
    {
    
      if(document.getElementById("cmbOrganization").value =="0")
      {
       alert('Please Select  Organization.');
       return false;
      }
      else if(document.getElementById("cmbJobResponse").value =="0")
      {      
       alert('Please Select Job Responsibility.');
       return false;
      }
      else if(document.getElementById("cmbBranch").value =="0")
      {
       alert('Please Select Branch.');
       return false;
      }
      else if(document.getElementById("cmbDesg").value =="0")
      {
        alert('Please Select Designation.');
        return false;
      }
      else if(document.getElementById("EmpType").value =="0")
      {
        alert('Please Select Employee Type.');
        return false;
      }
      else if(document.getElementById("cmbDept").value =="0")
      {
      alert('Please Select Employee Dept..');
        return false;
      }
      else if(document.getElementById("txtReportTo_hidden").value =='')
      {
       alert('Please Select Reporting Head.');
       return false;
      }
      else if(document.getElementById("cmbLeaveP").value =="0")
      {
       alert('Please Select Leave Policy.');
       return false;
      }
      else if(document.getElementById("cmbWorkingHr").value =="0")
      {
       alert('Please Select Working Hour.');
       return false;
      }
      else if(cmbLeaveEff.GetText() =='01-01-0100' || cmbLeaveEff.GetText() =='01-01-1900' || cmbLeaveEff.GetText() =='' || cmbLeaveEff.GetText() =='01010100' )
      {
       alert('Effective From Date is Required!.');
       return false;
      }
      
      
    }
    function ValidateEMPID()
    {
         if(document.getElementById("txtAliasName").value =='')
          {
           alert('Employee Code is Required!..');
           return false;
          }
    }
    
    
    
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr id="TrGeneral" runat="server">
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table class="TableMain100">
                                    <tr>
                                        <td>
                                            Salutation
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbSalutation" runat="server" Width="225px" TabIndex="1">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            First Name
                                        </td>
                                        <td>
                                        <asp:TextBox ID="txtFirstNmae" runat="server" Width="225px" TabIndex="2"></asp:TextBox>
                                          <%--  <dxe:ASPxTextBox ID="txtFirstNmae" runat="server" Width="225px" TabIndex="2">
                                                 </dxe:ASPxTextBox>--%>
                                        </td>
                                        <td>
                                            Middle Name
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtMiddleName" runat="server" Width="225px" TabIndex="3">
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Last Name
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtLastName" runat="server" Width="225px" TabIndex="4">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                            Gender
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbGender" runat="server" Width="225px" TabIndex="5">
                                                <asp:ListItem Value="1">Male</asp:ListItem>
                                                <asp:ListItem Value="0">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="Ecoheadtxt" style="width: 137px">
                                         
                                        </td>
                                        <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <asp:Button ID="btnSave"  runat="server" CssClass="btnUpdate" Text="Click to Continue" OnClick="btnSave_Click"  TabIndex="6" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr id="TrJoin" runat="server">
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table class="TableMain100">
                                    <tr>
                                        <td>
                                            Date Of Joining
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit Width="250px" ID="cmbDOJ" TabIndex="7"  runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnJoin" CssClass="btnUpdate" Text="Click to Continue" runat="server" TabIndex="8"   OnClick="btnJoin_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnJoin" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr id="TrCTC" runat="server">
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table class="TableMain100">
                                    <tr>
                                        <td>
                                            Date Of Joining
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="JoiningDate" TabIndex="9" runat="server" DateOnError="Today" EditFormat="Custom"
                                                                                            Width="225px">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>
                                            Organization
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbOrganization" TabIndex="10" runat="server" Width="225px" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Job Responsibility
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbJobResponse" runat="server" Width="225px" TabIndex="11">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Branch
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbBranch" runat="server" Width="225px" TabIndex="12">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Designation
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbDesg" runat="server" Width="225px" TabIndex="14">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Employee Type
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="EmpType" runat="server" Width="225px" TabIndex="15">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Department
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbDept" runat="server" Width="225px" TabIndex="16">
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
                                            <asp:TextBox ID="txtReportTo" runat="server" Width="225px" TabIndex="17"></asp:TextBox>
                                            <asp:HiddenField ID="txtReportTo_hidden" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Working Hour
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbWorkingHr" runat="server" Width="225px" TabIndex="18">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Leave Policy
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbLeaveP" runat="server" Width="225px" TabIndex="19">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Leave Effective From
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="cmbLeaveEff" runat="server" DateOnError="Today" EditFormat="Custom"
                                                TabIndex="20" Width="225px">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnCTC" CssClass="btnUpdate" Text="Click to Continue" runat="server"  TabIndex="21"  OnClick="btnCTC_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnCTC" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr id="TrEmpID" runat="server">
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <table class="TableMain100">
                                    <tr>
                                        <td style="width: 100px">
                                            Employee ID
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtAliasName" runat="server" Width="225px" TabIndex="22">
                                            </dxe:ASPxTextBox>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="color: #cc3300;
                                                text-decoration: underline; font-size: 8pt;">Make System Employee Code</asp:LinkButton>
                                            <br />
                                            <asp:Label ID="lblErr" Text="" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnEmpID" CssClass="btnUpdate" Text="Click to Continue" runat="server" TabIndex="23"   OnClick="btnEmpID_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnEmpID" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
