<%@ page language="C#" autoeventwireup="true" inherits="management_verify_transaction_doubleentry, App_Web_e81qjzgk" maintainscrollpositiononpostback="true" enableeventvalidation="false" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>    
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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
		z-index:100;
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
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">

	  function  confirmation()
               {
                 var combo=document.getElementById('ddlExport');
                 combo.value='Ex';               
                 return confirm('Are you sure you want to delete this?');                
               }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
    
        function disp_prompt(name)
        {
             if ( name == "tab0")
            {
            //alert(name);
                document.getElementById('hdnMatchUnmatch').value='M';
            }
            if ( name == "tab1")
            {
            //alert(name);
                document.getElementById('hdnMatchUnmatch').value='U';
            }
           document.getElementById('btnshow').click();
        }
       function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }
    function large(obj)
    {     
         //parent.OnMoreInfoClick(obj,"Large Image",'940px','450px',"N");     
         if('<%= dp %>'=='CDSL')
           {   
             var url='view_signature.aspx?id=' + obj+'[CDSL]';
             parent.OnMoreInfoClick(url,"View Signature",'940px','450px',"Y");         
           }
         else
           {
            var url='view_signature.aspx?id=' + obj+'[NSDL]';
            parent.OnMoreInfoClick(url,"View Signature",'940px','450px',"Y");      
           }    
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
            window.frameElement.width = document.body.scrollWidth;
        }
        
    function popup(obj2,obj1)
    {
        if(obj1==1)
        {
           var x=window.confirm("Already rejected.Do you want to accept it?");
                if(x)
                {
                  document.getElementById('reject').value=obj2;
                  document.getElementById('Button2').click();
                  //document.getElementById('Button1').click();
                  document.getElementById('btnsave').click();
                }
                else
                {                 

                }
        }
        else
        {
            var url='rejection_signature.aspx?id='+obj2+'~'+'<%= dp %>';
            parent.OnMoreInfoClick(url,"Rejection",'540px','250px',"Y");    
        }
           
    }
    function ChangeRowColor(obj,obj1)
    {
//        alert(obj);
    }
   function SignOff()
        {
            window.parent.SignOff();
        }

      
      function PageLoad()
        {
            //alert(new Date());
            document.getElementById('hdnMatchUnmatch').value='M';
            FieldName='btnshow';     
            document.getElementById('hide').style.display='none';    
            //document.getElementById("branch").style.display='block';   
//            document.getElementById("user").style.display='block';   
//            document.getElementById("usertext").style.display='none';  
            //document.getElementById('brtext').style.display='none';  
            //dtexec1.SetDate(new Date()); 
             if(dtexec1.GetDate()!=null)
            {
              if(dtexec1.GetDate()!=new Date())
             {
             }              
            }
            else
            {
              dtexec1.SetDate(new Date()); 
            }
        } 
        
           function callback() 
            {              
                selecttion();
                document.getElementById('Button1').click();
            }

           
       function DisableBranch(obj)
        {
         
//            var gridview = document.getElementById('offlineGrid'); 
//            var rCount = gridview.rows.length;
//           
//            if(rCount<10)
//                rCount='0'+rCount;
//           
//            if(obj=='P')
//            {
//                document.getElementById("offlineGrid_ctl"+rCount+"_FirstPage").style.display='none';
//                document.getElementById("offlineGrid_ctl"+rCount+"_PreviousPage").style.display='none';
//                document.getElementById("offlineGrid_ctl"+rCount+"_NextPage").style.display='inline';
//                document.getElementById("offlineGrid_ctl"+rCount+"_LastPage").style.display='inline';
//            }
//            else
//            {
//                document.getElementById("offlineGrid_ctl"+rCount+"_NextPage").style.display='none';
//                document.getElementById("offlineGrid_ctl"+rCount+"_LastPage").style.display='none';
//            }
        }
                function CallAjax(obj1,obj2,obj3)
                {        
                    //alert('aa');                                                 
                    ajax_showOptions(obj1,obj2,obj3,null,'Main');
                }
                  function keyVal(obj)
                {  
//                    alert(obj); 
                    var a=new String(obj);

                   if(a.split(',')[1]==null)
                   {
                     document.getElementById("hidebranch").value=a.split(',')[0];
                   }
                   else
                   {
                     document.getElementById("hideuser").value=a.split(',')[1];
                   }
//                   alert(document.getElementById("hideuser").value);
                   //alert(document.getElementById("hidebranch").value);
                }
               function  selectbranch(obj)
               {
               /*
                    if(obj=='rdbranch')
                    {
                         var radioButtons = document.getElementsByName("rdbranch");
                          for (var x = 0; x < radioButtons.length; x ++) 
                          {
                            if (radioButtons[x].checked) 
                            {
                                    if(radioButtons[x].id=='rdbranch_0')
                                    {
                                         document.getElementById("usertext").style.display='none';  
                                         document.getElementById('brtext').style.display='none'; 
                                    }
                                    else
                                    {
                                         
                                         document.getElementById("usertext").style.display='none';   
                                         document.getElementById('brtext').style.display='block';
                                    }

                            }
                          }
                    }*/
                     if(obj=='rduser')
                    {
                         var radioButtons = document.getElementsByName("rduser");
                          for (var x = 0; x < radioButtons.length; x ++) 
                          {
                            if (radioButtons[x].checked) 
                            {
                                    if(radioButtons[x].id=='rduser_0')
                                    {
                                         document.getElementById("usertext").style.display='none';  
                                         //document.getElementById('brtext').style.display='none'; 
                                    }
                                    else
                                    {
                                         
                                         document.getElementById("usertext").style.display='block';   
                                         //document.getElementById('brtext').style.display='none';
                                    }

                            }
                          }
                    }
                }
              
    function OnMoreInfoClick(id,id1) 
    {  
                    //alert(id);       alert(id1);             
//                    document.getElementById("hideid").value='goto'+','+id;
//                    document.getElementById('Button1').click();
//                    alert(document.getElementById("hideid").value);
//                    if(document.getElementById("hideid").value=='')
//                    {
                        if(id1!='Demat Transaction')
                        {
                            if(dptype=='CDSL')
                            {
                            var url='edit_popup.aspx?id=' + id+','+id1;
                            parent.OnMoreInfoClick(url,"Edit Settlement Details",'940px','450px',"Y"); 
                            }
                            else
                            {
                             var url='edit_popup.aspx?id=' + id+','+id1;
                             parent.OnMoreInfoClick(url,"Edit Settlement Details",'940px','450px',"Y"); 
                            }
                        }
                        else
                        {
                             if(dptype=='NSDL')
                                {                               
                                 var url='nsdl_demat_transaction.aspx?id=' + id;
                                 parent.OnMoreInfoClick(url,"Edit Demat Details",'940px','450px',"Y"); 
                                }
                        }
//                    }   
             
          
    }
    var dptype='<%= dp %>'; 
    </script>

    <form id="form1" runat="server">
        <div align="center">
            <table align="left">
                <tr>
                    <td colspan="8">
                        <asp:ScriptManager ID="s1" runat="server" EnablePageMethods="true" AsyncPostBackTimeout="36000">
                        </asp:ScriptManager>
                        <table align="left">
                            <tr>
                                <td align="left" style="width: 91px" valign="top">
                        Transaction Date</td>
                                <td align="left" colspan="2" valign="top">
                                    <dxe:ASPxDateEdit id="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" tabIndex="1" UseMaskBehavior="True"
                            Width="150px">
                                    </dxe:ASPxDateEdit></td>
                                <td align="left" style="width: 41px" valign="top">
                        <asp:Button ID="btnshow" runat="server" OnClick="btnshow_Click" OnClientClick="selecttion()"
                            Text="Show" TabIndex="4" /></td>
                                <td align="left" style="width: 48px" valign="top">
                        Export To</td>
                                <td align="left" style="width: 100px" valign="top">
                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged"
                            Width="150px">
                            <asp:ListItem Value="Ex">Export</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList></td>
                                <td align="left" style="width: 100px" valign="top">
                                </td>
                                <td align="left" style="width: 100px" valign="top">
                                </td>
                                <td align="left" style="width: 100px" valign="top">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" rowspan="2" align="left">
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                            Font-Size="10px" Width="100%" BackColor="#DDECFE" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged" OnActiveTabChanging="ASPxPageControl1_ActiveTabChanging">
                            <TabPages>
