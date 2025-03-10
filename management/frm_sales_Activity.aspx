<%@ page language="C#" autoeventwireup="true" inherits="management_frm_sales_Activity, App_Web_6bj03ldo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript">
      
var chkobj;
var objchk=null;
var obGenral=null;
function SignOff()
{
    window.parent.SignOff()
}
function height()
{
    window.frameElement.height = document.body.scrollHeight;
    window.frameElement.widht = document.body.scrollWidht;
}
function chkGenral(objGenral,val12)
{
    var st = document.getElementById("txtGrdContact")
        
    if (obGenral == null)
    {
      obGenral = objGenral;
    }
    else
    {
        obGenral.checked = false;
        obGenral = objGenral;
        obGenral.checked = true;
    }
    st.value = val12;
}
function ShowDetails(Userid) 
{
  
  window.location="frm_sales_Activity.aspx?id="+Userid;  
}
function frmOpenNewWindow()
{
    var val123=document.getElementById("txtAssigned").value;
    if(val123=="")
    {
        alert('Assign to can not be blank');
    } 
    else
    {
        ReturnAccording="Product";
        parent.OnMoreInfoClick("frmOfferedProduct_New.aspx?Type=Sales","ADD PRODUCT","950px","500px","Y");
    }
}

function funAddLead()
          
{ 
    var val123=document.getElementById("txtAssigned").value;
    if(val123=="")
    {
        alert('Assign to can not be blank');
    }
    else
    {   
         
        parent.OnMoreInfoClick("Add_LeadNew.aspx?Call=PhoneCall&user="+val123,"ADD LEAD","950px","500px","N");
    }          
}

