<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductDetails, App_Web_nhjs8cfd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prodeuct Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
        function frmOpenNewWindow1(location,v_height,v_weight)
   {   
        var x=(screen.availHeight-v_height)/2;
        var y=(screen.availWidth-v_weight)/2
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ x +",left="+ y +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no'");       
   } 
   function CallDhtlForms(val,val1)
   {
        parent.CallParent(val,val1);
       
   }
    
   

    var chkobj;
    var objchk=null;
    function chkclicked(obj,msg12)
    {
       var txt = document.getElementById("hiddenleadid")
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
        txt.value = msg12;
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top" style="width: 50%">
                    <asp:GridView AutoGenerateColumns="False" ID="grdProducts" runat="server" Width="100%"
                        BorderWidth="0" OnRowDataBound="grdProducts_RowDataBound">
                        <RowStyle HorizontalAlign="Center" />
                        <HeaderStyle CssClass="EHEADER" BorderColor="AliceBlue" BorderWidth="1px" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkProd" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductType" class="Ecoheadtxt" runat="server" Text='<%# Eval("Product Type") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="Blue" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductAmount" class="Ecoheadtxt" runat="server" Text='<%# Eval("Product Amount") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="Blue" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product">
                                <ItemTemplate>
                                    <asp:Label ID="lblProduct" class="Ecoheadtxt" runat="server" Text='<%# Eval("Product") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="Blue" />
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblProdId" class="Ecoheadtxt" runat="server" Text='<%# Eval("Offered Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cmpany" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblCompany" class="Ecoheadtxt" runat="server" Text='<%# Eval("Company Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblCompanyID" class="Ecoheadtxt" runat="server" Text='<%# Eval("Company ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField Visible="False" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblIntPID" class="Ecoheadtxt" runat="server" Text='<%# Eval("ProdIndID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <input type="button" id="btnAddProduct" value="Add Product" class="btnUpdate" onclick="javascript:CallDhtlForms('ADD','optional');"
                        style="width: 80px; height: 21px;" />
                    <asp:Button ID="btnUpdateProd" runat="server" Text="Update" CssClass="btnUpdate"
                        OnClick="btnUpdateProd_Click" Height="21px" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btnUpdate" OnClick="btnDelete_Click"
                        Height="21px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