<dxtc:TabPage Text="Matched">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"><asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel2" __designer:wfdid="w9"><ContentTemplate>
<asp:Panel id="Panel1" runat="server" Visible="false" Height="420px" ScrollBars="Vertical" __designer:wfdid="w10"><TABLE width="98%"><TBODY><TR><TD colSpan=3><asp:GridView id="offlineGrid" runat="server" Width="100%" AllowSorting="True" AutoGenerateColumns="False" BorderColor="CornflowerBlue" BorderStyle="Solid" BorderWidth="2px" DataKeyNames="id" ForeColor="#0000C0" OnRowCommand="offlineGrid_RowCommand" OnSorting="offlineGrid_Sorting" PageSize="5" ShowFooter="True" OnRowDataBound="offlineGrid_RowDataBound" OnRowCreated="offlineGrid_RowCreated" OnRowDeleting="offlineGrid_RowDeleting" __designer:wfdid="w11">
                                                                            <RowStyle BackColor="White" BorderColor="#BFD3EE" BorderStyle="Double" BorderWidth="1px"
                                                                                ForeColor="#330099" />
                                                                            <Columns>
                                                                                <asp:TemplateField Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="SlipNo." SortExpression="SlipNumber">
                                                                                    <ItemTemplate>                                                                                        
                                                                                            <asp:Label ID="lblslip" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("SlipNumber") %>'></asp:Label>                                                                                        
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Client Name[ID].">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblclient" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("AccName") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="ISIN.">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblisin" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("isin") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="QTY">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblqty" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Amount.">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblamount" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("amount") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Counter-Account">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblcounter" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("counterid") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Center" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Fromsettlment">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fromsett") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("fromsett") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Tosettlement">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tosett") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("tosett") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="executiondate" HeaderText="Execution Date"></asp:BoundField>
                                                                                <asp:BoundField DataField="trantype" HeaderText="Transaction Type"></asp:BoundField>
                                                                                <asp:TemplateField HeaderText="Verify">
                                                                                    <HeaderTemplate>
                                                                                        Verify
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="CheckBox3" runat="server" />
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Reject">
                                                                                    <HeaderTemplate>
                                                                                        Reject
                                                                                    </HeaderTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False" />
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="btnreject" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="reject"
                                                                                            Text="Reject" />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="View Signature">
                                                                                    <ItemTemplate>
                                                                                        <a href="javascript:void(0);" onclick="large('<%# Eval("ClientID") %>')">View
                                                                                            Signature.... </a>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="verifyuser" HeaderText="verified" Visible="False"></asp:BoundField>
                                                                                <asp:TemplateField HeaderText="rejected" Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rejected") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                
                                                                                <asp:TemplateField HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                                                            OnClientClick="return confirmation();" Text="Delete"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <PagerStyle ForeColor="White" HorizontalAlign="Center" />
                                                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <HeaderStyle BorderColor="AliceBlue" BorderWidth="1px" CssClass="EHEADER" Font-Bold="False"
                                                                                ForeColor="Black" />
                                                                            <EditRowStyle BackColor="#E59930" />
                                                                            <PagerTemplate>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td colspan="10" style="height: 34px">
                                                                                            <asp:LinkButton ID="FirstPage" runat="server" CommandName="First" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[First Page]"> </asp:LinkButton>
                                                                                            <asp:LinkButton ID="PreviousPage" runat="server" CommandName="Prev" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[Previous Page]">  </asp:LinkButton>
                                                                                            <asp:LinkButton ID="NextPage" runat="server" CommandName="Next" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[Next Page]">
                                                                                            </asp:LinkButton>
                                                                                            <asp:LinkButton ID="LastPage" runat="server" CommandName="Last" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[Last Page]">
                                                                                            </asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </PagerTemplate>
                                                                        </asp:GridView> </TD></TR><TR><TD style="WIDTH: 100px" align=left><asp:Button id="btnsave" onclick="btnsave_Click" runat="server" Text="Save" Visible="False" __designer:wfdid="w12">
                                                                        </asp:Button></TD><TD style="WIDTH: 100px"><asp:HiddenField id="CurrentPage" runat="server" __designer:wfdid="w13"></asp:HiddenField> </TD><TD style="WIDTH: 100px"><asp:HiddenField id="TotalPages" runat="server" __designer:wfdid="w14"></asp:HiddenField> </TD></TR><TR id="Tr1"><TD></TD><TD><asp:HiddenField id="TotalClient" runat="server" __designer:wfdid="w15"></asp:HiddenField> </TD><TD><asp:HiddenField id="reject" runat="server" __designer:wfdid="w16"></asp:HiddenField> </TD></TR><TR><TD id="Td1"></TD><TD></TD><TD></TD></TR></TBODY></TABLE></asp:Panel> 
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
</Triggers>
</asp:UpdatePanel>
 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Text="Unmatched">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"><asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel1" __designer:wfdid="w1"><ContentTemplate>
