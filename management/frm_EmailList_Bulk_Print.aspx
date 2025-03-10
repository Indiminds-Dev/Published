<%@ page language="C#" autoeventwireup="true" inherits="management_frm_EmailList_Bulk_Print, App_Web_alid8jfz" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Influx CRM</title>
    <script type="text/javascript">
    function onPage()
        {
            window.focus();
            self.print();
        }
    </script>
</head>
<body onload="javascript:self.onPage();">
    <form id="frmAllEmailList" runat="server">
    <div>
        <dxdv:ASPxDataView ID="ASPxDataView1" runat="server" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/" PagerPanelSpacing="0px" RowPerPage="10">
            <ItemTemplate>
                <%# Eval("Email")%>
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
