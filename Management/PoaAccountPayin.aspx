<%@ page language="C#" autoeventwireup="true" inherits="management_PoaAccountPayin, App_Web_njtlujlb" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Poa/DDPI Account Payins [Note: If you select TM's POOL A/c the transfers are flagged as Normal Transfers without Blocking For Early Payin. For Mandatory Blocking with Early Payin, select DirectDelivery Dummy Pool A/c ]</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <style type="text/css">
        /* Big box with list of options */#ajax_listOfOptions
        {
            position: absolute; /* Never change this one */
            width: 50px; /* Width of box */
            height: auto; /* Height of box */
            overflow: auto; /* Scrolling features */
            border: 1px solid Blue; /* Blue border */
            background-color: #FFF; /* White background color */
            text-align: left;
            font-size: 0.9em;
            z-index: 32767;
        }
        #ajax_listOfOptions div
        {
            /* General rule for both .optionDiv and .optionDivSelected */
            margin: 1px;
            padding: 1px;
            cursor: pointer;
            font-size: 0.9em;
        }
        #ajax_listOfOptions .optionDiv
        {
            /* Div for each item in list */
        }
        #ajax_listOfOptions .optionDivSelected
        {
            /* Selected item in the list */
            background-color: #DDECFE;
            color: Blue;
        }
        #ajax_listOfOptions_iframe
        {
            background-color: #F00;
            position: absolute;
            z-index: 3000;
        }
        form
        {
            display: inline;
        }
    </style>

    <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
                 Hide('TabGrid');
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
    
    function ChangeRowColor(rowID,rowNumber) 
        { 
            var gridview = document.getElementById('GrdPoaAcPayin'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==28)
                 rowCount=25;
            else    
               rowCount=rCount-2;
            if(rowNumber>25 && rCount<28)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac';            
          
        }         
  
  function isNumberKey(e)      
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
     function FnFetchSettlement(objID,objListFun,objEvent)
    {
           var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
            
             var finyear='<%=Session["LastFinYear"]%>';
             var valyr= finyear.split('-');
             
             strQuery_Table = "Master_Settlements";
             strQuery_FieldName = "distinct top 10 RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)+'  ' + REPLACE(CONVERT(VARCHAR(9), settlements_StartDateTime, 6), ' ', '-') AS [DD-Mon-YY],RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)";
             strQuery_WhereClause = " settlements_exchangesegmentid='<%=Session["ExchangeSegmentID"]%>' and  ((RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)) like (\'%RequestLetter%') and ((settlements_StartDateTime between '" + valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59') or (Settlements_FundsPayin between '"+ valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59'))) ";

             CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
            ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));


    }
    
    function replaceChars(entry) 
       {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        } 
        
    function RecordDisplay(obj)
    {
        if(obj=="1")
        {
            Hide('TabGrid');
            alert('No Record Found !!');
        }
        if(obj=="2")
        {
            Show('TabGrid');
        }
        if(obj=="3")
        {
            Hide('TabGrid');
            alert('Processing Successfully !!!!');
        }
        height();
    }
     function Fn_DeliverQty(textid,txtqty,deliverqty)
      {
        if(parseInt(txtqty)>parseInt(deliverqty))
        {
           alert('You Can Deliver Maximum '+deliverqty+' Share');
           textid.value=deliverqty;
           textid.focus();
           textid.select();
        }
        
      }
     FieldName='lstSlection';
     
     function ShowHideFilter(obj)
    {
        /* if(document.getElementById('TxtSeg').value=='N')
           {
             document.getElementById('TxtTCODE').style.display="none";
           }
           else
           {
            document.getElementById('TxtTCODE').style.display="inline";
           }*/
           
        InitialTextVal();
        if(obj=="s")
            document.getElementById('TrFilter').style.display="inline";
            //grid.PerformCallback('ssss');
        else
        {
            document.getElementById('TrFilter').style.display="none";
            document.getElementById('btnAll').click();
            //grid.PerformCallback(obj);
        }
    }
     function InitialTextVal()
   {
        document.getElementById('txtClientName').value = "";
        document.getElementById('txtClientID').value = "";
        document.getElementById('txtBranchCode').value = "";
        document.getElementById('txtScriptName').value = "";
        document.getElementById('txtIsIn').value = "";
   }  
    
    </script>

    <script type="text/javascript">
        function SelectAllCheckboxes(chk) {
            $('#<%=GrdPoaAcPayin.ClientID %>').find("input:checkbox").each(function() {
                if (this != chk) {
                    this.checked = chk.checked;
                }
            });
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;
        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack())
                args.set_cancel(true);
            postBackElement = args.get_postBackElement();
            $get('UpdateProgress1').style.display = 'block';
        }
        function EndRequest(sender, args) {
            $get('UpdateProgress1').style.display = 'none';

        } 
    </script>

    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Poa/DDPI Account Payins [Note: If you select TM's POOL A/c the transfers are flagged as Normal Transfers without Blocking For Early Payin. For Mandatory Blocking with Early Payin, select DirectDelivery Dummy Pool A/c ]</span></strong>
                </td>
            </tr>
        </table>
        <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Pending Position Of :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPendingPostion" runat="server" Font-Size="10px" onkeyup="FnFetchSettlement(this,'GenericAjaxList',event)"
                                    Width="200Px"></asp:TextBox>
                            </td>
                            <td style="display: none;">
                                <asp:TextBox ID="txtPendingPostion_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Select Dp :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDp" Font-Size="10px" runat="server" Width="150px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Transfer Date :
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxDateEdit ID="DtTransferDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="DtTransferDate">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Target Account :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTargetAc" Font-Size="10px" runat="server" Width="250px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Slip Number :
                            </td>
                            <td>
                                <asp:TextBox ID="txtSlipNo" runat="server" Text="" Font-Size="10px" Width="200px"
                                    Height="15px" Font-Names="Verdana"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="gridcellleft" bgcolor="#B7CEEC">
                    <asp:CheckBox ID="ChkALL" runat="server" />
                    Transfer All
                </td>
                <%--New Work 25/11/2022--%>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Select Account Type :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAccType" Font-Size="10px" runat="server" Width="100px">
                                <asp:ListItem Value="D">Default</asp:ListItem>
                                <asp:ListItem Value="S">Secondary</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <%--End of New Work 25/11/2022--%>
            </tr>
            <tr>
                <td class="gridcellleft" colspan="3">
                    <asp:Button ID="BtnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                        Width="101px" OnClick="BtnScreen_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                top: 50%; background-color: white; layer-background-color: white; height: 80;
                                width: 150;'>
                                <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td height='25' align='center' bgcolor='#FFFFFF'>
                                                        <img src='../images/progress.gif' width='18' height='18'>
                                                    </td>
                                                    <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                        <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
        </table>
        <table id="TabGrid">
            <tr>
                <td>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnGenerate1" runat="server" Text="Generate" CssClass="btnUpdate"
                                            Height="25px" Width="147px" OnClick="btnGenerate1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGenerate1" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td id="ShowFilter">
                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                    Show Filter</span></a>
                            </td>
                            <td id="Td1">
                                <a href="javascript:ShowHideFilter('All');" runat="server" >
                                <span style="color: #000099; text-decoration: underline">
                                    All Records</span>
                                    </a>
                                    <asp:Button ID="btnAll" runat="server" onclick="All_Click" style="display:none;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="TrFilter" style="display: none" runat="server">
                <td>
                    <table>
                        <tr>
                            <td>
                                Client Name : 
                                <asp:TextBox ID="txtClientName" runat="server" CssClass="water" 
                                    ToolTip="Client Name" Font-Size="10px" Width="119px"></asp:TextBox>
                            </td>
                            <td>
                                Client ID :
                                <asp:TextBox ID="txtClientID" runat="server" CssClass="water" ToolTip="Client ID"
                                    Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                Branch Code :
                                <asp:TextBox ID="txtBranchCode" runat="server" CssClass="water" 
                                    ToolTip="Branch Code" Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                Script Name :
                                <asp:TextBox ID="txtScriptName" runat="server" CssClass="water" 
                                    ToolTip="Script Name" Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                Isin :
                                <asp:TextBox ID="txtIsIn" runat="server" CssClass="water"  ToolTip="Isin"
                                    Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" CssClass="btnUpdate" OnClick="btnSearch_Click" Text="Search" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GrdPoaAcPayin" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0000C0"
                                OnRowCreated="GrdPoaAcPayin_RowCreated" OnRowDataBound="GrdPoaAcPayin_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="Client Name">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblClientId" runat="server" Text='<%# Eval("ClientId")%>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblDpdid" runat="server" Text='<%# Eval("Dpdid")%>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblDpCode" runat="server" Text='<%# Eval("DpCode")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ClientId">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBenAcno" runat="server" Text='<%# Eval("BenAcno")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BranchCode">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBranchCode" runat="server" Text='<%# Eval("BranchCode")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblBranchid" runat="server" Text='<%# Eval("Branchid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ScripName">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblScripName" runat="server" Text='<%# Eval("ScripName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblProductid" runat="server" Text='<%# Eval("Productid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Isin">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblIsinNo" runat="server" Text='<%# Eval("IsinNo")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pending InComing">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPendingInComing" runat="server" Text='<%# Eval("PendingInComing")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Holding">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblHolding" runat="server" Text='<%# Eval("Holding")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transferable">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="TxtDeliver" Font-Size="10px" Width="60px" runat="server" Onkeypress="return isNumberKey(event)"
                                                Text='<%# Eval("TxtDeliver") %>' Style="text-align: right;"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Holding Date">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblHldDateTime" runat="server" Text='<%# Eval("HldDateTime")%>' CssClass="gridstyleheight1"
                                                ForeColor="red"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelected" runat="server" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="True" Wrap="False"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnGenerate2" runat="server" Text="Generate" CssClass="btnUpdate"
                                            Height="25px" Width="147px" OnClick="btnGenerate2_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGenerate2" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
