<%@ page language="C#" autoeventwireup="true" inherits="Reports_frm_rptEmpBDaydtls, App_Web_krnt_rtp" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
    
    function height() 
    { 
         if(document.body.scrollHeight>=500) 
             window.frameElement.height = document.body.scrollHeight;
         else
            window.frameElement.height = '500px'; 
            window.frameElement.Width= document.body.scrollWidth;
     }
     function noNumbers(e,txtBox)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
            {
                  return true;
            }
            else
            {
                 alert("Please Insert Numeric Only");
                 return false;
            }
         } 
         
        else if(e.which) // Netscape/Firefox/Opera
        {
            keynum = e.which 
            if(keynum>=48 && keynum<=57 || keynum==46)
            {
                return true;
            }
            else
            {
                alert("Please Insert Numeric Only");
                return false;
            }     
        }
        
    } 
    function FillGrid(obj)
    {
        grid.PerformCallback(obj);
    }
    function SetReminder(obj)
    {
         grid.PerformCallback(obj);
    }
    function RefreshReminder(obj)
    {
       if(obj=='REMINDER')
       {
            var x = top.frames['iFrmReminder'].ParentCall('Parent');
            alert('Reminder set successfully');
       }
       else if(obj=='ALREADYEXIST')
       {
            alert('You have already set a reminder for this employee');
       }

    }
    </script>

    <script type="text/javascript"> 
        $(document).ready(function() { 

            $(".water").each(function() { 
                if ($(this).val() == this.title) { 
                    $(this).addClass("opaque"); 
                } 
            }); 

            $(".water").focus(function() { 
                if ($(this).val() == this.title) { 
                    $(this).val(""); 
                    $(this).removeClass("opaque"); 
                }                 
            }); 

            $(".water").blur(function() { 
                if ($.trim($(this).val()) == "") { 
                    $(this).val(this.title); 
                    $(this).addClass("opaque"); 
                } 
                else { 
                    $(this).removeClass("opaque"); 
                } 
            }); 
        });       

    </script>

    <script type="text/javascript">
  (function($){
    // call setMask function on the document.ready event
      $(function(){
        $('input:text').setMask();
      }
    );
  })(jQuery);
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td colspan="5" class="EHEADER" align="center" style="font-weight: bold; color: Blue">
                    Forthcoming Birthdays and Anniversaries
                </td>
            </tr>
            <tr>
                <td style="width: 12%">
                    <asp:Label ID="Label2" runat="server" Text="Event Types:" CssClass="mylabel1"></asp:Label>
                </td>
                <td class="lt" style="width: 10%">
                    <asp:DropDownList ID="dpSelect" runat="server">
                        <asp:ListItem Text="Birth Days" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Marriage Anniversaries" Value="2"></asp:ListItem>
                    </asp:DropDownList></td>
                <td width="12%">
                    <asp:Label ID="Label1" CssClass="mylabel1" runat="server" Text="For the next:" Width="84px"></asp:Label></td>
                <td width="12%">
                    <asp:TextBox ID="txtDays" runat="server" Width="80px" CssClass="water" Text="Days"
                        ToolTip="Days" onkeypress="return noNumbers(event)"></asp:TextBox></td>
                <td>
                    <input id="Button1" type="button" value="Show" onclick="FillGrid('PC');" class="btnUpdate" />
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <dxwgv:ASPxGridView ID="grdDetails" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
                        Width="100%" OnCustomCallback="grdDetails_CustomCallback" OnCustomJSProperties="grdDetails_CustomJSProperties">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="Code" ReadOnly="true" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Designation" ReadOnly="True" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Branch" ReadOnly="True" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Department" ReadOnly="True" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="DateOfBirth" ReadOnly="True" VisibleIndex="5">
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom">
                                </PropertiesDateEdit>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="PhoneNumber" ReadOnly="True" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="MailId" ReadOnly="True" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Set Reminder" VisibleIndex="8">
                                <DataItemTemplate>
                                    <a href="#" onclick="SetReminder('<%#Eval("Code") %>')">SetReminder</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                        </Styles>
                        <SettingsPager ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <ClientSideEvents EndCallback="function(s,e){RefreshReminder(s.cpa);}" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
