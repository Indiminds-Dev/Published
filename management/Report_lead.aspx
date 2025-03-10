<%@ page language="C#" autoeventwireup="true" inherits="management_Report_lead, App_Web_xu-hjjp9" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
  <script language="javascript" type="text/javascript">
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

    function AtTheTimePageLoad()
    {
        FieldName = 'ASPxPageControl1_cmbLegalStatus';
        document.getElementById("txtName_hidden").style.display='none';
        document.getElementById("cmbArea").style.display='none';
        document.getElementById("cmbCity").style.display='none';
        document.getElementById("txtName").style.display = 'none';
    }
    function atpagecgange()
    {
        document.getElementById("txtName_hidden").style.display='none';
        FieldName = 'ASPxPageControl1_cmbLegalStatus';
    }
    function hidetextbox()
    {
        document.getElementById("txtName_hidden").style.display='none';
        FieldName = 'ASPxPageControl1_cmbLegalStatus';
    }
    function CallList(obj1,obj2,obj3)
    {
        FieldName = 'cmbCity';
        var obj4=document.getElementById("cmbSourceType");
        var obj5=obj4.value;
        ajax_showOptions(obj1,obj2,obj3,obj5);
    }
    function SourceTypeChange(obj)
    {
        if(obj=="All")
        {
            var txtName = document.getElementById("txtName");
            txtName.value = '';
            document.getElementById("txtName").style.display = 'none';
        }
        else
        {
            var txtName = document.getElementById("txtName");
            txtName.value = '';
            document.getElementById("txtName").style.display = 'inline';
        }
    } 
    function StateChange(obj)
    {
        if(obj != 'All')
        {
            var sendData='City~'+obj;
            CallServer(sendData,""); 
        }
        else
        {
            var cmbCity = document.getElementById("cmbCity");
            cmbCity.length=0;
            document.getElementById("cmbCity").style.display='none';
            var cmbArea = document.getElementById("cmbArea");
            cmbArea.length=0;
            document.getElementById("cmbArea").style.display='none';
        }
    }
    function CityChange(obj)
    {
        if(obj != 'All')
        {
            var sendData='Area~'+obj;
            CallServer(sendData,""); 
        }
        else
        {
            var cmbArea = document.getElementById("cmbArea");
            cmbArea.length=0;
            document.getElementById("cmbArea").style.display='none';
        }
    }
    function ReceiveServerData(rValue)
    {
        var DATA = rValue.split('~'); 
        //alert(rValue); 
        if(DATA[0]=='City')
        {
            var cmbCity = document.getElementById("cmbCity");
            if(DATA[1]=='Y')
            {
                document.getElementById("cmbArea").style.display='none';
                document.getElementById("cmbCity").style.display='inline';
                cmbCity.length=0;
                var llistItem = DATA[2].split('!')
                var i;
                var opt1 = document.createElement("option");
                    opt1.text = 'All';
                    opt1.value = 'All';
                    cmbCity.options.add(opt1);
                for(i=0;i<llistItem.length;i++)
                {
                    var items = llistItem[i].split(',');
                    var opt = document.createElement("option");
                    opt.text = items[1];
                    opt.value = items[0];
                    cmbCity.options.add(opt);
                }
                document.getElementById("cmbCity").focus();
                //CityChange(cmbCity.value);
            }
            else
            {
                alert('There is no City Respect to the selected Satae!!');
                cmbCity.length=0;
            }
        }
        if(DATA[0]=='Area')
        {
            var cmbArea = document.getElementById("cmbArea");
            if(DATA[1]=='Y')
            {
                document.getElementById("cmbArea").style.display='inline';
                cmbArea.length=0;
                var llistItem = DATA[2].split('!')
                var i;
                var opt1 = document.createElement("option");
                    opt1.text = 'All';
                    opt1.value = 'All';
                    cmbArea.options.add(opt1);
                for(i=0;i<llistItem.length;i++)
                {
                    var items = llistItem[i].split(',');
                    var opt = document.createElement("option");
                    opt.text = items[1];
                    opt.value = items[0];
                    cmbArea.options.add(opt);
                }
                document.getElementById("cmbArea").focus();
                //CityChange(cmbCity.value);
            }
            else
            {
                alert('There is no City Respect to the selected Satae!!');
                cmbCity.length=0;
            }
        }
    }
