<%@ page language="C#" autoeventwireup="true" inherits="management_frm_recruitmentActivity_employee, App_Web_5uqmplyf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
   
function OnMoreInfoClick(keyValue) {
     var url='frm_recruitmentActivity_employee_detail.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Activity",'940px','450px',"Y");

    }
    var chkobj;
    var objchk=null;
    function chkclicked(obj,msg12)
    {
        //var txt = document.getElementById("hiddenleadid")
        if (objchk == null)
        {
            objchk = obj;
            objchk.checked = true;
        }
        else
        {
            objchk.checked = false;
            objchk = obj;
            objchk.checked = true;
        }
        //txt.value = msg12;
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="GridUserInfo" runat="server" Width="100%" ActiveTabIndex="0" >
                        <TabPages>
                            <dxtc:TabPage Name="General" Text="General">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <dxwgv:ASPxGridView ID="GridNewActivity" runat="server" Width="100%" AutoGenerateColumns="False"
                                            KeyFieldName="UserId">
                                            <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                            <Styles>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                                <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                                </Header>
                                            </Styles>
                                            <Settings ShowGroupPanel="True"></Settings>
                                            <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                            <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </SettingsPager>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn FieldName="UserId" Caption="User Id" ReadOnly="True"
                                                    Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="SNo" Caption="Sl.No." VisibleIndex="0">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="User" Caption="User" VisibleIndex="1">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Pending Acttivity" VisibleIndex="2">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Scheduled End Date" VisibleIndex="3">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Expected End Date" VisibleIndex="4">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Vacancies" VisibleIndex="5">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Candidate Screened" Caption="Candt. Screened"
                                                    VisibleIndex="11">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Interviewed" VisibleIndex="6">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Selected" VisibleIndex="7">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Eliminated" VisibleIndex="8">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Selected" VisibleIndex="9">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Pending Call" Caption="Pending" VisibleIndex="10">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Detail" VisibleIndex="12">
                                                    <DataItemTemplate>
                                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                            More Info...</a>
                                                    </DataItemTemplate>
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                        </dxwgv:ASPxGridView>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Create" Text="Create">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <table  class="TableMain100" width="100%">
                                            <tr class="EHEADER">
                                                <td class="ColHead">
                                                    <span style="color: #3300cc"><strong>Candidate Detail</strong></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="gridcellleft">
                                                    <table>
                                                        <tr>
                                                            <td style="height: 16px; text-align: right">
                                                                <span class="Ecoheadtxt">Activity Type:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpActType" runat="server" Width="203px" Font-Size="10px" TabIndex="1">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="height: 16px; text-align: right">
                                                                <span class="Ecoheadtxt">Start Date/Start Time:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <dxe:ASPxDateEdit ID="txtStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" TabIndex="2" >
                                                                    <ButtonStyle Width="13px">
                                                                    </ButtonStyle>
                                                                </dxe:ASPxDateEdit>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStartDate"
                                                                    Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Assign To:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpUserWork" runat="server" Width="203px" Font-Size="10px"
                                                                    TabIndex="3">
                                                                </asp:DropDownList></td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">End Date/Time:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <dxe:ASPxDateEdit ID="txtEndDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" TabIndex="4">
                                                                    <ButtonStyle Width="13px">
                                                                    </ButtonStyle>
                                                                </dxe:ASPxDateEdit>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEndDate"
                                                                    Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Description:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:TextBox ID="txtDesc" runat="server" Width="198px" Font-Size="10px" TabIndex="5"
                                                                    Height="35px" TextMode="MultiLine"></asp:TextBox>&nbsp;
                                                            </td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Priority:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpPriority" runat="server" Width="203px" Font-Size="10px"
                                                                    TabIndex="6">
                                                                    <asp:ListItem Text="Low" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="High" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="Urgent" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="Immediate" Value="4"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Company:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpCompany" runat="server" Width="203px" Font-Size="10px" TabIndex="7">
                                                                </asp:DropDownList></td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Department:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpDepartment" runat="server" Width="203px" Font-Size="10px"
                                                                    TabIndex="8">
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Branch:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpBranch" runat="server" Width="203px" Font-Size="10px" TabIndex="9">
                                                                </asp:DropDownList></td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Job Responsibility:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpJobResponsbility" runat="server" Width="203px" Font-Size="10px"
                                                                    TabIndex="10">
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Designation:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpDesignation" Width="203px" Font-Size="10px" runat="server"
                                                                    TabIndex="11">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Vacancies:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:TextBox ID="txtVacancies" runat="server" Width="200px" Font-Size="10px" TabIndex="12"
                                                                    Text="1"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Educational Qualification:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpEducation" runat="server" Width="203px" Font-Size="10px"
                                                                    TabIndex="13">
                                                                </asp:DropDownList></td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Professional Qualification:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpProfessional" Width="203px" Font-Size="10px" runat="server"
                                                                    TabIndex="14">
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Minimum Experience (Yrs):</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:TextBox ID="txtExp" runat="server" Width="200px" Font-Size="10px" TabIndex="15"
                                                                    Text="0"></asp:TextBox></td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Sex:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpSex" Width="203px" Font-Size="10px" runat="server" TabIndex="16">
                                                                    <asp:ListItem Text="No Preference" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="FeMale" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">CTC Range:</span>
                                                            </td>
                                                            <td class="gridcellleft" style="text-align: center">
                                                                Min<asp:TextBox ID="txtMin" runat="server" Text="0" Width="66px" Font-Size="10px"
                                                                    TabIndex="17"></asp:TextBox>
                                                                &nbsp; &nbsp;&nbsp; Max<asp:TextBox ID="txtMax" runat="server" Text="0" Width="66px"
                                                                    Font-Size="10px" TabIndex="18" />
                                                            </td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Age Group:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                Min<asp:TextBox Font-Size="10px" ID="txtMinAge" runat="server" Text="18" Width="50px"
                                                                    TabIndex="19"></asp:TextBox>
                                                                &nbsp; &amp; &nbsp;&nbsp; Max<asp:TextBox Font-Size="10px" ID="txtMaxAge" runat="server"
                                                                    Text="18" Width="50px" TabIndex="20" />Years
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                <span class="Ecoheadtxt">Skills:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:TextBox ID="txtSkills" runat="server" Width="200px" Font-Size="10px" TabIndex="21"></asp:TextBox></td>
                                                            <td style="width: 17px; height: 21px;">
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <span class="Ecoheadtxt">Hobbies:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:TextBox ID="txtHobbies" runat="server" Width="200px" Font-Size="10px" TabIndex="22"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                <span class="Ecoheadtxt">ExtCurrent Activities:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:TextBox ID="txtCurAct" runat="server" Font-Size="10px" Width="200px" TabIndex="23"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 17px;">
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <span class="Ecoheadtxt">Locality Preferences:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:TextBox ID="txtLocality" runat="server" Font-Size="10px" Width="200px" TabIndex="24"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Join by Date:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <dxe:ASPxDateEdit ID="txtJoinDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" TabIndex="25">
                                                                    <ButtonStyle Width="13px">
                                                                    </ButtonStyle>
                                                                </dxe:ASPxDateEdit>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJoinDate"
                                                                    Display="Dynamic" EnableTheming="True" ErrorMessage="Date required!" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Industry:</span>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:DropDownList ID="drpIndustry" Width="203px" Font-Size="10px" runat="server"
                                                                    TabIndex="26">
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <span class="Ecoheadtxt">Instruction Notes:</span>
                                                            </td>
                                                            <td class="gridcellleft" colspan="4">
                                                                <asp:TextBox ID="txtInstNote" runat="server" TextMode="MultiLine" Width="558px" Font-Size="10px"
                                                                    TabIndex="27" Height="96px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>&nbsp;</td>
                                                            <td style="width: 17px">
                                                            </td>
                                                            <td colspan="2" class="gridcellleft">
                                                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                                                    TabIndex="28" ValidationGroup="a" />
                                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClick="btnCancel_Click"
                                                                    TabIndex="29" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Text="Selected Candidate">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="grdSelectedCandidate" AutoGenerateColumns="False" runat="server"
                                                        AllowPaging="True" BackColor="White" Font-Bold="False" BorderColor="Blue" Width="99%"
                                                        BorderStyle="Outset" BorderWidth="1px" CellPadding="2" Font-Overline="False"
                                                        OnRowDataBound="grdDetail_RowDataBound">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                        <HeaderStyle Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue"
                                                            Font-Size="10px" />
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk1" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Candidate Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Position">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPosition" runat="server" Text='<%# Eval("JobResponsibility") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Department">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Department") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Branch">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Eval("Branch") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Join Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJoinDate" runat="server" Text='<%# Eval("JoinDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Offer Letter Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblOfferLetter" runat="server" Text='<%# Eval("OfferLetterDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Aggrement Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAggrementDate" runat="server" Text='<%# Eval("AggrementDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Phone No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Email">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:Button ID="btnGenerateCode" runat="server" Text="Generate Code" CssClass="btnUpdate"
                                                        OnClick="btnGenerateCode_Click" />
                                                    <asp:Button ID="btnCancelOffer" runat="server" Text="Cancel Offer" CssClass="btnUpdate"
                                                        OnClick="btnCancelOffer_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                        </TabPages>
                        <ContentStyle>
                            <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#002D96"></Border>
                        </ContentStyle>
                        <LoadingPanelStyle ImageSpacing="6px">
                        </LoadingPanelStyle>
                        <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                                        height();
                                                        }" />
                    </dxtc:ASPxPageControl>
                </td>
            </tr>
        </table>
        <table width="90%">
            <tr>
                <td>
                    <asp:Panel ID="pnlCall" runat="server"  Width="100%">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="hdUserList" runat="server" />
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