<asp:Panel id="Panel2" runat="server" Visible="false" Height="420px" ScrollBars="Vertical" __designer:wfdid="w2"><TABLE width="98%"><TBODY><TR><TD colSpan=3><asp:GridView id="offlineGrid1" runat="server" Width="100%" AllowSorting="True" AutoGenerateColumns="False" BorderColor="CornflowerBlue" BorderStyle="Solid" BorderWidth="2px" DataKeyNames="id" ForeColor="#0000C0" OnRowCommand="offlineGrid1_RowCommand" OnSorting="offlineGrid1_Sorting" PageSize="5" ShowFooter="True" OnRowDataBound="offlineGrid1_RowDataBound" OnRowCreated="offlineGrid1_RowCreated" OnRowDeleting="offlineGrid1_RowDeleting" __designer:wfdid="w3">
                                                                            <RowStyle BackColor="White" BorderColor="#BFD3EE" BorderStyle="Double" BorderWidth="1px"
                                                                                ForeColor="#330099" />
                                                                            <Columns>
                                                                                <asp:TemplateField Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="SlipNo." SortExpression="SlipNumber">
                                                                                    <ItemTemplate>                                                                                    
                                                                                        <asp:Label ID="lblslip" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("SlipNumber") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Client Name[ID].">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblclient" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("AccName") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="ISIN.">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblisin" runat="server"  CssClass="gridstyleheight1" Text='<%# Eval("isin") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="QTY">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblqty" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Amount.">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblamount" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("amount") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Counter-Account">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblcounter" runat="server" CssClass="gridstyleheight1" Text='<%# Eval("counterid") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Center" Wrap="False" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Fromsettlment">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fromsett") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("fromsett") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Tosettlement">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tosett") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("tosett") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Execution Date">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("executiondate") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("executiondate") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Transaction Type">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("trantype") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("trantype") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Reject">
                                                                                    <HeaderTemplate>
                                                                                        Reject
                                                                                    </HeaderTemplate>
                                                                                    <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False" />
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="btnreject" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="reject"
                                                                                            Text="Reject" />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="View Signature">
                                                                                    <ItemTemplate>
                                                                                        <a href="javascript:void(0);" onclick="large('<%# Eval("ClientID") %>')">View
                                                                                            Signature.... </a>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="verifyuser" HeaderText="verified" Visible="False"></asp:BoundField>
                                                                                <asp:TemplateField HeaderText="rejected" Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rejected") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Edit">
                                                                                    <ItemTemplate>
                                                                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Eval("id") %>','<%= unmatched %>')">
                                                                                            More Info...</a>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                                                            OnClientClick="return confirmation();" Text="Delete"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <PagerStyle ForeColor="White" HorizontalAlign="Center" />
                                                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <HeaderStyle BorderColor="AliceBlue" BorderWidth="1px" CssClass="EHEADER" Font-Bold="False"
                                                                                ForeColor="Black" />
                                                                            <EditRowStyle BackColor="#E59930" />
                                                                            <PagerTemplate>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td colspan="10" style="height: 34px">
                                                                                            <asp:LinkButton ID="FirstPage" runat="server" CommandName="First" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[First Page]"> </asp:LinkButton>
                                                                                            <asp:LinkButton ID="PreviousPage" runat="server" CommandName="Prev" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[Previous Page]">  </asp:LinkButton>
                                                                                            <asp:LinkButton ID="NextPage" runat="server" CommandName="Next" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[Next Page]">
                                                                                            </asp:LinkButton>
                                                                                            <asp:LinkButton ID="LastPage" runat="server" CommandName="Last" Font-Bold="true"
                                                                                                OnCommand="NavigationLink_Click1" Text="[Last Page]">
                                                                                            </asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </PagerTemplate>
                                                                        </asp:GridView> </TD></TR><TR><TD style="WIDTH: 100px" align=left><asp:Button id="Button3" onclick="btnsave_Click" runat="server" Text="Save" Visible="False" __designer:wfdid="w4">
                                                                        </asp:Button></TD><TD style="WIDTH: 100px"><asp:HiddenField id="HiddenField1" runat="server" __designer:wfdid="w5"></asp:HiddenField> </TD><TD style="WIDTH: 100px"><asp:HiddenField id="HiddenField2" runat="server" __designer:wfdid="w6"></asp:HiddenField> </TD></TR><TR id="Tr2"><TD></TD><TD><asp:HiddenField id="HiddenField3" runat="server" __designer:wfdid="w7"></asp:HiddenField> </TD><TD><asp:HiddenField id="HiddenField4" runat="server" __designer:wfdid="w8"></asp:HiddenField> </TD></TR><TR><TD id="Td2"></TD><TD></TD><TD></TD></TR></TBODY></TABLE></asp:Panel> 
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
</Triggers>
</asp:UpdatePanel>
 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();	                                            
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            }"></ClientSideEvents>
                            
                            
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Button ID="btncan" runat="server" Text="Cancel" OnClick="btncan_Click" Visible="False" /></td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px" id="hide">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" /></td>
                    <td style="width: 100px">
                        <asp:HiddenField ID="hidebranch" runat="server" />
                    </td>
                    <td style="width: 100px">
                        <asp:HiddenField ID="hideuser" runat="server" />
                    </td>
                    <td style="width: 100px">
                        <asp:HiddenField ID="hideid" runat="server" />
                    </td>
                    <td style="width: 100px">
                        <asp:HiddenField ID="hdnMatchUnmatch" runat="server" />
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