</script>

    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <table class="TableMain100">
        <tr>
            <td class="EHEADER" colspan="4" style="text-align:center;">
                <strong><span style="color: #000099">Lead Report</span></strong>
            </td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">Report Type:</span>
            </td>
            <td class="gridcellleft"colspan="3">
                <asp:RadioButtonList ID="rdbReport" runat="server" Height="17px" RepeatDirection="Horizontal"
                    Width="131px">
                    <asp:ListItem Selected="True">Custom</asp:ListItem>
                    <asp:ListItem>Detail</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">Age Range:</span>
            </td>
            <td class="gridcellleft">
                Min: &nbsp;<asp:DropDownList ID="cmbStarYear" runat="server" Width="52px" Font-Size="10px"></asp:DropDownList>
                &nbsp; &nbsp;&nbsp; Max: &nbsp;<asp:DropDownList ID="cmbEndYear" runat="server" Width="52px" Font-Size="10px"></asp:DropDownList>
            </td>
            <td class="gridcellright">
                <span style="color: #000099">Profession:</span>
            </td>
            <td class="gridcellleft">
                <asp:DropDownList ID="cmbProfession" runat="server" Width="253px" Font-Size="10px"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">Marital Status:</span>
            </td>
            <td class="gridcellleft">
                <asp:DropDownList ID="cmbMaritalStatus" runat="server" Width="253px" Font-Size="10px"></asp:DropDownList>
                
            </td>
            <td class="gridcellright">
                <span style="color: #000099">Legal Status:</span>
            </td>
            <td class="gridcellleft">
                <asp:DropDownList ID="cmbLegalStatus" runat="server" Width="253px" Font-Size="10px"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">Source Type:</span>
            </td>
            <td class="gridcellleft">
                <asp:DropDownList ID="cmbSourceType" runat="server" Width="253px" Font-Size="10px"></asp:DropDownList>
                
            </td>
            <td class="gridcellright">
                <span style="color: #000099">Source Name:</span>
            </td>
            <td class="gridcellleft">
                <asp:TextBox ID="txtName" runat="server" Width="249px"></asp:TextBox><asp:TextBox ID="txtName_hidden"
                    runat="server" Width="12px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">State:</span>
            </td>
            <td class="gridcellleft">
                <asp:DropDownList ID="cmbState" runat="server" Width="253px" Font-Size="10px" AutoPostBack="True" OnSelectedIndexChanged="cmbState_SelectedIndexChanged"></asp:DropDownList>
                
            </td>
            <td class="gridcellright">
                <span style="color: #000099">City:</span>
            </td>
            <td class="gridcellleft">
                <asp:DropDownList ID="cmbCity" runat="server" Width="253px" Font-Size="10px" AutoPostBack="True" OnSelectedIndexChanged="cmbCity_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">Area:</span>
            </td>
            <td class="gridcellleft">
                <asp:DropDownList ID="cmbArea" runat="server" Width="253px" Font-Size="10px"></asp:DropDownList>
                
            </td>
            <td class="gridcellright">
            </td>
            <td class="gridcellleft">
                
            </td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">From Date:</span>
            </td>
            <td class="gridcellleft">
                <%--<asp:TextBox id="txtFromDate" tabIndex="19" runat="server" Width="146px"></asp:TextBox>&nbsp;<asp:Image id="imgFromDate" runat="server" ImageUrl="~/images/calendar.jpg"></asp:Image>--%>
             <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <DropDownButton Text="From">
                                            </DropDownButton>
                <ValidationSettings ErrorText="Required.">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
                                        </dxe:ASPxDateEdit>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFromDate"
                    Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
            <td class="gridcellright">
                <span style="color: #000099">To Date:</span>
            </td>
            <td class="gridcellleft">
               <%-- <asp:TextBox id="txtToDate" tabIndex="19" runat="server" Width="146px"></asp:TextBox>&nbsp;<asp:Image id="imgToDate" runat="server" ImageUrl="~/images/calendar.jpg"></asp:Image>--%>
               <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <DropDownButton Text="To">
                                            </DropDownButton>
                <ValidationSettings ErrorText="Required." SetFocusOnError="True">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
                                        </dxe:ASPxDateEdit>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtToDate"
                    Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="gridcellright">
            </td>
            <td class="gridcellleft">
                </td>
            <td class="gridcellright">
            </td>
            <td class="gridcellleft">
                <asp:Button ID="btnGetReport" runat="server" Text="Get Report"  CssClass="btnUpdate" OnClick="btnGetReport_Click" Height="19px"/>
            </td>
            
        </tr>
        <tr>
            <td colspan="4" align="center">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"
                    DisplayGroupTree="False" Height="50px"  Width="350px" />
               
                
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
