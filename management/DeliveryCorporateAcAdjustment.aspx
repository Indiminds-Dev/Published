<%@ page language="C#" autoeventwireup="true" inherits="management_DeliveryCorporateAcAdjustment, App_Web_e158i_8t" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Corporate Action Adjustment</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
    
     
    

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

    <script language="javascript" type="text/javascript">
        function InterSettlementFunc(objID,objListFun,objEvent,ObjType)
        {
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Sub');
        }
        function InterSettlement(objID,objListFun,objEvent,ObjType)
        {
            var Scrip=document.getElementById('txtScrip_hidden').value;
            ObjType=ObjType+'~'+Scrip
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Sub');
        }
        function height()
        {
            if(document.body.scrollHeight>=500)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '500';
            }
            window.frameElement.widht = document.body.scrollWidht;
        }
        function Page_Load()
        {
            document.getElementById('TrGenerate').style.display='none';
            document.getElementById('TdExDate').style.display='none';
            document.getElementById('TdExDate1').style.display='none';
            document.getElementById('divISIN').innerText='Old ISIN :';
        }
        function Display(obj)
        {
            if(obj=='1')
                document.getElementById('TrGenerate').style.display='inline';
            else
                document.getElementById('TrGenerate').style.display='none';
            height();
        }
        function SelectAll(id) 
        {
            var frm = document.forms[0];
            for (i=0;i<frm.elements.length;i++) 
            {
                if (frm.elements[i].type == "checkbox") 
                {  
                    frm.elements[i].checked = document.getElementById(id).checked;
                }
            }
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
            function AlertMessage()
            {
                var answer = confirm ("Already Generated Corporate Action Adjustment for this ISIN on this date, \n Want to Delete This Transactions ?");
                if (answer)
                {                    
                    var answer1 = confirm ("Are You Really Sure ?");
                    if(answer1)
                    {
                        var answer2 = confirm ("Are You Really Sure ?");
                        if(answer2)
                        {
                             document.getElementById('Button1').click();
                        }
                    }                   
                } 
            }
            function ChngeType(obj)
            {
                if(obj=='S')
                {
                    document.getElementById('TdNISIN').style.display='inline';
                    document.getElementById('TdNISIN1').style.display='inline';
                    document.getElementById('TdExDate').style.display='none';
                    document.getElementById('TdExDate1').style.display='none';
                    document.getElementById('divISIN').innerText='Old ISIN :';
                }
                else if(obj=='B')
                {
                    document.getElementById('TdNISIN').style.display='none';
                    document.getElementById('TdNISIN1').style.display='none';
                    document.getElementById('TdExDate').style.display='inline';
                    document.getElementById('TdExDate1').style.display='inline';
                    document.getElementById('divISIN').innerText='ISIN :';
                }
            }
            function SelectSingle() 
            {
                 var gridview = document.getElementById('grdCorporateAction'); 
                var rCount = gridview.rows.length; 
                var SumAmt=0;
                for (i=2;i<rCount;i++) 
                {
                    var leni;                    
                    var a=new String(i)
                    if(a.length==1)
                       leni="0"+i;
                    else
                        leni=i;
                     var txtVal='grdCorporateAction'+'_ctl'+leni+'_'+'txtAdj';
                     //SumAmt = parseFloat(SumAmt)+parseFloat(document.getElementById(txtVal).value);     
                     SumAmt = parseInt(SumAmt)+parseInt(document.getElementById(txtVal).value);                    
                }
                var footerLab;
                var a=new String(rCount)
                if(a.length==1)
                    footerLab="0"+rCount;
                else   
                    footerLab=rCount
                var FooterValue='grdCorporateAction'+'_ctl'+footerLab+'_'+'lbTransFerTotal'; 
                //var NumberFor=intToFormat(SumAmt.toFixed(2));
                var NumberFor=SumAmt;
                document.getElementById(FooterValue).innerText=NumberFor;        
            }
            function intToFormat(nStr)
            {
             nStr += '';
             x = nStr.split('.');
             x1 = x[0];
             x2 = x.length > 1 ? '.' + x[1] : '';
             var rgx = /(\d+)(\d{3})/;
             var z = 0;
             var len = String(x1).length;
             var num = parseInt((len/2)-1);
         
              while (rgx.test(x1))
              {
                if(z > 0)
                {
                  x1 = x1.replace(rgx, '$1' + ',' + '$2');
                }
                else
                {
                  x1 = x1.replace(rgx, '$1' + ',' + '$2');
                  rgx = /(\d+)(\d{2})/;
                }
                z++;
                num--;
                if(num == 0)
                {
                  break;
                }
              }
             return x1 + x2;
         }


         //        ------------ For Auto Complete Start -----------------

         function FunCallAjaxList(objID, objEvent, ObjType) {

             var strQuery_Table = '';
             var strQuery_FieldName = '';
             var strQuery_WhereClause = '';
             var strQuery_OrderBy = '';
             var strQuery_GroupBy = '';
             var CombinedQuery = '';

             if (ObjType == 'InterSettlementForISINAccounts') {

                 document.getElementById('txtSelectedAccount_hidden').value = '';

                 strQuery_Table = "Master_DPAccounts";
                 strQuery_FieldName = "distinct top 10  DPAccounts_ShortName AS loginid,DPAccounts_ID as user_id ";
                 strQuery_WhereClause = "  DPAccounts_ShortName like (\'%RequestLetter%') ";


             }



             CombinedQuery = new String(strQuery_Table + "$" + strQuery_FieldName + "$" + strQuery_WhereClause + "$" + strQuery_OrderBy + "$" + strQuery_GroupBy);


             ajax_showOptions(objID, 'GenericAjaxList', objEvent, replaceChars(CombinedQuery));
             //  alert (CombinedQuery);
         }

         function replaceChars(entry) {
             out = "+"; // replace this
             add = "--"; // with this
             temp = "" + entry; // temporary holder

             while (temp.indexOf(out) > -1) {
                 pos = temp.indexOf(out);
                 temp = "" + (temp.substring(0, pos) + add +
            temp.substring((pos + out.length), temp.length));
             }
             return temp;
         }

      //----------------------- end      
            
            
            
        FieldName='btnShow';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>

            <script language="javascript" type="text/javascript">
                  var prm = Sys.WebForms.PageRequestManager.getInstance(); 
                   prm.add_initializeRequest(InitializeRequest); 
                   prm.add_endRequest(EndRequest); 
                   var postBackElement; 
                   function InitializeRequest(sender, args) 
                   { 
                      if (prm.get_isInAsyncPostBack()) 

                      args.set_cancel(true); 
                      postBackElement = args.get_postBackElement(); 
                      $get('UpdateProgress1').style.display = 'block'; 
                         
                   } 
                   function EndRequest(sender, args) 
                   {
                     $get('UpdateProgress1').style.display = 'none';                         
                   } 
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;" colspan="6">
                        <strong><span style="color: #000099">Corporate Action Adjustment</span></strong>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Type :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddltype" runat="server" Width="148px" onchange="ChngeType(this.value)"
                            Font-Size="10px">
                            <asp:ListItem Value="S">Split</asp:ListItem>
                            <asp:ListItem Value="B">Bonus</asp:ListItem>
                            <asp:ListItem Value="M">Merge</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft">
                        Scrip :
                    </td>
                    <td>
                        <asp:TextBox ID="txtScrip" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForISINAccounts',event,'Product')"
                            Width="143px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        <div id="divISIN">
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOldISIN" runat="server" Font-Size="10px" onkeyup="InterSettlement(this,'InterSettlementForISINAccounts',event,'ISINOld')"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" id="TdNISIN">
                        New ISIN :
                    </td>
                    <td id="TdNISIN1">
                        <asp:TextBox ID="txtNewISIN" runat="server" Font-Size="10px" onkeyup="InterSettlement(this,'InterSettlementForISINAccounts',event,'ISINNew')"
                            Width="142px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Record Date :
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="dtRecordDate" runat="server" Font-Size="10px" UseMaskBehavior="True"
                            EditFormat="Custom" Width="150px">
                        </dxe:ASPxDateEdit>
                    </td>
                    <td class="gridcellleft">
                        Conversion Rate :
                    </td>
                    <td>
                        <asp:TextBox ID="txtRate1" runat="server" Font-Size="10px" Width="28px" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                        :
                        <asp:TextBox ID="txtRate2" runat="server" Font-Size="10px" Width="28px" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Selected Account :
                    </td>
                    <td>
                       <%-- <asp:TextBox ID="txtSelectedAccount" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForISINAccounts',event,'AccountName')"
                            Width="228px"></asp:TextBox>--%>
                            
                            <asp:TextBox ID="txtSelectedAccount" runat="server" Font-Size="10px" onkeyup="FunCallAjaxList(this,event,'InterSettlementForISINAccounts')"  Width="228px"   ></asp:TextBox>
                            
                            
                    </td>
                    <td class="gridcellleft">
                        Transfer Date :
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="DtTransaction" runat="server" Font-Size="10px" UseMaskBehavior="True"
                            EditFormat="Custom" Width="150px">
                        </dxe:ASPxDateEdit>
                    </td>
                    <td class="gridcellleft" id="TdExDate">
                        Ex Date
                    </td>
                    <td id="TdExDate1">
                         <dxe:ASPxDateEdit ID="dtExDate" runat="server" Font-Size="10px" UseMaskBehavior="True"
                            EditFormat="Custom" Width="150px">
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" OnClick="btnShow_Click"
                            Height="25px" Width="60px" />
                    </td>
                    <td colspan="5">
                        <asp:HiddenField ID="txtScrip_hidden" runat="server" />
                        <asp:HiddenField ID="txtOldISIN_hidden" runat="server" />
                        <asp:HiddenField ID="txtNewISIN_hidden" runat="server" />
                        <asp:HiddenField ID="txtSelectedAccount_hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                    <td colspan="5">
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdCorporateAction" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                    ShowFooter="True" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px"
                                    CellPadding="4" ForeColor="#0000C0" OnRowDataBound="grdCorporateAction_RowDataBound">
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    <Columns>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("clientid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Client">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblClient" runat="server" Text='<%# Eval("clientname")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblsumqty" runat="server" Text='<%# Eval("sumqty")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Adjustment">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtAdj" Font-Size="10px" Width="60px" runat="server" Text='<%# Eval("Adj") %>'
                                                    Onkeypress="javascript:return isNumberKey(event);" onfocusout="SelectSingle()"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lbTransFerTotal" runat="server"></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranch" runat="server" Text='<%# Eval("Branch")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSettNumber" runat="server" Text='<%# Eval("SettlementNumber")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSettType" runat="server" Text='<%# Eval("SettlementType")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Adjustment">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblAdj" runat="server" Text='<%# Eval("Adj")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Excess" Visible="false">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblExcess" runat="server" Text='<%# Eval("Excess")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="ChkDelivery" runat="server" />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="cbSelectAll" runat="server" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnGenerate" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr id="TrGenerate">
                    <td colspan="5">
                        <asp:Button ID="btnGenerate" runat="server" Text="Generate" CssClass="btnUpdate"
                            Height="25px" Width="94px" OnClick="btnGenerate_Click" />
                    </td>
                    <td style="display: none">
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
