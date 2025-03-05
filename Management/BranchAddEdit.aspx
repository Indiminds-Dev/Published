<%@ page language="C#" autoeventwireup="true" inherits="management_BranchAddEdit, App_Web_0payuukt" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <%--<script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
		z-index:30000;
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
		z-index:5000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
    
    
      function ValidatePage()
    {
    var BranchCode=document.getElementById("PageControl1_txtCode").value;
         if(document.getElementById("PageControl1_txtCode").value =='')
          {
           alert('Branch Code Required!..');
           return false;
          }
          else if(document.getElementById("PageControl1_txtBranchDesc").value =='')
          {
           alert('Branch Name Required!..');
           return false;
          }
          
          if(BranchCode.length < 3)
          {
            alert('Branch Code Should be 3 characters!..');
               return false;
          }
   
      
    }
     function disp_prompt(name)
    {
    if ( name == "tab2")
        {
        
        document.location.href="Contact_Document.aspx";         
        }
    }
     
    function Close()
    {
     parent.editwin.close();
    }
    
     function CallList(obj1,obj2,obj3)
    {
        var obj5='';
        ajax_showOptions(obj1,obj2,obj3,obj5);
     }
    
    
   function CallAjaxState(obj1,obj2,obj3)
    {
    
        var obj5=document.getElementById("PageControl1_txtCountry_hidden").value;
        if(obj5 !='')
        {
        ajax_showOptions(obj1,obj2,obj3,obj5);
        }
        else
        {
        alert("Please Select Country!..")
        }
        
       
    }
     function CallAjaxCity(obj1,obj2,obj3)
    {
        var obj5=document.getElementById("PageControl1_txtState_hidden").value;
         if(obj5 !='')
        {
         ajax_showOptions(obj1,obj2,obj3,obj5);
         }
         else
         {
         alert("Please Select State!..")
         }
     }
    
    
      function OnEditButtonClick(keyValue)
    {
      var url='BranchAddEdit.aspx?id='+ keyValue;
      parent.OnMoreInfoClick(url,"Edit Account",'820px','400px',"Y");
    }
    
      function OnAddButtonClick() 
    {
         var url='BranchAddEdit.aspx?id=ADD';
         parent.OnMoreInfoClick(url,"Add New Account",'820px','400px',"Y");
    }
    
    
     function DeleteRow(keyValue)
    {
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback('Delete~'+ keyValue);
                   height();
                }
            else{
                  
                }

   
    }
    
    
    function ShowHideFilter1(obj)
    {
    
       gridTerminal.PerformCallback(obj);
    }
    function SignOff()
    {
        window.parent.SignOff()
    }
    function height()
    {//alert(document.body.scrollHeight);
        if(document.body.scrollHeight<=500)
            window.frameElement.height = '500px';
        else
            window.frameElement.height = document.body.scrollHeight;
        window.frameElement.width = document.body.scrollWidth;
    }
    function OnCountryChanged(cmbCountry) 
    {
//      alert(cmbCountry.value);

      
                drpState.PerformCallback(obj);

      //  grid.GetEditor("branch_state").PerformCallback(cmbCountry.GetValue().toString());
    }
    function OnStateChanged(cmbState) 
    {
       // grid.GetEditor("branch_city").PerformCallback(cmbState.GetValue().toString());
    }
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    }
    function setvaluetovariable(obj1)
    {
        combo1.PerformCallback(obj1);
    }
    function setvaluetovariable1(obj1)
    {
        combo2.PerformCallback(obj1);
    }
    function CallList(obj1,obj2,obj3)
    {
        ajax_showOptions(obj1,obj2,obj3);
    }
   function hide_show(obj)
   {
        if(obj=='All')
        {
            document.getElementById("client_pro").style.display="none";
        }

   } 
   function GetClick()
   {
        btnC.PerformCallback();
   }
   function Page_Load()
   {
        document.getElementById("TdCombo").style.display="none";
   }
   function Message(obj)
   {
         if(obj=="update")
        {
            alert('Update Successfully');
            gridTerminal.PerformCallback();
        }
        else if(obj=="insert")
        {
            alert('Insert Successfully');
            gridTerminal.PerformCallback();
        }
        else
        {
            alert('Terminal Id Already Exists');
        }
   }
   function CheckingTD(obj)
   {
        
        var gridstat=gridTerminal.cpCompCombo;
        if(gridstat=='anew')
            combo.SetFocus();
        
//        if(obj=="b")
//        {
//            hide_show('All');
//        }
   }
    FieldName="cmbExport_DDDWS";
    function LastCall(obj)
    {
        height();
    }    
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%">
                <tr>
                    <td style="width: 100%">
                        <dxtc:ASPxPageControl ID="PageControl1" runat="server" Width="100%" ActiveTabIndex="0" ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Text="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table  class="TableMain100">
                                                <tr>
                                                    <td>
                                                        <table class="TableMain100">
                                                            <tr>
                                                                <td class="gridcellleft">Branch Tye
                                                                </td>
                                                                <td class="gridcellleft"> 
                                                                <asp:DropDownList ID="cmbBranchType" runat="server" Width="255px" Font-Size="11px"
                                        TabIndex="1">
                                       <asp:ListItem Text="Own Branch" Value="Own Branch"></asp:ListItem>
                                        <asp:ListItem Text="Franchisee" Value="Franchisee"></asp:ListItem>
                                         <asp:ListItem Text="Sub Broker" Value="Sub Broker"></asp:ListItem>
                                       
                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="gridcellleft">Code
                                                                
                                                                </td>
                                                                <td class="gridcellleft"> <asp:TextBox ID="txtCode" runat="server" Width="250px" Font-Size="11px" TabIndex="2"  MaxLength="4"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">Parent Branch
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:DropDownList ID="cmbParentBranch" runat="server" Width="255px" Font-Size="11px"
                                        TabIndex="3">
                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="gridcellleft">Description
                                                                </td>
                                                               <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtBranchDesc" runat="server" Width="250px" Font-Size="11px" TabIndex="4"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">Region ID
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:DropDownList ID="cmbBranchRegion" runat="server" Width="255px" Font-Size="11px"
                                        TabIndex="5">
                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="gridcellleft">Address1
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtAddress1" runat="server" Width="250px" Font-Size="11px" TabIndex="6"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">Address2
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtAddress2" runat="server" Width="250px" Font-Size="11px" TabIndex="7"></asp:TextBox>
                                                                </td>
                                                                <td class="gridcellleft">Address3
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtAddress3" runat="server" Width="250px" Font-Size="11px" TabIndex="8"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">Country
                                                                </td>
                                                                <td class="gridcellleft">
                                                                    <asp:TextBox ID="txtCountry" runat="server" Width="250px" Font-Size="11px" TabIndex="9"></asp:TextBox>
                                                                    <asp:HiddenField ID="txtCountry_hidden" runat="server" />
                                                                </td>
                                                                <td class="gridcellleft">State
                                                                </td>
                                                                <td class="gridcellleft">
                                                                   <asp:TextBox ID="txtState" runat="server" Width="250px" Font-Size="11px" TabIndex="10"></asp:TextBox>
                                                                   <asp:HiddenField ID="txtState_hidden" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">City
                                                                </td>
                                                                <td class="gridcellleft">
                                                                    <asp:TextBox ID="txtCity" runat="server" Width="250px" Font-Size="11px" TabIndex="11"></asp:TextBox>
                                                                    <asp:HiddenField ID="txtCity_hidden" runat="server" />
                                                                </td>
                                                                <td class="gridcellleft">Pin
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtPin" runat="server" Width="250px" Font-Size="11px" TabIndex="12"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">Phone
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtPhone" runat="server" Width="250px" Font-Size="11px" TabIndex="13"></asp:TextBox>
                                                                </td>
                                                                <td class="gridcellleft">Fax No
                                                                </td>
                                                                <td class="gridcellleft"> <asp:TextBox ID="txtFax" runat="server" Width="250px" Font-Size="11px" TabIndex="4"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">Branch Head
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtBranchHead" runat="server" Width="250px" Font-Size="11px" TabIndex="14"></asp:TextBox>
                                                                 <asp:HiddenField id="txtBranchHead_hidden" runat="server" />
                                                                </td>
                                                                <td class="gridcellleft">Branch GST Regn.No:
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtContPhone" runat="server" Width="250px" Font-Size="11px" TabIndex="15"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="gridcellleft">Contact Person
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtContPerson" runat="server" Width="250px" Font-Size="11px" TabIndex="16"></asp:TextBox>
                                                                </td>
                                                                <td class="gridcellleft">Email
                                                                </td>
                                                                <td class="gridcellleft">
                                                                 <asp:TextBox ID="txtContEmail" runat="server" Width="250px" Font-Size="11px" TabIndex="17"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                            <td class="gridcellleft">
                                                            
                                                            </td>
                                                            <td class="gridcellleft">
                                                            </td>
                                                            <td class="gridcellleft">
                                                            </td>                                                            
                                                            <td class="gridcellleft">
                                                                 <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                        TabIndex="18" ValidationGroup="a" />
                                    <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btnUpdate" OnClientClick="Close()"
                                        TabIndex="19" />
                                                            </td>
                                                            
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Trading Terminal">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table>
                                            <tr>
                                            <td>
                                            <td>
                                           
                <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        </td>
                                            </td>
                                            </tr>
                                                <tr>
                                                    <td id="Td4">
                                                        <a href="javascript:ShowHideFilter1('s1');"><span style="color: #000099; text-decoration: underline">
                                                            Show Filter</span></a>
                                                    </td>
                                                    <td id="Td5">
                                                        <a href="javascript:ShowHideFilter1('All1');"><span style="color: #000099; text-decoration: underline">
                                                            All Records</span></a>
                                                    </td>
                                                      <td class="gridcellright">
                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                        ValueType="System.Int32" Width="130px">
                        <Items>
                          <%--  <dxe:ListEditItem Text="Select" Value="0" />--%>
                           <%-- <dxe:ListEditItem Text="PDF" Value="1" />--%>
                            <dxe:ListEditItem Text="XLS" Value="2" />
                            <%--<dxe:ListEditItem Text="RTF" Value="3" />
                            <dxe:ListEditItem Text="CSV" Value="4" />--%>
                        </Items>
                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                        </ButtonStyle>
                        <ItemStyle BackColor="Navy" ForeColor="White">
                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                            </HoverStyle>
                        </ItemStyle>
                        <Border BorderColor="White" />
                        <DropDownButton Text="Export">
                        </DropDownButton>
                    </dxe:ASPxComboBox>
                </td>
                                                    
                                                </tr>
                                            </table>
                                            <dxwgv:ASPxGridView ID="gridTerminalId" ClientInstanceName="gridTerminal" KeyFieldName="TradingTerminal_ID"
                                                runat="server" DataSourceID="TrdTerminal" Width="100%" OnHtmlEditFormCreated="gridTerminalId_HtmlEditFormCreated"
                                                OnStartRowEditing="gridTerminalId_StartRowEditing" AutoGenerateColumns="False"
                                                OnCustomCallback="gridTerminalId_CustomCallback" OnCellEditorInitialize="gridTerminalId_CellEditorInitialize"
                                                OnInitNewRow="gridTerminalId_InitNewRow" OnCustomJSProperties="gridTerminalId_CustomJSProperties">
                                                <settings showgrouppanel="True" showfooter="false" showstatusbar="Visible" showtitlepanel="false" />
                                                <settingsediting popupeditformheight="300px" popupeditformhorizontalalign="Center"
                                                    popupeditformmodal="True"  popupeditformverticalalign="BottomSides" popupeditformwidth="800px"
                                                    editformcolumncount="1" mode="PopupEditForm" />
                                                <settingstext popupeditformcaption="Add/Modify Branch" confirmdelete="Are you sure to Delete this Record!" />
                                                <settingsbehavior columnresizemode="NextColumn" confirmdelete="True" allowfocusedrow="True" />
                                                <columns>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="TradingTerminal_ID" ReadOnly="True" Visible="False"
                                                                            VisibleIndex="0">
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="Exchange" ReadOnly="True" VisibleIndex="0">
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="TradingTerminal_TerminalID" Caption="TerminalID"
                                                                            ReadOnly="True" VisibleIndex="1">
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="TradingTerminal_ParentTerminalID" Caption="Parent TerminalID"
                                                                            ReadOnly="True" VisibleIndex="2">
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn> 
                                                                        
                                                                       <dxwgv:GridViewDataTextColumn FieldName="AllTradeID" Caption="All Trade Account"
                                                                            ReadOnly="True" VisibleIndex="3">
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                         <dxwgv:GridViewDataTextColumn FieldName="CliTradeID" Caption="Client Trade Account"
                                                                            ReadOnly="True" VisibleIndex="4">
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                         <dxwgv:GridViewDataTextColumn FieldName="ProTradeID" Caption="Pro Trade Account"
                                                                            ReadOnly="True" VisibleIndex="5">
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        
                                                                         <dxwgv:GridViewDataTextColumn FieldName="brokid" Caption="Broker Account"
                                                                            ReadOnly="True" VisibleIndex="6">
                                                                            <EditFormCaptionStyle Wrap="False">
                                                                            </EditFormCaptionStyle>
                                                                            <CellStyle CssClass="gridcellleft">
                                                                            </CellStyle>
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                          
                                                                        
                                                                        <dxwgv:GridViewCommandColumn VisibleIndex="7">
                                                                            <ClearFilterButton Visible="True">
                                                                            </ClearFilterButton>
                                                                            <DeleteButton Visible="True">
                                                                            </DeleteButton>
                                                                            <EditButton Visible="True">
                                                                            </EditButton>
                                                                            <HeaderTemplate>
                                                                                <a href="javascript:void(0);" onclick="gridTerminal.AddNewRow()"><span style="color: #000099;
                                                                                    text-decoration: underline">Add New</span></a>
                                                                            </HeaderTemplate>
                                                                        </dxwgv:GridViewCommandColumn>
                                                                    </columns>
                                                <templates>
                                                                        <EditForm>
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Company Name :</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <dxe:ASPxComboBox ID="comboCompany" runat="server" EnableSynchronization="False"
                                                                                            EnableIncrementalFiltering="True" DataSourceID="sqlCompany" TextField="cmp_name"
                                                                                            ValueField="cmp_internalId" ClientInstanceName="combo" Width="300px" ValueType="System.String"
                                                                                            Font-Size="10px"  >
                                                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                                                                var indexr = s.GetSelectedIndex();
                                                                                                                setvaluetovariable(indexr)
                                                                                                                }" />
                                                                                            <ButtonStyle Width="13px">
                                                                                            </ButtonStyle>
                                                                                        </dxe:ASPxComboBox>
                                                                                    </td>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Exchange :</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <dxe:ASPxComboBox ID="comboExchange" runat="server" DataSourceID="SqlExchange" TextField="Exchange"
                                                                                            EnableSynchronization="False" EnableIncrementalFiltering="True" ValueField="exch_internalId"
                                                                                            ValueType="System.String" Width="300px" Font-Size="10px" ClientInstanceName="combo1"
                                                                                            OnCallback="comboExchange_Callback"  >
                                                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                                                                var indexr = s.GetSelectedIndex();
                                                                                                                setvaluetovariable1(indexr)
                                                                                                                }" />
                                                                                            <ButtonStyle Width="13px">
                                                                                            </ButtonStyle>
                                                                                        </dxe:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                 <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">CTCL Vender ID:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <dxe:ASPxComboBox ID="comboVendor" runat="server" DataSourceID="SqlVendor" TextField="CTCLVendor_Name"
                                                                                            ValueField="CTCLVendor_ID" ValueType="System.String" Width="300px" Font-Size="10px"
                                                                                            ClientInstanceName="combo2" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                                                            OnCallback="comboVendor_Callback" >
                                                                                            <ButtonStyle Width="13px">
                                                                                            </ButtonStyle>
                                                                                        </dxe:ASPxComboBox>
                                                                                    </td>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Broker:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <asp:TextBox ID="txtBrokername" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td class="gridcellleft" style="display:none">
                                                                                        <asp:TextBox ID="txtMappinID" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Terminal Id:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <asp:TextBox ID="txtTerminalId" runat="server" MaxLength="50" CssClass="EcoheadCon" 
                                                                                            Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Parent TerminalId:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <dxe:ASPxComboBox ID="parentTerID" runat="server" DataSourceID="SqlParentTerminal"
                                                                                            TextField="TradingTerminal_TerminalID" ValueField="TradingTerminal_TerminalID"
                                                                                            EnableSynchronization="False" EnableIncrementalFiltering="True" Font-Size="10px"
                                                                                            Width="300px" ValueType="System.String"  >
                                                                                            <ButtonStyle Width="13px">
                                                                                            </ButtonStyle>
                                                                                        </dxe:ASPxComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                                 
                                                                                <tr>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Options Account:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <asp:TextBox ID="txtContactName" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">CTCLID/Group:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <asp:TextBox ID="txtCTCLID" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <%--<tr>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Broker:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <asp:TextBox ID="txtBrokername" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black"></span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        
                                                                                    </td>
                                                                                </tr>--%>
                                                                                <tr>
                                                                                   
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Connection Mode:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <asp:TextBox ID="txtConnection" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Activation Date:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                     <dxe:ASPxDateEdit ID="dtActivation" runat="server"  EditFormat="Custom"  UseMaskBehavior="True" width="300px" >
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxDateEdit>
                                                                                    
                                                                                      <%--  <dxe:ASPxDateEdit ID="dtActivation" runat="server" Font-Size="10px" Width="200px"
                                                                                            EditFormat="Custom" EditFormatString="dd-mm-yyyy" UseMaskBehavior="True">
                                                                                            <ButtonStyle Width="13px">
                                                                                            </ButtonStyle>
                                                                                        </dxe:ASPxDateEdit>--%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Deactivation Date:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                    <dxe:ASPxDateEdit ID="dtDeactivation"    runat="server" EditFormat="Custom"  UseMaskBehavior="True" width="300px" >
                                                                                        <ButtonStyle Width="13px">
                                                                                        </ButtonStyle>
                                                                                    </dxe:ASPxDateEdit>
                                                                                      <%--  <dxe:ASPxDateEdit ID="dtDeactivation" runat="server" Font-Size="10px" Width="200px"
                                                                                            EditFormat="Custom" EditFormatString="dd-mm-yyyy" UseMaskBehavior="True">
                                                                                            <ButtonStyle Width="13px">
                                                                                            </ButtonStyle>
                                                                                        </dxe:ASPxDateEdit>--%>
                                                                                    </td>
                                                                                    <td style="text-align: right" id="all1">
                                                                                        <span class="Ecoheadtxt" style="color: Black">All Trade Account:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft" id="all2">
                                                                                        <asp:TextBox ID="txtAllTrade" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <%--<tr>
                                                                                    <td style="text-align: right">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Broker:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft">
                                                                                        <asp:TextBox ID="txtBrokername" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td class="gridcellleft" style="display:none">
                                                                                        <asp:TextBox ID="txtMappinID" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td style="text-align: right" id="all1">
                                                                                        <span class="Ecoheadtxt" style="color: Black">All Trade Name:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft" id="all2">
                                                                                        <asp:TextBox ID="txtAllTrade" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                </tr>--%>
                                                                                <tr id="client_pro">
                                                                                    <td style="text-align: right" id="client1">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Client Trade Account:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft" id="client2">
                                                                                        <asp:TextBox ID="txtClientTrade" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                    <td style="text-align: right" id="pro1">
                                                                                        <span class="Ecoheadtxt" style="color: Black">Pro Trade Account:</span>
                                                                                    </td>
                                                                                    <td class="gridcellleft" id="pro2">
                                                                                        <asp:TextBox ID="txtProductTrade" runat="server" CssClass="EcoheadCon" Width="300px" ></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                
                                                                                <tr>
                                                                                    <td colspan="3" style="text-align: right">
                                                                                        <input id="Button1" type="button" value="Save" onclick="GetClick()" class="btnUpdate"
                                                                                            style="width: 88px; height: 28px"  />
                                                                                    </td>
                                                                                    <td style="text-align: left;" colspan="1">
                                                                                        <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data"
                                                                                            Height="18px" Width="88px" AutoPostBack="False" >
                                                                                            <ClientSideEvents Click="function(s, e) {gridTerminal.CancelEdit();}" />
                                                                                        </dxe:ASPxButton>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2" style="text-align: right; display: none" id="TdCombo">
                                                                                        <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" ClientInstanceName="btnC" OnCallback="ASPxComboBox1_Callback"
                                                                                            ValueType="System.String" BackColor="#C1D7F8" ForeColor="#C1D7F8">
                                                                                            <Border BorderColor="#C1D7F8" />
                                                                                            <ButtonStyle BackColor="#C1D7F8" ForeColor="#C1D7F8">
                                                                                                <BorderBottom BorderColor="#C1D7F8" BorderStyle="None" />
                                                                                                <Border BorderColor="#C1D7F8" BorderStyle="None" />
                                                                                                <BorderLeft BorderStyle="None" />
                                                                                                <DisabledStyle BackColor="#C1D7F8">
                                                                                                </DisabledStyle>
                                                                                            </ButtonStyle>
                                                                                            <DropDownButton Visible="False">
                                                                                            </DropDownButton>
                                                                                            <ClientSideEvents EndCallback="function(s, e) {Message(btnC.cpDataExists);}" />
                                                                                        </dxe:ASPxComboBox>
                                                                                    </td>
                                                                                    <td style="display: none">
                                                                                        <asp:TextBox ID="txtProductTrade_hidden" runat="server"></asp:TextBox>
                                                                                        <asp:TextBox ID="txtClientTrade_hidden" runat="server"></asp:TextBox>
                                                                                        <asp:TextBox ID="txtAllTrade_hidden" runat="server"></asp:TextBox>
                                                                                        <asp:TextBox ID="txtContactName_hidden" runat="server"></asp:TextBox>
                                                                                        <asp:TextBox ID="txtBrokername_hidden" runat="server"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </EditForm>
                                                                    </templates>
                                                <clientsideevents endcallback="function(s,e){CheckingTD(gridTerminal.cpExist);}" />
                                            </dxwgv:ASPxGridView>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            
                            </TabPages>
                             <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            
	                                            var Tab2 = page.GetTab(2);
	                                           
	                                           
	                                            
	                                            if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                           
	                                            
	                                            }"></ClientSideEvents>
                        </dxtc:ASPxPageControl>
                      
                        <asp:SqlDataSource ID="sqlCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select cmp_internalId,cmp_name from tbl_master_company"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlExchange" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select exch_internalId,(select exh_shortName from tbl_master_exchange where exh_cntId=tbl_master_companyExchange.exch_exchId)+'-'+ exch_segmentId as Exchange from tbl_master_companyExchange where exch_compId=@CompID">
                            <SelectParameters>
                                <asp:SessionParameter Name="CompID" SessionField="ID" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlParentTerminal" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select distinct TradingTerminal_TerminalID from Master_TradingTerminal">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlVendor" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select CTCLVendor_ID,CTCLVendor_Name+' ['+CTCLVendor_ProductType+']' as CTCLVendor_Name from Master_CTCLVendor where CTCLVendor_ExchangeSegment=@CompID1">
                            <SelectParameters>
                                <asp:SessionParameter Name="CompID1" SessionField="ID1" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="TrdTerminal" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select td.TradingTerminal_ID,e.exh_shortName+'-'+ce.exch_segmentId as Exchange,td.TradingTerminal_TerminalID,td.TradingTerminal_ParentTerminalID,td.TradingTerminal_ProTradeID,td.TradingTerminal_brokerid ,(select isnull(cnt_firstName,'') +' '+isnull(cnt_middleName,'')+' '+isnull(cnt_lastName,'')+ ' [' + isnull(ltrim(rtrim(cnt_UCC)),'') + '] ' from tbl_master_contact where cnt_internalId=td.TradingTerminal_BrokerID) as brokid,(Select  ISNULL(ltrim(rtrim(cnt_firstName)), '') + ' ' + ISNULL(ltrim(rtrim(cnt_middleName)), '')   + ' ' + ISNULL(ltrim(rtrim(cnt_lastName)), '') + ' [' + isnull(ltrim(rtrim(cnt_UCC)),'') + '] ' AS cnt_firstName from tbl_master_contact WHERE  cnt_internalid =td.TradingTerminal_ProTradeID) as ProTradeID,(Select  ISNULL(ltrim(rtrim(cnt_firstName)), '') + ' ' + ISNULL(ltrim(rtrim(cnt_middleName)), '')   + ' ' + ISNULL(ltrim(rtrim(cnt_lastName)), '') + ' [' + isnull(ltrim(rtrim(cnt_UCC)),'') + '] ' AS cnt_firstName from tbl_master_contact WHERE  cnt_internalid =td.TradingTerminal_CliTradeID) as CliTradeID,(Select  ISNULL(ltrim(rtrim(cnt_firstName)), '') + ' ' + ISNULL(ltrim(rtrim(cnt_middleName)), '')   + ' ' + ISNULL(ltrim(rtrim(cnt_lastName)), '') + ' [' + isnull(ltrim(rtrim(cnt_UCC)),'') + '] ' AS cnt_firstName from tbl_master_contact WHERE  cnt_internalid =td.TradingTerminal_AllTradeID) as AllTradeID from  Master_TradingTerminal td, tbl_master_exchange e, tbl_master_companyExchange ce where td.TradingTerminal_CompanyID=ce.exch_compId  and td.TradingTerminal_ExchangeSegmentID=ce.exch_InternalId and  e.exh_cntId=ce.exch_exchId and td.TradingTerminal_BranchID=@BranchID order by TradingTerminal_ID desc"
                            DeleteCommand="delete from Master_TradingTerminal where TradingTerminal_ID=@TradingTerminal_ID">
                            <SelectParameters>
                                <asp:SessionParameter Name="BranchID" SessionField="KeyVal_InternalID" Type="string" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="TradingTerminal_ID" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
