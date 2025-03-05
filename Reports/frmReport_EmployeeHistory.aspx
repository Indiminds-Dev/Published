<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_EmployeeHistory, App_Web_qrhyroaj" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee History</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
        function CallAjax(obj1,obj2,obj3)
        {
            var cmbcompany=document.getElementById('cmbCompany_VI');
            var cmbbranch=document.getElementById('cmbBranch_VI');
            var obj4=cmbcompany.value+'~'+cmbbranch.value
            ajax_showOptions(obj1,obj2,obj3,obj4);
        }
        function height()
        {
            if(document.body.scrollHeight>300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '300px';
            window.frameElement.widht = document.body.scrollWidht;
        }

    function PageLoad()
    {
        FieldName='btnShow';
        hide('txtName_hidden');
        if(document.getElementById('txtName').value == "")
        {
            hide('trTree');
            hide('tdgrid');
        }
        else
        {
            show('trTree');
            show('tdgrid');
        }
        height();
    }
    
    
    function show(obj1)
    {
        //alert(obj1);
         document.getElementById(obj1).style.display='inline';
    }
    function hide(obj1)
    {
        //alert(obj1);
         document.getElementById(obj1).style.display='none';
    }
    
    </script>
     <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js" ></script>
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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" cellpadding="opx" cellspacing="0px">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <strong><span style="color: #000099">Employee History Report</span></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="TableMain100">
                        <tr>
                            <td style="text-align: center">
                                <table>
                                    <tr>
                                        <td align="left">
                                            <dxe:ASPxComboBox ID="cmbCompany" runat="server" ClientInstanceName="cmbCompany"
                                                Font-Bold="False" Font-Size="10px" ValueType="System.String" EnableIncrementalFiltering="True">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                                <DropDownButton Text="Company">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxComboBox ID="cmbBranch" runat="server" ClientInstanceName="cmbBranch" EnableIncrementalFiltering="True"
                                                EnableTheming="False" Font-Overline="False" Font-Size="10px" Height="10px" ValueType="System.String"
                                                Width="130px">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                                <DropDownButton Text="Branch" Width="40px">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td class="gridcellright">
                                            <span class="Ecoheadtxt" style="color: blue"><strong>Name:</strong></span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtName" runat="server" Font-Size="11px" Width="252px"></asp:TextBox><asp:TextBox
                                                ID="txtName_hidden" runat="server" Width="14px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                                ErrorMessage=""></asp:RequiredFieldValidator>
                                        </td>
                                        <td id="tdtxtname" class="gridcellright">
                                            <dxe:ASPxButton ID="btnSubmit" runat="server" AutoPostBack="False" OnClick="btnSubmit_Click"
                                                Text="Show">
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table style="border-right: white thin solid; border-top: white thin solid; border-left: white thin solid;
                                    border-bottom: white thin solid;" id="trTree" width="100%">
                                    <tr>
                                        <td class="gridcellright">
                                            <span class="Ecoheadtxt" style="color: blue"><strong>Employee Name:</strong></span></td>
                                        <td class="gridcellleft" colspan="2">
                                            <asp:Label ID="lblEmpName" runat="server" Font-Size="10px" Width="100%"></asp:Label>
                                        </td>
                                        <td class="gridcellright">
                                            <span class="Ecoheadtxt" style="color: blue"><strong>Code:</strong></span></td>
                                        <td class="gridcellleft" colspan="2">
                                            <asp:Label ID="lblCode" runat="server" Font-Size="10px" Width="100%"></asp:Label></td>
                                        <td class="gridcellright">
                                            <span class="Ecoheadtxt" style="color: blue"><strong>Date Of Joining:</strong></span></td>
                                        <td class="gridcellleft">
                                            <asp:Label ID="lblDOJ" runat="server" Font-Size="10px" Width="100%"></asp:Label></td>
                                        <td class="gridcellright" style="font-weight: bold; color: #0000ff">
                                            <span class="Ecoheadtxt" style="color: blue"><strong>Date Of Leaving:</strong></span></td>
                                        <td class="gridcellleft">
                                            <asp:Label ID="lblDOL" runat="server" Font-Size="10px" Width="100%"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td id="tdgrid">
                                <dxwgv:ASPxGridView ID="gridHistory" ClientInstanceName="grid" KeyFieldName="emp_cntId"
                                    runat="server" AutoGenerateColumns="False" Width="100%">
                                    <Styles>
                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                        </Header>
                                        <LoadingPanel ImageSpacing="10px">
                                        </LoadingPanel>
                                        <Cell CssClass="gridcellleft">
                                        </Cell>
                                    </Styles>
                                    <StylesEditors>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Company" VisibleIndex="0" FieldName="cmp"
                                            Width="250px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Branch" VisibleIndex="1" FieldName="branch"
                                            Width="100px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Designation" VisibleIndex="2" FieldName="deg"
                                            Width="100px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="From" VisibleIndex="3" FieldName="joindate"
                                            Width="50px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="To" VisibleIndex="4" FieldName="enddate" Width="50px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="CTC" VisibleIndex="5" FieldName="ctc" Width="20px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Reporting Head" VisibleIndex="6" Width="150px"
                                            FieldName="reportHead">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Working Schedule" VisibleIndex="7" FieldName="workingHr"
                                            Width="20px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True"
                                        PageSize="20">
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
