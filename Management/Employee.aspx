<%@ page language="C#" autoeventwireup="true" inherits="management_Employee, App_Web_fxnvzv_8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Employee</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
    
    function SignOff()
    {
        window.parent.SignOff();
    }
    function Pageload()
    {
        document.getElementById('td1').style.display="inline";
        document.getElementById('td2').style.display="inline";
        document.getElementById('td3').style.display="inline";
        document.getElementById('td4').style.display="inline";
        HideTrTd("Tr_EmployeeName");
        HideTrTd("Tr_EmployeeCode");
        
    }
    function ShowTrTd(obj)
    {
       document.getElementById(obj).style.display='inline';
    }
    function HideTrTd(obj)
    {
        document.getElementById(obj).style.display='none';
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
        {
            window.frameElement.height = document.body.scrollHeight;
        }
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
   
    function OnMoreInfoClick(keyValue) 
    {
         var url='employee_general.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Modify Employee Details",'980px','500px',"Y");
    }
    function OnAddButtonClick() 
    {
         var url='Employee_AddNew.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url,"Add Employee Details",'980px','400px',"Y");
    }
    function OnLeftNav_Click()
    {
        var i=document.getElementById("A1").innerText;
        document.getElementById("hdn_GridBindOrNotBind").value="False"; //To Stop Bind On Page Load
        if(parseInt(i)>1)
        {   
            if(crbDOJ_Specific_All.GetValue()=="S")
                cGrdEmployee.PerformCallback("SearchByNavigation~"+cDtFrom.GetValue()+'~'+cDtTo.GetValue()+"~"+document.getElementById("A1").innerText+"~LeftNav");
            else
                cGrdEmployee.PerformCallback("SearchByNavigation~~~"+document.getElementById("A1").innerText+"~LeftNav");
        }
        else
        {
            alert('No More Pages.');
        }
    }
     function OnRightNav_Click()
     {
        var TestEnd=document.getElementById("A10").innerText;
        document.getElementById("hdn_GridBindOrNotBind").value="False"; //To Stop Bind On Page Load
        var TotalPage=document.getElementById("B_TotalPage").innerText;
        if(TestEnd=="" || TestEnd==TotalPage)
        {
             alert('No More Records.');
             return;
        }
        var i=document.getElementById("A1").innerText;
        if(parseInt(i)<TotalPage)
        {   
            if(crbDOJ_Specific_All.GetValue()=="S")
                cGrdEmployee.PerformCallback("SearchByNavigation~"+cDtFrom.GetValue()+'~'+cDtTo.GetValue()+"~"+document.getElementById("A1").innerText+"~RightNav");
            else
                cGrdEmployee.PerformCallback("SearchByNavigation~~~"+document.getElementById("A1").innerText+"~RightNav");
        }
        else
        {
            alert('You are at the End');
        }
     }
     function OnPageNo_Click(obj)
     {
        var i=document.getElementById(obj).innerText;
        document.getElementById("hdn_GridBindOrNotBind").value="False"; //To Stop Bind On Page Load
        if(crbDOJ_Specific_All.GetValue()=="S")
            cGrdEmployee.PerformCallback("SearchByNavigation~"+cDtFrom.GetValue()+'~'+cDtTo.GetValue()+"~"+i+"~PageNav");
        else
            cGrdEmployee.PerformCallback("SearchByNavigation~~~"+i+"~PageNav");
        
     }
     function BtnShow_Click()
    {
        document.getElementById("hdn_GridBindOrNotBind").value="False"; //To Stop Bind On Page Load
        if(crbDOJ_Specific_All.GetValue()=="S")
            cGrdEmployee.PerformCallback("Show~"+cDtFrom.GetValue()+'~'+cDtTo.GetValue());
        else
            cGrdEmployee.PerformCallback("Show~~~");
    }
    function GrdEmployee_EndCallBack()
    {
        if(cGrdEmployee.cpExcelExport!=undefined)
        {
            document.getElementById('BtnForExportEvent').click();                                    
        }
        if(cGrdEmployee.cpRefreshNavPanel!=undefined)
        {
            document.getElementById("B_PageNo").innerText='';
            document.getElementById("B_TotalPage").innerText='';
            document.getElementById("B_TotalRows").innerText='';
            
            var NavDirection=cGrdEmployee.cpRefreshNavPanel.split('~')[0];
            var PageNum=cGrdEmployee.cpRefreshNavPanel.split('~')[1];
            var TotalPage=cGrdEmployee.cpRefreshNavPanel.split('~')[2];
            var TotalRows=cGrdEmployee.cpRefreshNavPanel.split('~')[3];
            
            if(NavDirection=="RightNav")
            {
                PageNum=parseInt(PageNum)+10;
                document.getElementById("B_PageNo").innerText=PageNum;
                document.getElementById("B_TotalPage").innerText=TotalPage;
                document.getElementById("B_TotalRows").innerText=TotalRows;
                var n=parseInt(TotalPage)-parseInt(PageNum)>10?parseInt(11):parseInt(TotalPage)-parseInt(PageNum)+2;
                for(r=1;r<n;r++)
                {
                    var obj="A"+r;
                    document.getElementById(obj).innerText=PageNum++;
                }
                for(r=n;r<11;r++)
                {
                    var obj="A"+r;
                    document.getElementById(obj).innerText="";
                }
            }
            if(NavDirection=="LeftNav")
            {
                if(parseInt(PageNum)>1)
                {   
                    PageNum=parseInt(PageNum)-10;
                    document.getElementById("B_PageNo").innerText=PageNum;
                    document.getElementById("B_TotalPage").innerText=TotalPage;
                    document.getElementById("B_TotalRows").innerText=TotalRows;
                    for(l=1;l<11;l++)
                    {
                        var obj="A"+l;
                        document.getElementById(obj).innerText=PageNum++;
                    }
                }
                else
                {
                    alert('No More Pages.');
                }
            }
            if(NavDirection=="PageNav")
            {
                document.getElementById("B_PageNo").innerText=PageNum;
                document.getElementById("B_TotalPage").innerText=TotalPage;
                document.getElementById("B_TotalRows").innerText=TotalRows;
            }
            if(NavDirection=="ShowBtnClick")
            {
                document.getElementById("B_PageNo").innerText=PageNum;
                document.getElementById("B_TotalPage").innerText=TotalPage;
                document.getElementById("B_TotalRows").innerText=TotalRows;
                var n=parseInt(TotalPage)-parseInt(PageNum)>10?parseInt(11):parseInt(TotalPage)-parseInt(PageNum)+2;
                
                for(r=1;r<n;r++)
                {
                    var obj="A"+r;
                    document.getElementById(obj).innerText=PageNum++;
                }
                
                for(r=n;r<11;r++)
                {
                    var obj="A"+r;
                    document.getElementById(obj).innerText="";
                }
                 
            }
        }
        if(cGrdEmployee.cpCallOtherWhichCallCondition!=undefined)
        {
            if(cGrdEmployee.cpCallOtherWhichCallCondition=="Show")
            {
                if(crbDOJ_Specific_All.GetValue()=="S")
                    cGrdEmployee.PerformCallback("Show~"+cDtFrom.GetValue()+'~'+cDtTo.GetValue());
                else
                    cGrdEmployee.PerformCallback("Show~~~");
            }
        }
        //Now Reset GridBindOrNotBind to True for Next Page Load
        document.getElementById("hdn_GridBindOrNotBind").value="True";
        height();
     }
     function selecttion()
      {
         var combo=document.getElementById('cmbExport');
         combo.value='Ex';
      } 
    
    function OnContactInfoClick(keyValue,CompName)
    {
        var url='insurance_contactPerson.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Employee Name : "+CompName+"",'980px','550px',"Y");
    }
    function Callheight()
    {
        height();
    } 
        
     function ShowEmployeeFilterForm(obj)
     {
        if(obj=='A')
        {
            document.getElementById('td1').style.display="none";
            document.getElementById('td2').style.display="none";
            document.getElementById('td3').style.display="none";
            document.getElementById('td4').style.display="none";
        }
        if(obj=='S')
        {
            
            document.getElementById('td1').style.display="inline";
            document.getElementById('td2').style.display="inline";
            document.getElementById('td3').style.display="inline";
            document.getElementById('td4').style.display="inline";
        }
        
     }
     function ShowFindOption()
     {
        if(cRb_SearchBy.GetValue()=="N")
        {
            HideTrTd("Tr_EmployeeName")
            HideTrTd("Tr_EmployeeCode")
        }
        else if(cRb_SearchBy.GetValue()=="EN")
        {
            ShowTrTd("Tr_EmployeeName")
            HideTrTd("Tr_EmployeeCode")
        }
        else if(cRb_SearchBy.GetValue()=="EC")
        {
            HideTrTd("Tr_EmployeeName")
            ShowTrTd("Tr_EmployeeCode")
        }
     }
    function ddlExport_OnChange()
    {
        var ddlExport=document.getElementById("<%=ddlExport.ClientID%>");  
        if(crbDOJ_Specific_All.GetValue()=="S")
            cGrdEmployee.PerformCallback("ExcelExport~"+cDtFrom.GetValue()+'~'+cDtTo.GetValue());
        else
            cGrdEmployee.PerformCallback("ExcelExport~~~");
        ddlExport.options[0].selected=true; 
    }
    
    function ShowHideFilter(obj)
    {
        document.getElementById("hdn_GridBindOrNotBind").value="False"; //To Stop Bind On Page Load
        cGrdEmployee.PerformCallback("ShowHideFilter~"+cDtFrom.GetValue()+'~'+cDtTo.GetValue()+'~'+obj);
    }
        
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center; height: 20px;">
                    <strong><span style="color: #000099">Employee Details</span></strong></td>
            </tr>
            <tr>
                <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr id="trSpecific">
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="vertical-align: top">
                                            Date Of Joining :</td>
                                        <td valign="top" style="vertical-align: top">
                                            <dxe:ASPxRadioButtonList ID="rbDOJ_Specific_All" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                                ClientInstanceName="crbDOJ_Specific_All" RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                                <items>
                                            
                                            <dxe:ListEditItem Text="Specific" Value="S" />
                                            <dxe:ListEditItem Text="All" Value="A" />
                                        </items>
                                                <clientsideevents valuechanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}" />
                                                <border borderwidth="0px" />
                                            </dxe:ASPxRadioButtonList>
                                        </td>
                                        <td align="right" valign="middle" id="td1" class="gridcellleft" bgcolor="#B7CEEC" style="vertical-align: top">
                                            &nbsp;From :</td>
                                        <td valign="middle" class="gridcellleft" id="td2" style="vertical-align: top">
                                            <dxe:ASPxDateEdit ID="DtFrom" ClientInstanceName="cDtFrom" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True">
                                                <buttonstyle width="13px"></buttonstyle>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td valign="middle" align="right" id="td3" class="gridcellleft" bgcolor="#B7CEEC" style="vertical-align: top">
                                           To:</td>
                                        <td valign="middle" class="gridcellleft" id="td4" style="vertical-align: top">
                                            <dxe:ASPxDateEdit ID="DtTo" ClientInstanceName="cDtTo" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True">
                                                <buttonstyle width="13px"></buttonstyle>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#b7ceec" class="gridcellleft" style="vertical-align: top">
                                            Search By :</td>
                                        <td style="vertical-align: top" valign="top">
                                            <dxe:ASPxRadioButtonList ID="Rb_SearchBy" runat="server" ItemSpacing="10px" RepeatDirection="Horizontal"
                                                TextWrap="False" Font-Size="10px" ClientInstanceName="cRb_SearchBy" SelectedIndex="0">
                                                <border borderwidth="0px" />
                                                <clientsideevents valuechanged="function(s, e) {ShowFindOption();}" />
                                                <items>
                                                    <dxe:ListEditItem Text="None" Value="N"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Employee Name" Value="EN"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Employee Code" Value="EC"></dxe:ListEditItem>
                                                </items>
                                            </dxe:ASPxRadioButtonList></td>
                                        <td align="right" bgcolor="#b7ceec" class="gridcellleft" style="vertical-align: top"
                                            valign="middle">
                                        </td>
                                        <td class="gridcellleft" style="vertical-align: top" valign="middle">
                                            <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="False" Text="Show" Width="85px">
                                                    <clientsideevents click="function (s, e) {BtnShow_Click();}" />
                                                </dxe:ASPxButton></td>
                                        <td align="right"  class="gridcellleft" style="vertical-align: top"
                                            valign="middle">
                                        </td>
                                        <td class="gridcellleft" style="vertical-align: top" valign="middle">
                                        </td>
                                    </tr>
                                    <tr id="tr_EmployeeName">
                                        <td bgcolor="#b7ceec" class="gridcellleft" style="vertical-align: top">
                                            Employee Name :</td>
                                        <td style="vertical-align: top" valign="top">
                                            <asp:TextBox ID="txtEmpName" onFocus="this.select()" runat="server"></asp:TextBox></td>
                                        <td align="right" bgcolor="#b7ceec" class="gridcellleft" style="vertical-align: top"
                                            valign="middle">
                                            Find Option</td>
                                        <td class="gridcellleft" style="vertical-align: top" valign="middle">
                                            <dxe:ASPxComboBox ID="cmbEmpNameFindOption" runat="server" BackColor="Gray"
                                                ClientInstanceName="exp" Font-Bold="False" ForeColor="White"
                                                SelectedIndex="0" ValueType="System.Int32" Width="130px">
                                                <items>
                                                    <dxe:ListEditItem Value="0" Text="Like"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Value="1" Text="Whole Word"></dxe:ListEditItem>
                                                </items>
                                                <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                                                    </buttonstyle>
                                                <itemstyle backcolor="Navy" forecolor="White">
                                                <HoverStyle BackColor="#8080FF" ForeColor="White">
                                                </HoverStyle>
                                            </itemstyle>
                                                <border bordercolor="White"></border>
                                                
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td align="right"  class="gridcellleft" style="vertical-align: top"
                                            valign="middle">
                                            </td>
                                        <td class="gridcellleft" style="vertical-align: top" valign="middle">
                                        </td>
                                    </tr>
                                    <tr id="tr_EmployeeCode">
                                        <td bgcolor="#b7ceec" class="gridcellleft" style="vertical-align: top">
                                            Employee Code :</td>
                                        <td style="vertical-align: top" valign="top">
                                            <asp:TextBox ID="txtEmpCode" onFocus="this.select()" runat="server"></asp:TextBox></td>
                                        <td align="right" bgcolor="#b7ceec" class="gridcellleft" style="vertical-align: top"
                                            valign="middle">
                                            Find Option</td>
                                        <td class="gridcellleft" style="vertical-align: top" valign="middle">
                                        <dxe:ASPxComboBox ID="cmbEmpCodeFindOption"  runat="server" BackColor="Gray"
                                                ClientInstanceName="exp" Font-Bold="False" ForeColor="White"
                                                SelectedIndex="0" ValueType="System.Int32" Width="130px">
                                            <items>
                                                    <dxe:ListEditItem Value="0" Text="Like"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Value="1" Text="Whole Word"></dxe:ListEditItem>
                                                </items>
                                            <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                                                    </buttonstyle>
                                            <itemstyle backcolor="Navy" forecolor="White">
                                                <HoverStyle BackColor="#8080FF" ForeColor="White">
                                                </HoverStyle>
                                            </itemstyle>
                                            <border bordercolor="White"></border>
                                            
                                        </dxe:ASPxComboBox></td>
                                        <td align="right" class="gridcellleft" style="vertical-align: top"
                                            valign="middle">
                                        </td>
                                        <td class="gridcellleft" style="vertical-align: top" valign="middle">
                                        </td>
                                    </tr>
                                </table>
                    <table>
                        <tr>
                            <td id="Td5">
                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                    Show Filter</span></a>
                            </td>
                            <td id="Td6">
                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                    All Records</span></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 60%" border="1">
                        <tr>
                            <td valign="top" style="vertical-align: top; width: 34px; background-color: #b7ceec;
                                text-align: left">
                                Page</td>
                            <td valign="top" style="width: 4px">
                                <b style="text-align: right" id="B_PageNo" runat="server"></b>
                            </td>
                            <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left;">
                                Of
                            </td>
                            <td valign="top">
                                <b style="text-align: right" id="B_TotalPage" runat="server"></b>
                            </td>
                            <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                ( <b style="text-align: right" id="B_TotalRows" runat="server"></b>&nbsp;items )
                            </td>
                            <td valign="top">
                                <table width="100%">
                                    <tr>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A_LeftNav" runat="server" href="javascript:void(0);" onclick="OnLeftNav_Click()">
                                                <img src="../images/LeftNav.gif" width="10" />
                                            </a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A1" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A1')">
                                                1</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A2" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A2')">
                                                2</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A3" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A3')">
                                                3</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A4" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A4')">
                                                4</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A5" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A5')">
                                                5</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A6" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A6')">
                                                6</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A7" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A7')">
                                                7</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A8" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A8')">
                                                8</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A9" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A9')">
                                                9</a>
                                        </td>
                                        <td valign="top" style="vertical-align: top; background-color: #b7ceec; text-align: left">
                                            <a id="A10" runat="server" href="javascript:void(0);" onclick="OnPageNo_Click('A10')">
                                                10</a>
                                        </td>
                                        <td style="text-align: right; vertical-align: top; background-color: #b7ceec;" valign="top">
                                            <a id="A_RightNav" runat="server" href="javascript:void(0);" onclick="OnRightNav_Click()">
                                                <img src="../images/RightNav.gif" width="10" />
                                            </a>
                                        </td>
                                        <td style="vertical-align: top; background-color: #b7ceec; text-align: right" valign="top">
                                            <asp:DropDownList ID="ddlExport" Onchange="ddlExport_OnChange()" runat="server" Font-Size="10px"
                                                Width="100px" >
                                                <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                                                <asp:ListItem Value="1">Excel</asp:ListItem>
                                            </asp:DropDownList></td>
                                       
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="GrdEmployee" runat="server" KeyFieldName="cnt_id" AutoGenerateColumns="False"
                        Width="1156px" ClientInstanceName="cGrdEmployee" OnCustomCallback="GrdEmployee_CustomCallback" 
                        OnProcessColumnAutoFilter="GrdEmployee_ProcessColumnAutoFilter">
                        <ClientSideEvents EndCallback="function(s, e) {GrdEmployee_EndCallBack();}" />
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ColumnResizeMode="NextColumn" AutoFilterRowInputDelay="100000" />
                        <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Row Wrap="False">
                            </Row>
                            <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977"></FocusedRow>
                            <AlternatingRow Enabled="True"></AlternatingRow>
                        </Styles>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="0" Caption="Details" Width="75px" FixedStyle="Left">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        More Info...</a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                      { %>
                                    <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Srl." FieldName="SRLNO"
                                VisibleIndex="1" Width="20px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="Name"
                                VisibleIndex="2" Width="150px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Father's Name" FieldName="FatherName"
                                VisibleIndex="3" Width="150px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="DOJ" FieldName="DOJ"
                                VisibleIndex="4" Width="75px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Actv-DeActv" FieldName="DOL"
                                VisibleIndex="4" Width="75px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Department" FieldName="Department"
                                VisibleIndex="5" Width="120px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Branch" FieldName="BranchName"
                                VisibleIndex="6" Width="75px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="CTC" FieldName="CTC"
                                VisibleIndex="7" Width="75px">
                                <CellStyle CssClass="gridcellleft" Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="ReportTo" FieldName="ReportTo"
                                VisibleIndex="8" Width="150px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Designation" FieldName="Designation"
                                VisibleIndex="9" Width="150px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Company" FieldName="Company"
                                VisibleIndex="10" Width="150px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="EmailId(s)" FieldName="Email_Ids"
                                VisibleIndex="11" Width="150px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Phone/Mobile" FieldName="PhoneMobile_Numbers"
                                VisibleIndex="12" Width="75px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="PanCard" FieldName="PanCardNumber"
                                VisibleIndex="13" Width="75px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="CreatedBy" FieldName="CreatedBy"
                                VisibleIndex="14" Width="75px">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="ContactID" FieldName="ContactID"
                                VisibleIndex="14" Width="75px" Visible="False">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn Visible="False">
                                <DeleteButton Visible="True" Text="Delete">
                                </DeleteButton>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="15" Caption="Cont.Person">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnContactInfoClick('<%#Eval("ContactID") %>','<%#Eval("Name") %>')">
                                        Show</a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                        <SettingsText PopupEditFormCaption="Add/ Modify Employee" ConfirmDelete="Are you sure to delete?" />
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" ShowHorizontalScrollBar="True" />
                        <SettingsLoadingPanel Text="Please Wait..." />
                    </dxwgv:ASPxGridView>
                 
                </td>
            </tr>
        </table>
        <br />
        <asp:HiddenField ID="hdn_GridBindOrNotBind" runat="server" />
        <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged" BackColor="#DDECFE" BorderStyle="None"  />
    </form>
</body>
</html>
