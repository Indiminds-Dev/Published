<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductComDerivatives_iframe, App_Web_yf04ozfw" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
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
            parent.OnMoreInfoClick(url,"Show Items",'930px','550px',"Y");
         
        }
        
        function OnEditItemClick(keyValue0,keyValue1,keyValue2,keyValue3,keyValue4,keyValue5)
        {
//            alert(keyValue1+'-'+keyValue2+'-'+keyValue3+'-'+keyValue4+'-'+keyValue5);
            var url='frmProductComEditDetails.aspx?id='+keyValue0+','+keyValue1+','+keyValue2+','+keyValue3+','+keyValue4+','+keyValue5;
            parent.OnMoreInfoClick(url,"Edit Items",'690px','200px',"Y");
        }
        
        
        function OnMoreInfo(keyValue,keyvalue1) 
        {
            var url='frmProductComDerivativeRates.aspx?id='+keyValue+','+keyvalue1;
            parent.OnMoreInfoClick(url,"Show Rates",'930px','470px',"Y");
         
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
           var ProductTypeID=document.getElementById("hdn_ProductTypeID").value;
           var strQuery_Table = "Master_Products";
           var strQuery_FieldName = "Top 10 Ltrim(Rtrim(Products_Name))+' ['+Ltrim(Rtrim(Products_ShortName))+'] ' as TextValue,Cast(Products_ID as Varchar)+'^'+Ltrim(Rtrim(Products_Name))+'^'+Ltrim(Rtrim(Products_ShortName))+'^'+Cast(Products_ProductTypeID as Varchar) as DataValue";
           var strQuery_WhereClause = "Products_ProductTypeID in ("+ProductTypeID+") and (Products_Name like 'RequestLetter%' or Products_ShortName like 'RequestLetter%')";
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
       function OnAddItemClick()
       {
         cPopUpAddDerivative.Show();
         cCbpAddDerivative.PerformCallback('Add~');
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
        cCbpAddDerivative.PerformCallback('Save~');
       }
        function CbpAddDerivative_EndCallBack()
        {
           if(cCbpAddDerivative.cpIsInsert!=null)
           {
                alert(cCbpAddDerivative.cpIsInsert);
                if(cCbpAddDerivative.cpIsInsert=='Successfully Saved') 
                {
                    cPopUpAddDerivative.Hide();
                    grid.PerformCallback('RefreshGridView');
                }
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
                        <dxwgv:ASPxGridView ID="gridDerivatives" runat="server" ClientInstanceName="grid"
                            Width="100%" KeyFieldName="Products_ID" AutoGenerateColumns="False"  OnCustomCallback="gridDerivatives_CustomCallback"
                            OnCustomJSProperties="gridDerivatives_CustomJSProperties" OnHtmlDataCellPrepared="gridDerivatives_HtmlDataCellPrepared">
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
                                <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="Products_Name" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Asset Group" FieldName="AssetGroup"
                                    VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Type ID" FieldName="Products_ProductTypeID"
                                    VisibleIndex="2" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Instrument Type" FieldName="SubTypeName" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" Caption="Sector ID" FieldName="Products_SectorID"
                                    VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" Caption="DerivedFrom ID" FieldName="Products_DerivedFromID"
                                    ReadOnly="True" VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="true" Caption="Option Type" FieldName="Products_OptionType"
                                    ReadOnly="True" VisibleIndex="6">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="true" Caption="Exercise Style" FieldName="Products_ExerciseStyle"
                                    ReadOnly="True" VisibleIndex="6">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Index ID" FieldName="Products_IndexID" VisibleIndex="3"
                                    Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Item Details" VisibleIndex="10">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            Show Items</a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Item Rates" VisibleIndex="11">
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" style="color: #800000;font-weight:bold" onclick="OnAddItemClick()">Add Items</a>
                                    </HeaderTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000" >
                                            Show Rates</a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <%--added by krishnendu--%>
                               <%-- <dxwgv:GridViewDataTextColumn Caption="Item Edit" VisibleIndex="11">
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" style="color: #800000;font-weight:bold">Edit Items</a>
                                    </HeaderTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000" onclick="OnEditItemClick('<%# Container.KeyValue %>')" >Item Edit</a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>--%>
                                
                                <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="11">
                                    <HeaderTemplate>
                                    <a href="javascript:void(0);" style="color: #800000;font-weight:bold">
                                            Item Edit</a>
                                    </HeaderTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000" onclick="OnEditItemClick('<%# Container.KeyValue %>','<%#Eval("Products_Name") %>','<%#Eval("AssetGroup") %>','<%#Eval("SubTypeName") %>','<%#Eval("Products_OptionType") %>','<%#Eval("Products_ExerciseStyle") %>')">
                                            Edit Items</a>
                                    </DataItemTemplate>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
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
                       
                    </td>
                    <td>
                        <%-- New Addition (2012-02-02) --%>
                        <dxpc:ASPxPopupControl ID="PopUpAddDerivative" ClientInstanceName="cPopUpAddDerivative"
                            runat="server" AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Add Derivatives"
                            EnableHotTrack="False" BackColor="#DDECFE" Width="100%" DisappearAfter="500"
                            CloseAction="CloseButton">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                    <dxcp:ASPxCallbackPanel ID="CbpAddDerivative" runat="server" Width="100%" ClientInstanceName="cCbpAddDerivative"
                                        OnCallback="CbpAddDerivative_Callback">
                                        <PanelCollection>
                                            <dxp:PanelContent runat="server">
                                                <table style="width: 669px" border="1">
                                                    <tr>
                                                        <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Select Asset :</td>
                                                        <td style="width: 239px" class="gridcellleft">
                                                            <asp:TextBox ID="txtAsset" runat="server" Width="95%" onfocus="this.select()" onkeyup="CallProductList(this,'GenericAjaxList',event)"></asp:TextBox>
                                                        </td>
                                                        <td style="font-weight: bold; color: #000099; width: 157px;" class="gridcellleft">
                                                            &nbsp;Asset Sub Type :</td>
                                                        <td style="width: 100px" class="gridcellleft">
                                                            <asp:DropDownList ID="ddlAssetSubType" runat="server" onchange="ddlAssetSubType_ValueChange(this.value);">
                                                                <asp:ListItem Value="34">Future</asp:ListItem>
                                                                <asp:ListItem Value="35">Option</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr_Option_Exercise" style="display: none">
                                                        <td style="width: 126px; font-weight: bold; color: #000099;" class="gridcellleft">
                                                            Asset Option Type :</td>
                                                        <td style="width: 239px" class="gridcellleft">
                                                            <asp:DropDownList ID="ddlOptionType" runat="server">
                                                                <asp:ListItem Value="CALL">Call</asp:ListItem>
                                                                <asp:ListItem Value="PUT">Put</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="font-weight: bold; color: #000099; width: 157px;" class="gridcellleft">
                                                            Asset Exersice Style :</td>
                                                        <td style="width: 100px" class="gridcellleft">
                                                            <asp:DropDownList ID="ddlExercisestyle" runat="server">
                                                                <asp:ListItem Value="AMERICAN">American</asp:ListItem>
                                                                <asp:ListItem Value="EUROPIEAN">European</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 126px" class="gridcellleft">
                                                            <asp:HiddenField ID="txtAsset_hidden" runat="server" />
                                                            <%--                                                                        <asp:HiddenField ID="hdSubBroker" runat="server" />
                                                                        <asp:HiddenField ID="hdSubSeqBank" runat="server" />
                                                                        <input id="Hidden1" type="hidden" />
                                                                        <asp:HiddenField ID="childemployees" runat="server" />
                                                --%>
                                                        </td>
                                                        <td style="width: 239px" class="gridcellleft">
                                                        </td>
                                                        <td class="gridcellleft" style="width: 157px">
                                                            <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                style="width: 60px" tabindex="0" /></td>
                                                        <td style="width: 100px" class="gridcellleft">
                                                            <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" onclick="cPopUpAddDerivative.Hide();"
                                                                style="width: 60px" tabindex="0" /></td>
                                                    </tr>
                                                </table>
                                            </dxp:PanelContent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="function(s, e) {
	                                                    CbpAddDerivative_EndCallBack();
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
            
            
            <br />
        </div>
        <asp:HiddenField ID="hdn_ProductTypeID" runat="Server" />
    </form>
</body>
</html>
<%--Select  (Select ProductSubType_Name from Master_ProductSubTypes where ProductSubType_Id=P1.Products_ProductSubTypeID) as AssetGroup,t1.Products_ID,t1.Products_Name,t1.Products_ShortName,t1.Products_ProductTypeID,t1.Products_SectorID,t1.Products_DerivedFromID,t1.Products_OptionType,t1.Products_IndexID,t1.SubTypeName From (select P.Products_ID,P.Products_Name,P.Products_ShortName,P.Products_ProductTypeID,PS.ProductSubType_Name As SubTypeName,P.Products_SectorID,P.Products_DerivedFromID,P.Products_OptionType,P.Products_IndexID From Master_Products P,Master_ProductSubTypes PS Where P.Products_ProductTypeID=11 And P.Products_ProductSubTypeID=PS.ProductSubType_ID) t1, Master_Products P1 Where t1.Products_DerivedFromID=P1.Products_Id Order By P1.Products_Id--%>
<%--select P.Products_ID,P.Products_Name,P.Products_ShortName,P.Products_ProductTypeID,PS.ProductSubType_Name As SubTypeName,P.Products_SectorID,P.Products_DerivedFromID,P.Products_OptionType,P.Products_IndexID From Master_Products P,Master_ProductSubTypes PS Where P.Products_ProductTypeID=11 And P.Products_ProductSubTypeID=PS.ProductSubType_ID Order By P.Products_ID Desc--%>