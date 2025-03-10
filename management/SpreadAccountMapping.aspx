<%@ page language="C#" autoeventwireup="true" inherits="management_SpreadAccountMapping, App_Web_nidspgif" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
		z-index:32761;
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
    #txtIssuingBank
    {
        z-index:10000;
        
    }
    
    .bubblewrap{
    list-style-type:none;
    margin:0;
    padding:0;
    }

    .bubblewrap li{
    display:inline;
    width: 65px;
    height:60px;
    }

    .bubblewrap li img{
    width: 30px; /* width of each image.*/
    height: 35px; /* height of each image.*/
    border:0;
    margin-right: 12px; /*spacing between each image*/
    -webkit-transition:-webkit-transform 0.1s ease-in; /*animate transform property */
    -o-transition:-o-transform 0.1s ease-in; /*animate transform property in Opera */
    }

    .bubblewrap li img:hover{
    -moz-transform:scale(1.8); /*scale up image 1.8x*/
    -webkit-transform:scale(1.8);
    -o-transform:scale(1.8);
    
	</style>
	<link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
    

    <script language="javascript" type="text/javascript">
    //Global Variable
        FieldName = 'abc';
     //
       function ShowHeight(obj)
       {
            
           height();
       }
         function height()
        {
                        
            if(document.body.scrollHeight>250)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '250px';
            window.frameElement.widht = document.body.scrollWidht;
            
        }
        
        
        function OnMoreInfoClick(keyValue) 
        {
            var url='frmProductComDerivativeDetails.aspx?id='+keyValue;
            parent.OnMoreInfoClick(url,"Show Items",'930px','550px',"Y")
         
        }
        function OnMoreInfo(keyValue,keyvalue1) 
        {
            var url='frmProductComDerivativeRates.aspx?id='+keyValue+','+keyvalue1;
            parent.OnMoreInfoClick(url,"Show Rates",'930px','470px',"Y")
         
        }
        
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
         function callback()
        {
            //alert('tt');
            grid.PerformCallback();
        }
        function CallProductList(obj1,obj2,obj3)
        {
           var strQuery_Table = "Master_Products";
           var strQuery_FieldName = "Top 10 Ltrim(Rtrim(Products_Name))+' ['+Ltrim(Rtrim(Products_ShortName))+'] ' as TextValue,Cast(Products_ID as Varchar)+'^'+Ltrim(Rtrim(Products_Name))+'^'+Ltrim(Rtrim(Products_ShortName)) as DataValue";
           var strQuery_WhereClause = "Products_ProductTypeID=10 and (Products_Name like 'RequestLetter%' or Products_ShortName like 'RequestLetter%')";
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery)); 
        }
        function replaceChars(entry) {
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
       function AddItem()
       {
         cPopUpAddSpreadAccount.Show();
         cCbpAddSpreadAccounts.PerformCallback('Add~');
       }
       function ddlAssetSubType_ValueChange(SelectedValue)
       {
        if(SelectedValue=="34")
        {
            document.getElementById("Tr_Option_Exercise").style.display="none";
        }
        else
        {
            document.getElementById("Tr_Option_Exercise").style.display="inline";
        }
       }
       function btnSave_Click()
       {
      
//        var obj=document.getElementById(
        if(AddOrEdit=='Add')
            {
            cCbpAddSpreadAccounts.PerformCallback('Save~');
            }
        else
            {
               cCbpAddSpreadAccounts.PerformCallback('SaveUpdate~'+RowID);
            
            }
       }
        function CbpAddSpreadAccounts_EndCallBack()
        {
           if(cCbpAddSpreadAccounts.cpIsInsert!=null)
           {
                alert(cCbpAddSpreadAccounts.cpIsInsert);
                if(cCbpAddSpreadAccounts.cpIsInsert=='Successfully Saved' || cCbpAddSpreadAccounts.cpIsInsert=='Successfully Updated') 
                {
                    cPopUpAddSpreadAccount.Hide();
                    grid.PerformCallback('RefreshGridView');
                }
           }
        }
        
        function GetClients(obj1,obj2,obj3)
          {
            var segname= document.getElementById('hiddenSegmentName').value;
            var compname=document.getElementById('hiddenCompany').value;
           var strQuery_Table = "tbl_master_contact ,tbl_master_contactexchange,tbl_master_branch";
           var strQuery_FieldName = " top 10 rtrim(ltrim(isnull(cnt_firstname,'')))+ ' ' + rtrim(ltrim(isnull(cnt_middlename,'')))+' '+ rtrim(ltrim(isnull(cnt_lastname,''))) +\' [ \'+rtrim(ltrim(isnull(cnt_ucc,'')))+\' ]\' + ' [ ' + rtrim(ltrim(isnull(branch_description,''))) + ' ]' as Clientname,rtrim(ltrim(cast(cnt_internalid as varchar))) as Clientid";
           var strQuery_WhereClause = " cnt_internalid=crg_cntid and cnt_branchid=branch_id and (cnt_firstname like (\'%RequestLetter%\') or cnt_ucc like (\'%RequestLetter%\')) and  crg_company='" + compname + "' and crg_exchange='" + segname + "'" ;
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main'); 
          }
         function replaceChars(entry) {
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
        
         function SetValueforclient(val1,val2)
            {
               
                document.getElementById('hiddenSegmentName').value=val1;
                document.getElementById('hiddenCompany').value=val2;           
                
            
            }
         function EditItem(e,obj)
           {
          
           AddOrEdit=obj.split('~')[0];
//            FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
//            Filter='N';
            RowID='';
            if(AddOrEdit=='Edit')
              {
                var data=obj.split('~');
                if(data.length>1)
                    RowID=data[1];
                    
                 
                document.getElementById('PopUpAddSpreadAccount_CbpAddSpreadAccounts_txtCustomer_hidden').value=data[2];
                document.getElementById('PopUpAddSpreadAccount_CbpAddSpreadAccounts_txtLinkedAccount_hidden').value=data[3];  
                }
            cPopUpAddSpreadAccount.Show();
            cCbpAddSpreadAccounts.PerformCallback(obj);
          }
          function SetClientsEdit(val1,val2)
            {
                document.getElementById('txtCustomer_hidden').value=val1;
                document.getElementById('txtLinkedAccount_hidden').value=val2; 
                       
            }
          function btnUpdate_Click()
           {
    //        var obj=document.getElementById(
           // cCbpAddSpreadAccounts.PerformCallback('Save~');
           }
           function SaveOptions(objVal)
            {
                
                if(objVal=='add')
                    {
                       document.getElementById('btnSave').style.display='inline';
                       document.getElementById('btnUpdate').style.display='none';
                    
                    }
                 else
                    {
                       document.getElementById('btnUpdate').style.display='inline';
                       document.getElementById('btnSave').style.display='none';
                    }
            
            
            }
        
    </script>

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
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div>
         <table class="TableMain100" border="0" width="100%">
                    <tr>
                            <td class="EHEADER" align="center" style="width: 100%">
                                    <strong><span id="SpanHeader" style="color: #000099">Spread Account Mapping</span></strong>
                            </td>
                                    
                                
                        </tr>
                    </table>
            <table class="TableMain100">
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
                                    <table>
                                        <tr>
                                            <td id="ShowFilter">
                                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                    Show Filter</span></a>
                                            </td>
                                            <td id="Td1">
                                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                    All Records</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                </td>
                                <td class="gridcellright" style="text-align: right">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" ValueType="System.Int32" Width="130px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                                        <%--OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"--%>
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="PDF" Value="1" />
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            <dxe:ListEditItem Text="RTF" Value="3" />
                                            <dxe:ListEditItem Text="CSV" Value="4" />
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridSpreadAccounts" runat="server" ClientInstanceName="grid"
                            Width="100%" KeyFieldName="SpreadAccount_ID" AutoGenerateColumns="False"  DataSourceID="sqlSpreadAccounts" OnCustomCallback="gridSpreadAccounts_CustomCallback"
                            OnCustomJSProperties="gridSpreadAccounts_CustomJSProperties" OnHtmlDataCellPrepared="gridSpreadAccounts_HtmlDataCellPrepared">
                            <ClientSideEvents EndCallback="function(s, e) {
	
	ShowHeight(s.cpHeight)
}" />
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="CustomerID" FieldName="customer" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="LinkedAccount" FieldName="Linkedacc"
                                    VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="SpreadAccount_Status"
                                    VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                                         
                               
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3">
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" style="color: #800000;font-weight:bold" onclick="EditItem(this,'Add~')">Add Items</a>
                                    </HeaderTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000" onclick="EditItem(this,'Edit~'+'<%# Container.KeyValue %>' + '~' + '<%# DataBinder.Eval(Container.DataItem, "SpreadAccount_CustomerID") %>' + '~' + '<%# DataBinder.Eval(Container.DataItem, "SpreadAccount_LinkedAccount") %>')" >
                                           Edit Items </a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Styles FocusedRow-BackColor="lightgray"></Styles>
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="sqlSpreadAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select SpreadAccount_ID,SpreadAccount_SegmentID,SpreadAccount_CustomerID,SpreadAccount_LinkedAccount,(select rtrim(ltrim(isnull(cnt_firstName,'')))  + rtrim(ltrim(isnull(cnt_middleName,''))) +
rtrim(ltrim(isnull(cnt_lastName,''))) + ' [' + rtrim(ltrim(isnull(cnt_UCC,''))) + ']' from tbl_master_contact  where 
 cnt_internalId=SpreadAccount_CustomerID) as customer,(select rtrim(ltrim(isnull(cnt_firstName,'')))  + rtrim(ltrim(isnull(cnt_middleName,''))) +
rtrim(ltrim(isnull(cnt_lastName,''))) + ' [' + rtrim(ltrim(isnull(cnt_UCC,''))) + ']'
from tbl_master_contact where 
cnt_internalId=SpreadAccount_LinkedAccount) as Linkedacc, case when SpreadAccount_Status='A' then 'Active' else 'Inactive' end as SpreadAccount_Status from Master_SpreadAccounts ">
                            
                        </asp:SqlDataSource>
                    </td>
                    <td>
                       
                        <dxpc:ASPxPopupControl ID="PopUpAddSpreadAccount" ClientInstanceName="cPopUpAddSpreadAccount"
                            runat="server" AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Add SpreadAccounts"
                            EnableHotTrack="False" BackColor="#DDECFE" Width="100%" DisappearAfter="500"
                            CloseAction="CloseButton">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                    <dxcp:ASPxCallbackPanel ID="CbpAddSpreadAccounts" runat="server" Width="100%" ClientInstanceName="cCbpAddSpreadAccounts"
                                        OnCallback="CbpAddSpreadAccounts_Callback">
                                        <PanelCollection>
                                            <dxp:PanelContent runat="server">
                                                <table style="width: 669px" border="1">
                                                    <tr>
                                                        <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Customer :</td>
                                                        <td style="width: 239px" class="gridcellleft">
                                                            <asp:TextBox ID="txtCustomer" runat="server" Width="95%" onfocus="this.select()" onkeyup="GetClients(this,'GenericAjaxList',event)"></asp:TextBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr id="Tr_Option_Exercise">
                                                        <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Linked Account :</td>
                                                        <td style="width: 239px" class="gridcellleft">
                                                           <asp:TextBox ID="txtLinkedAccount" runat="server" Width="95%" onfocus="this.select()" onkeyup="GetClients(this,'GenericAjaxList',event)"></asp:TextBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Status :</td>
                                                        <td style="width: 239px" class="gridcellleft">
                                                          <asp:DropDownList ID="drpStatus" runat="server">
                                                            <asp:ListItem Text="Active" Value="A"></asp:ListItem>
                                                            <asp:ListItem Text="DeActive" Value="D"></asp:ListItem>
                                                          </asp:DropDownList>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 126px" class="gridcellleft">
                                                            <asp:HiddenField ID="txtCustomer_hidden" runat="server" /><asp:HiddenField ID="txtLinkedAccount_hidden" runat="server" />
                                                            <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                style="width: 60px" tabindex="0" />
                                                                
                                                                
                                                                
                                                        </td>
                                                        <td style="width: 239px" class="gridcellleft">
                                                            <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" onclick="cPopUpAddSpreadAccount.Hide();"
                                                                style="width: 60px" tabindex="0" />
                                                        </td>
                                                       
                                                    </tr>
                                                </table>
                                            </dxp:PanelContent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="function(s, e) {
	                                                    CbpAddSpreadAccounts_EndCallBack();
                                                    }" />
                                    </dxcp:ASPxCallbackPanel>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                            <HeaderStyle HorizontalAlign="Left">
                                <Paddings PaddingRight="6px" />
                            </HeaderStyle>
                            <SizeGripImage Height="16px" Width="16px" />
                            <CloseButtonImage Height="12px" Width="13px" />
                        </dxpc:ASPxPopupControl>
                    </td>
                </tr>
                
            </table>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
            
            <asp:HiddenField ID="hiddenSegmentName" runat="Server" />
            <asp:HiddenField ID="hiddenCompany" runat="server" />
            <br />
        </div>
    </div>
    </form>
</body>
</html>