function UserList()
{
 ReturnAccording="UserList";
 parent.OnMoreInfoClick("UserList.aspx","ADD USER","950px","500px","Y");
}
function GetUserList()
{
     var ob=document.getElementById("txtAssigned");
     return ob;
}
function GetHiddenUserList()
{
    var ob2=document.getElementById("hd1UserList");
    return ob2;
}
function callback()
{
  
  if(ReturnAccording=="UserList")
  {     
        
        document.getElementById('Button1').disabled =false;
  }
  else if(ReturnAccording=="Product")
  {  
        
        document.getElementById('btnSubmit').Enabled=true;
  }
  else if(ReturnAccording=="Allot")
  {
       var val=document.getElementById("hduser").value;
       ShowDetails(val);
  }
  
}
function windowopenform1(val)
{
   
    ReturnAccording="Allot";
    parent.OnMoreInfoClick("frmAllot_sales_new.aspx?Calling=Sales&id=" + val,"Allotment","950px","500px","Y");
    
}


    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Sales</span></strong>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <table class="TableMain100">
                        <tr id="ActivityRow" runat="server">
                            <td style="text-align: center;">
                                <asp:Panel ID="PanelActivitySales" runat="server" ScrollBars="Horizontal" Width="1000px">
                                    <dxwgv:ASPxGridView ID="ActivitySalesGrid" runat="server" AutoGenerateColumns="False"
                                        Width="100%">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn FieldName="User" ReadOnly="True" VisibleIndex="0">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Pending Acttivity" ReadOnly="True" VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Scheduled End Date" VisibleIndex="2" ReadOnly="True"
                                                Width="5%">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Expected End Date" ReadOnly="True" Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Pending Sales" VisibleIndex="3">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Pending MF" VisibleIndex="4">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Pending Ins" VisibleIndex="5">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Pending EQ" VisibleIndex="6">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Pending IPO" VisibleIndex="7">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Completed MF" VisibleIndex="8">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Completed Ins" VisibleIndex="9">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Completed EQ" VisibleIndex="10">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Completed IPO" VisibleIndex="11">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn VisibleIndex="13">
                                                <DataItemTemplate>
                                                    <a href="#" onclick="ShowDetails('<%#Eval("UserId") %>')">Detail</a>
                                                </DataItemTemplate>
                                                <EditFormSettings Visible="False" />
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles>
                                            <LoadingPanel ImageSpacing="10px">
                                            </LoadingPanel>
                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                            </Header>
                                            <Cell CssClass="gridcellleft">
                                            </Cell>
                                            <Header Font-Bold="true" ForeColor="black" CssClass="EHEADER" Border-BorderColor="AliceBlue">
                                            </Header>
                                            <AlternatingRow BackColor="White">
                                            </AlternatingRow>
                                        </Styles>
                                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                            <FirstPageButton Visible="True">
                                            </FirstPageButton>
                                            <LastPageButton Visible="True">
                                            </LastPageButton>
                                        </SettingsPager>
                                    </dxwgv:ASPxGridView>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnCreate" Text="Create" runat="server" CssClass="btnUpdate" OnClick="btnCreate_Click"
                                                Height="21px" />
                                            <asp:Button ID="btnModify" Visible="false" Text="Modify" runat="server" CssClass="btnUpdate"
                                                OnClick="btnModify_Click" Height="21px" /></td>
                                        <td class="mylabel1" align="right">
                                            <asp:Label ID="lblUserName" runat="server" Text="UserName :" Visible="False" Width="71px" ></asp:Label>
                                            <asp:Label ID="txtUser" runat="server" Width="162px"></asp:Label></td>
                                        <td class="mylabel1">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table width="100%">
                                    <tr>
                                        <td align="center" valign="top">
                                            <asp:Panel ID="pnlShowDetail" runat="server" Width="100%">
                                                <asp:GridView ID="grdDetail" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    BorderWidth="1px" BorderColor="#507CD1" ShowFooter="True" Width="100%" OnRowDataBound="grdDetail_RowDataBound">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <HeaderStyle Font-Bold="false" ForeColor="black" CssClass="EHEADER" BorderColor="AliceBlue"
                                                        BorderWidth="1px" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Activity">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkDetail" runat="server" />
                                                                <asp:Label ID="lblActivity" runat="server" Text='<%# Eval("Activity No")%>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" Wrap="False" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="gridheader" />
                                                </asp:GridView>
                                                <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
                                                <asp:Button ID="btnReassign" Text="Reassign" Visible="false" runat="server" CssClass="btnUpdate"
                                                    OnClick="btnReassign_Click" Height="21px" />
                                                <asp:Button ID="btnReschedule" Text="Reschedule" Visible="false" runat="server" CssClass="btnUpdate"
                                                    OnClick="btnReschedule_Click" Height="21px" />
                                                <asp:Button ID="btnShowDetail" Text="Show Detail" Visible="false" runat="server"
                                                    CssClass="btnUpdate" OnClick="btnShowDetail_Click" Height="21px" />
                                                <%--<asp:Button ID="btnDelegate" runat ="server" Text ="Delegate To" CssClass="btnUpdate" Visible ="false" />--%></asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Panel ID="pnlCall" runat="server" Visible="false" Width="100%">
                                                <%-- <table width="100%"><tr><td style="width:200px;">
                                      </td>
                                      <td>--%>
                                                <table class="TableMain100" style="border: 1px solid;">
                                                    <tr>
                                                        <td class="mylabel1">
                                                            Activity Type :</td>
                                                        <td class="lt">
                                                            <asp:DropDownList ID="drpActType" Enabled="false" AutoPostBack="true" runat="server"
                                                                Width="302px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="mylabel1" >
                                                            <asp:Label ID="Label1" runat="server" Text="Start Date/Start Time : " Width="138px"></asp:Label></td>
                                                        <td class="mylabel1">
                                                            <%--<asp:TextBox ID="txtStartDate" runat="server" Font-Size="10px" Width="140px"></asp:TextBox>
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/calendar.jpg" />--%>
                                                            <dxe:ASPxDateEdit ID="txtStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="true"
                                                                Width="202px">
                                                                <ButtonStyle Width="13px">
                                                                </ButtonStyle>
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="mylabel1">
                                                            Assign To :</td>
                                                        <td class="lt">
                                                            <asp:DropDownList ID="drpUserWork" runat="server" Width="100%" Visible="false">
                                                            </asp:DropDownList>
                                                            <asp:TextBox ID="txtAssigned" runat="server" onclick="UserList();" Height="19px"
                                                                Width="98%"></asp:TextBox><asp:HiddenField ID="hd1UserList" runat="server" />
                                                        </td>
                                                        <td class="mylabel1">
                                                            <asp:Label ID="Label3" runat="server" Text="End Date/End Time :" Width="188px"></asp:Label></td>
                                                        <td class="mylabel1">
                                                            <%--<asp:TextBox ID="txtEndDate" runat="server" Font-Size="10px" Width="140px"></asp:TextBox>
                                                       <asp:Image ID="Image2" runat="server" ImageUrl="~/images/calendar.jpg" />--%>
                                                            <dxe:ASPxDateEdit ID="txtEndDate" runat="server" EditFormat="Custom" UseMaskBehavior="true"
                                                                Width="202px">
                                                                <ButtonStyle Width="13px">
                                                                </ButtonStyle>
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="mylabel1">
                                                            Description :</td>
                                                        <td class="lt" style="width: 20%">
                                                            <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="2" runat="server" Width="295px"
                                                                Height="79px"></asp:TextBox>
                                                        </td>
                                                        <td class="mylabel1" >
                                                            <asp:Label ID="Label4" runat="server" Text="Priority :" Width="138px"></asp:Label></td>
                                                        <td class="lt">
                                                            <asp:DropDownList ID="drpPriority" runat="server" Width="186px">
                                                                <asp:ListItem Text="Low" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="High" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Urgent" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Immediate" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <input type="button" value="Add Lead" id="Button1" class="btnUpdate" onclick="funAddLead()"
                                                                style="height: 21px; width: 67px;" disabled="disabled" />
                                                            <input type="button" value="Add Product" id="Button2" name="Button2" class="btnUpdate"
                                                                visible="false" onclick="frmOpenNewWindow()" style="height: 21px; width: 104px;" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="mylabel1" style="width: 40%">
                                                            <asp:Label ID="Label2" runat="server" Text="Instruction Notes :" Width="110px"></asp:Label></td>
                                                        <td colspan="3" class="lt">
                                                            <asp:TextBox ID="txtInstNote" runat="server" TextMode="MultiLine" Rows="5" Columns="55"
                                                                Height="91px" Width="851px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" class="gridcellleft">
                                                            <asp:Button ID="btnSubmit" Text="Save" runat="server" CssClass="btnUpdate" OnClick="btnSubmit_Click"
                                                                Height="21px" />
                                                            <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btnUpdate" OnClick="btnCancel_Click"
                                                                Height="21px" />&nbsp;
                                                            <asp:TextBox ID="txtUserList" runat="server" BackColor="Transparent" BorderColor="Transparent"
                                                                BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <%--  </td>
                                             </tr></table>--%>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlActivityDetail" runat="server" Visible="false" Width="100%">
                                                <asp:GridView ID="grdActivityDetail" runat="server" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" BorderWidth="1px" BorderColor="#507CD1" ShowFooter="True" Width="100%">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <HeaderStyle Font-Bold="false" ForeColor="black" CssClass="EHEADER" BorderColor="AliceBlue"
                                                        BorderWidth="1px" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="ActivitySalesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>">
        </asp:SqlDataSource>
        <asp:HiddenField ID="hduser" runat="server" />
    </form>
</body>
</html>
