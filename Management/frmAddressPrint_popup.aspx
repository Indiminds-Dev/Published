<%@ page language="C#" autoeventwireup="true" inherits="management_frmAddressPrint_popup, App_Web_bfdn6hbr" enableeventvalidation="false" %>
<%@ import Namespace="System.Drawing" %> 
<%@ import Namespace="System.Drawing.Imaging" %>
<%@ import Namespace="System.Data" %> 
<%@ import Namespace="System.Data.OleDb" %> 


<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Address Report Page </title>
    <script type="text/javascript">
        function onPage()
        {
            window.focus();
            self.print();
        }
         function height()
     {
  
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    </script>
</head>
<body onload="javascript:onPage();">
    <form id="form1" runat="server">
    <div>
        <dxdv:ASPxDataView ID="ASPxDataView1" runat="server"  PagerPanelSpacing="0px"  ContentStyle-Font-Names="Times New Roman"  ContentStyle-Font-Size="Medium" Layout="Table" RowPerPage="7" BackColor="#d4d0c8">
            <ItemTemplate>
                <%# Eval("Add1")%>
            </ItemTemplate>
            
            <PagerSettings ShowSeparators="True">
            
                <AllButton>
                    <Image Height="19px" Width="30px" />
                    
                </AllButton>
                <FirstPageButton>
                    <Image Height="19px" Width="22px" />
                </FirstPageButton>
                <LastPageButton>
                    <Image Height="19px" Width="22px" />
                </LastPageButton>
                <NextPageButton>
                    <Image Height="19px" Width="20px" />
                </NextPageButton>
                <PrevPageButton>
                    <Image Height="19px" Width="20px" />
                </PrevPageButton>
            </PagerSettings>
            
            <ItemStyle Height="5px" HorizontalAlign="Justify" >
                <Paddings Padding="0px" PaddingBottom="2px" PaddingLeft="0px" PaddingRight="0px"
                    PaddingTop="2px" />
                <Border BorderColor="Beige" BorderStyle="Solid" BorderWidth="1px" />
            </ItemStyle>
        </dxdv:ASPxDataView>
    </div>
    </form>
</body>
</html>
