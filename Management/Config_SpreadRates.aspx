<%@ page language="C#" autoeventwireup="true" inherits="management_Config_SpreadRates, App_Web_ng-agpzn" %>

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
     function Page_Load()
        {
             document.getElementById('txtCustomer_hidden').value='';
                document.getElementById('tdcustomer').style.display='inline';
                          document.getElementById('tdtxtcustomer').style.display='inline';
                          document.getElementById('tdgroup').style.display='none';
                          document.getElementById('tdtxtgroup').style.display='none';
                          crbbrk.SetValue('C');
        
        }
       function ShowHeight(obj)
       {
            
           height();
       }
         function height()
        {
                        
            if(document.body.scrollHeight>400)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '400px';
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
         cPopUpAddSpreadRate.Show();
         cCbpAddSpreadRates.PerformCallback('Add~');
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
            cCbpAddSpreadRates.PerformCallback('Save~');
            }
        else
            {
               cCbpAddSpreadRates.PerformCallback('SaveUpdate~'+RowID);
            
            }
       }
        function CbpAddSpreadRates_EndCallBack()
        {
        
         var producttype= crbProduct.GetValue();
               
         if(producttype=='A')
            {
                
                 document.getElementById('tdProductTxt').style.display='none';
                 document.getElementById('tdProductId').style.display='none';
            
            }
           else
            {
            
             document.getElementById('tdProductTxt').style.display='inline';
             document.getElementById('tdProductId').style.display='inline';
            
            }
        
           if(cCbpAddSpreadRates.cpIsInsert!=null)
           {
                alert(cCbpAddSpreadRates.cpIsInsert);
                if(cCbpAddSpreadRates.cpIsInsert=='Successfully Saved' || cCbpAddSpreadRates.cpIsInsert=='Successfully Updated' || cCbpAddSpreadRates.cpIsInsert=='Successfully Deleted') 
                {
                    cPopUpAddSpreadRate.Hide();
                    grid.PerformCallback('RefreshGridView');
                }
           }
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
                    
                   cdtFromDate.SetEnabled(false);
                 if(data[2]=='0')
                    {
                    
                        document.getElementById('PopUpAddSpreadRate_CbpAddSpreadRates_txtproductid_hidden').value='';
                         document.getElementById('tdProductTxt').style.display='none';
                          document.getElementById('tdProductId').style.display='none';
                          crbProduct.SetValue('A');
                          
                    }
                 else
                   {
                 
                    document.getElementById('PopUpAddSpreadRate_CbpAddSpreadRates_txtproductid_hidden').value=data[2];
                    document.getElementById('tdProductTxt').style.display='inline';
                          document.getElementById('tdProductId').style.display='inline';
                          crbProduct.SetValue('S');
                          
                   }
                   
                   
                    
//                document.getElementById('PopUpAddSpreadRate_CbpAddSpreadRates_txtCustomer_hidden').value=data[2];
//                document.getElementById('PopUpAddSpreadRate_CbpAddSpreadRates_txtLinkedAccount_hidden').value=data[3];  
                }
               else if(AddOrEdit=='Add')
              {
                    cdtFromDate.SetEnabled(true);
                       document.getElementById('PopUpAddSpreadRate_CbpAddSpreadRates_txtproductid_hidden').value='';
                         document.getElementById('tdProductTxt').style.display='none';
                          document.getElementById('tdProductId').style.display='none';
                          crbProduct.SetValue('A');    
              
              }
            cPopUpAddSpreadRate.Show();
            cCbpAddSpreadRates.PerformCallback(obj);
            height();
          }
           function DeleteItem(e,obj)
           {
          
           AddOrEdit=obj.split('~')[0];
           var data=obj.split('~');
           var conf=confirm('Do you want to delete ?');
           if(conf)
            {
               // cPopUpAddSpreadRate.Show();
                cCbpAddSpreadRates.PerformCallback(obj);
                height(); 
            
            }
           
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
            
            function ShowType(obj)
                {
                   
                    
                    document.getElementById("txtGroup_hidden").value='';
//                    alert('1');
                    document.getElementById("txtGroup").value='';
//                    alert('2');
                    document.getElementById("txtCustomer_hidden").value='';
//                    alert('3');
                    document.getElementById("txtCustomer").value='';
//                    alert('a');
                    if(obj=='C')
                    {
                      document.getElementById('tdcustomer').style.display="inline";
                      document.getElementById('tdtxtcustomer').style.display="inline";
                      document.getElementById('tdtxtgroup').style.display="none";
                      document.getElementById('tdgroup').style.display="none";
                      
            //          cmbCompany.SetText('');
            //           ddlsegment.SetText('');
                    }
                    if(obj=='G')
                    {
                      document.getElementById('tdcustomer').style.display="none";
                      document.getElementById('tdtxtcustomer').style.display="none";
                      document.getElementById('tdtxtgroup').style.display="inline";
                      document.getElementById('tdgroup').style.display="inline";
                       
            //          cmbCompany.SetText('');
            //          ddlsegment.SetText('');
                    }
                
                }
        
          function noNumbers(e)
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
          function SetValueforAList(val1,val2,val3)
            {
               
                document.getElementById('hiddenSegmentName').value=val1;
                document.getElementById('hiddenCompany').value=val2;        
                document.getElementById('hiddenUserBranchHrch').value=val3;    
            
            }
             function GetCustomers(obj1,obj2,obj3)
          {
            var segname= document.getElementById('hiddenSegmentName').value;
            var compname=document.getElementById('hiddenCompany').value;
            var userbranchhrch=document.getElementById('hiddenUserBranchHrch').value;
           var strQuery_Table = "tbl_master_contact,tbl_master_branch ,tbl_master_contactexchange";
           var strQuery_FieldName = " distinct top 10 rtrim(ltrim(isnull(cnt_firstName,'')))+ ' ' + rtrim(ltrim(isnull(cnt_middlename,'')))+' '+ rtrim(ltrim(isnull(cnt_lastname,''))) +\' [ \'+rtrim(ltrim(isnull(crg_tcode,'')))+\' ]\' + ' [ ' + rtrim(ltrim(isnull(BRANCH_DESCRIPTION,''))) + ' ]' as Customername,rtrim(ltrim(cast(cnt_internalID as varchar))) as CustomerId";
           var strQuery_WhereClause = " cnt_branchid=branch_id and crg_cntid=cnt_internalid and cnt_internalid like 'CL%' AND CRG_COMPANY ='" + compname + "'  and CRG_EXCHANGE in ('" + segname + "') and  (crg_tcode like (\'%RequestLetter%\') or CNT_FIRSTNAME like (\'%RequestLetter%\')) and branch_id in (" + userbranchhrch + ")" ;
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
          
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main'); 
          }
          function GetGroups(obj1,obj2,obj3)
          {
            var segname= document.getElementById('hiddenSegmentName').value;
            var compname=document.getElementById('hiddenCompany').value;
            var userbranchhrch=document.getElementById('hiddenUserBranchHrch').value;
           var strQuery_Table = "Master_ChargeGroup mcg";
           var strQuery_FieldName = " top 10 (isnull(ChargeGroup_Name,''))+'[' + ChargeGroup_Code+']'as d ,mcg.ChargeGroup_Code";
           var strQuery_WhereClause = "  mcg.ChargeGroup_Type='1' and  (mcg.ChargeGroup_Code like (\'%RequestLetter%\') or mcg.ChargeGroup_Name Like (\'%RequestLetter%\')) " ;
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
          
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main'); 
          }
          
           function GetProducts(obj1,obj2,obj3)
          {
            var segname= document.getElementById('hiddenSegmentName').value;
            var compname=document.getElementById('hiddenCompany').value;
            var userbranchhrch=document.getElementById('hiddenUserBranchHrch').value;
           var strQuery_Table = "master_rollingcontracts rc,Master_Products mp,Master_ProductTypes mpt";
           var strQuery_FieldName = " top 10 mp.Products_Name +'['+ mpt.ProductType_Name +']' as dd,mp.Products_ID";
           var strQuery_WhereClause = "  rc.RollingContracts_ProductID=mp.Products_ID and mpt.ProductType_ID=mp.Products_ProductTypeID and mp.Products_Name Like (\'%RequestLetter%\') " ;
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
        
        function ShowProduct(obj)
            {
               if(obj=='A')
                {
                    document.getElementById('tdProductTxt').style.display="none";
                    document.getElementById('tdProductId').style.display="none";
                
                }
               else
                   {
                     document.getElementById('PopUpAddSpreadRate_CbpAddSpreadRates_txtproductid').value='';
                     document.getElementById('PopUpAddSpreadRate_CbpAddSpreadRates_txtproductid_hidden').value='';
                     document.getElementById('tdProductTxt').style.display="inline";
                     document.getElementById('tdProductId').style.display="inline";
                        
                    
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
         <table class="TableMain100" border="0" width="100%">
                    <tr>
                            <td class="EHEADER" align="center" style="width: 100%">
                                    <strong><span id="SpanHeader" style="color: #000099">Spread Rates</span></strong>
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
                                    <table>
                                            <tr>
                                                        <td style="font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Type :
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxRadioButtonList ID="rbbrk" ClientInstanceName="crbbrk" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                <Items>
                                    <dxe:ListEditItem Text="Customer" Value="C" />
                                    <dxe:ListEditItem Text="Group" Value="G" />
                                </Items>
                                <ClientSideEvents ValueChanged="function(s, e) {ShowType(s.GetValue());}" />
                                <Border BorderWidth="0px" />
                            </dxe:ASPxRadioButtonList>
                                                        </td>
                                                        <td id="tdcustomer" style="font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Customer :
                                                        </td>
                                                        <td id="tdtxtcustomer">
                                                           <asp:TextBox ID="txtCustomer" runat="server" Width="200px" Font-Size="11px" onkeyup="GetCustomers(this,'GenericAjaxList',event)" ></asp:TextBox>
                                                           <asp:HiddenField ID="txtCustomer_hidden" runat="server" />
                                                        </td>
                                                        <td id="tdgroup" style="font-weight: bold; color: #000099" class="gridcellleft">
                                                            Group :
                                                        </td>
                                                        <td id="tdtxtgroup">
                                                            <asp:TextBox ID="txtGroup" runat="server" Width="200px" Font-Size="11px" onkeyup="GetGroups(this,'GenericAjaxList',event)"></asp:TextBox>
                                                              <asp:HiddenField ID="txtGroup_hidden" runat="server" />
                                                           
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxButton ID="btnShow" runat="server" Text="Show" 
                                 AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback();
}"></ClientSideEvents>
                            </dxe:ASPxButton>
                                                        </td>
                                                    </tr>
                                    </table>
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
                        <dxwgv:ASPxGridView ID="gridSpreadRates" runat="server" ClientInstanceName="grid"
                            Width="100%" KeyFieldName="SpreadRates_ID" AutoGenerateColumns="False"  DataSourceID="sqlSpreadRates" OnCustomCallback="gridSpreadRates_CustomCallback"
                            OnCustomJSProperties="gridSpreadRates_CustomJSProperties" OnHtmlDataCellPrepared="gridSpreadRates_HtmlDataCellPrepared">
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
                                <dxwgv:GridViewDataTextColumn Caption="Products Type" FieldName="SpreadRates_Products" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Product" FieldName="Products_ShortName"
                                    VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="From Date" FieldName="SpreadRates_FromDate"
                                    VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ToDate" FieldName="SpreadRates_ToDate"
                                    VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="SpreadRatesBasis" FieldName="SpreadRatesBasis"
                                    VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Rates" FieldName="SpreadRates_Rate"
                                    VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                                         
                                                         
                               
                                <dxwgv:GridViewDataTextColumn VisibleIndex="6">
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" style="color: #800000;font-weight:bold" onclick="EditItem(this,'Add~')">Add Items</a>
                                    </HeaderTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000" onclick="EditItem(this,'Edit~'+'<%# Container.KeyValue %>' + '~' + '<%# DataBinder.Eval(Container.DataItem, "SpreadRates_ProductID") %>' + '~' + '<%# DataBinder.Eval(Container.DataItem, "SpreadRates_Type") %>' + '~' + '<%# DataBinder.Eval(Container.DataItem, "SpreadRates_CustomerID") %>' )" >
                                           Edit </a>&nbsp;
                                            <a href="javascript:void(0);" style="color: #800000" onclick="DeleteItem(this,'Delete~'+'<%# Container.KeyValue %>')">Delete</a>
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
                        <asp:SqlDataSource ID="sqlSpreadRates" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                           >
                            
                        </asp:SqlDataSource>
                    </td>
                    <td>
                       
                        <dxpc:ASPxPopupControl ID="PopUpAddSpreadRate" ClientInstanceName="cPopUpAddSpreadRate"
                            runat="server" AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Add SpreadRate"
                            EnableHotTrack="False" BackColor="#DDECFE" Width="100%" DisappearAfter="500"
                            CloseAction="CloseButton">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                    <dxcp:ASPxCallbackPanel ID="CbpAddSpreadRates" runat="server" Width="100%" ClientInstanceName="cCbpAddSpreadRates"
                                        OnCallback="CbpAddSpreadRates_Callback">
                                        <PanelCollection>
                                            <dxp:PanelContent runat="server">
                                                <table style="width: 669px" border="1">
                                                    
                                                    <tr>
                                                        <td  style="font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Product :
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxRadioButtonList ID="rbProduct" ClientInstanceName="crbProduct" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                                            RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                                            <Items>
                                                                <dxe:ListEditItem Text="All" Value="A" />
                                                                <dxe:ListEditItem Text="Select" Value="S" />
                                                            </Items>
                                                            <ClientSideEvents ValueChanged="function(s, e) {ShowProduct(s.GetValue());}" />
                                                            <Border BorderWidth="0px" />
                                                        </dxe:ASPxRadioButtonList>
                                                        </td>
                                                        <td id="tdProductTxt"  style="font-weight: bold; color: #000099" class="gridcellleft">
                                                            Product Id :
                                                        </td>
                                                        <td colspan="3" id="tdProductId">
                                                            <asp:TextBox runat="server" width="200px" Font-Size="10px" ID="txtproductid" onkeyup="GetProducts(this,'GenericAjaxList',event)" ></asp:TextBox>
                                                            <asp:HiddenField ID="txtproductid_hidden" runat="server" />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Rate Basis :
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxComboBox  runat="server" ID="ddlbrokeragetype" SelectedIndex="0" width="125px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                            <Items>
                                                              <dxe:ListEditItem Text="Fixed per lot" Value="F">
                                                              </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="Percentage of daily price" Value="P">
                                                              </dxe:ListEditItem>
                                                                                                                 
                                                            </Items>
                                                         </dxe:ASPxComboBox>
                                                        </td>
                                                        <td style="font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Rate :
                                                        </td>
                                                         <td colspan="3">
                                                            <dxe:ASPxTextBox runat="server" width="125px" ID="txtrate" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..99999999g>.<00..99999999>"  />
                                                               <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                          </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td style="font-weight: bold; color: #000099;" class="gridcellleft">
                                                            From Date :
                                                        </td>
                                                        <td colspan="5">
                                                            
                                                            <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" EditFormat="Custom"
                                                                 Width="130px" EditFormatString="dd-MM-yyyy" 
                                                                 ID="dtFromDate" ClientInstanceName="cdtFromDate">
                                                                <ButtonStyle Width="13px">
                                                                </ButtonStyle>
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                                                                                        
                                                            <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                                                                            style="width: 60px" tabindex="0" />
                                                        </td>
                                                        <td colspan="5">
                                                             <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" onclick="cPopUpAddSpreadRate.Hide();"
                                                                style="width: 60px" tabindex="0" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            
                                            
                                                
                                            </dxp:PanelContent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="function(s, e) {
	                                                    CbpAddSpreadRates_EndCallBack();
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
             <asp:HiddenField ID="hiddenUserBranchHrch" runat="server" />
            <br />
        </div>
    </form>
</body>
</html>
