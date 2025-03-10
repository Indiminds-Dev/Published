<%@ page language="C#" autoeventwireup="true" inherits="management_MaseterChargeAddMember, App_Web__yen2upk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
	     function showOptions(objID,ObjType,objEvent)
         {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
               var objSeg='';
               var objChrgCode='';
               //var objChrgType='';
               
               objSeg=document.getElementById("hidden_ExchSeg").value.split('~');                   
               objChrgCode=document.getElementById("hidden_ChrgGrpCode").value;
               //objChrgType=document.getElementById("hidden_ChrgGrpType").value;
               //alert(objSeg+"-"+objChrgCode);
               if(ObjType=='SearchCustomer')
               {
                   strQuery_Table = "tbl_master_contact,tbl_master_contactexchange";
                   strQuery_FieldName = "distinct top 10 (isnull(rtrim(cnt_firstName),'') +' '+isnull(rtrim(cnt_middleName),'')+' '+isnull(rtrim(cnt_lastName),''))+'['+isnull(rtrim(crg_tcode),'')+']' as Name,cnt_internalId ";
                   strQuery_WhereClause = " cnt_internalId=crg_cntId and (crg_tcode  Like \'%RequestLetter%' or cnt_firstName Like \'%RequestLetter%') and cnt_internalid like 'CL%' and crg_exchange='" + objSeg[0]+"' and cnt_internalId not in (SELECT ChargeGroupMembers_CustomerID FROM TRANS_CHARGEGROUPMEMBERS WHERE CHARGEGROUPMEMBERs_GROUPCODE='"+objChrgCode+"' and CHARGEGROUPMEMBERS_segmentid="+objSeg[1]+")";
                   CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
               }
               else if(ObjType=='NSDLClientsGroupMember')
               {   
                   strQuery_Table = "master_nsdlclients";
                   strQuery_FieldName = "distinct top 10  ltrim(rtrim( NsdlClients_BenFirstHolderName)) + '['+ cast(NsdlClients_BenAccountID as varchar(20))+']',NsdlClients_BenAccountID ";
                   strQuery_WhereClause = " NsdlClients_BenAccountID not in (SELECT DPChargeMembers_BenAccountNumber FROM TRANS_DPChargeMembers WHERE DPChargeMembers_GroupCode='"+objChrgCode+"' and  DPChargeMembers_SegmentID="+objSeg[1]+") and (NsdlClients_BenFirstHolderName Like \'RequestLetter%' or NsdlClients_BenAccountID like \'RequestLetter%')";
             //alert('nsadl-'+strQuery_Table+strQuery_FieldName+strQuery_WhereClause);
                   CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
               }
               else if(ObjType=='CDSLClientsGroupMember')
               {                  
                   strQuery_Table = "Master_CdslClients";
                   strQuery_FieldName = " distinct top 10 ltrim(rtrim(CdslClients_FirstHolderName)) +'['+ right(CdslClients_BOID,8) +']',right(CdslClients_BOID,8) ";
                   strQuery_WhereClause = " right(CdslClients_BOID,8) not in (SELECT DPChargeMembers_BenAccountNumber FROM Trans_DPChargeMembers WHERE DPChargeMembers_GroupCode='"+objChrgCode+"' and  DPChargeMembers_SegmentID="+objSeg[1]+") and (CdslClients_FirstHolderName Like \'RequestLetter%' or right(CdslClients_BOID,8) like \'RequestLetter%')";
             //alert('cdsl-'+strQuery_Table+strQuery_FieldName+strQuery_WhereClause);
                   CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
               } 
               ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery),'Main');               
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
      function CallGrid()
     {
      // editwin.close();
       grid.PerformCallback();
     }
     function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
          height();
    } 
     
     function ValidateMembers()
     {
          var memName=document.getElementById('txtSelectionID_hidden').value;      
          if(memName.length==0)
          {
          alert('Please select members.');
          // return false;
          }
     }
    
            FieldName='btnSave'
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">
                            <asp:Label ID="lblhdr" runat="server" Text=""></asp:Label></span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Add Members
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            Select Members:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSelectionID"
                                                ErrorMessage="Required!."></asp:RequiredFieldValidator>
                                            <asp:HiddenField ID="txtSelectionID_hidden" runat="server" />
                                             <asp:HiddenField ID="hidden_ExchSeg" runat="server" />
                                             <asp:HiddenField ID="hidden_ChrgGrpCode" runat="server" />
                                            <%-- <asp:HiddenField ID="hidden_ChrgGrpType" runat="server" />--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            From Date:
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="cmbFromDate" runat="server" EditFormat="Custom" Width="250px"
                                                UseMaskBehavior="True">
                                                <buttonstyle width="13px">
                                        </buttonstyle>
                                                <dropdownbutton text="">
                                        </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cmbFromDate"
                                                ErrorMessage="Required!."></asp:RequiredFieldValidator>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnSave" runat="server" Text="Add" CssClass="btnUpdate" OnClick="btnSave_Click1" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; vertical-align: top">
                        <table width="100%">
                            <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                                <td>
                                    <span id="spanshow2" style="color: Blue; font-weight: bold"></span>&nbsp;&nbsp;<span
                                        id="spanshow3"></span>
                                </td>
                                <%--<td align="right" style="text-align: left">
                                                        <span id="spanfltr" style="display: none"><a href="#" style="font-weight: bold; color: Blue"
                                                            onclick="javascript:ForFilterOn();">Filter</a></span>
                                                              
                                                            </td>--%>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="ChargeGroupGrid" runat="server" KeyFieldName="ID" AutoGenerateColumns="False"
                            OnRowDeleting="ChargeGroupGrid_RowDeleting" DataSourceID="chargegroupDataSource"
                            Width="100%" ClientInstanceName="grid" OnCustomCallback="ChargeGroupGrid_CustomCallback">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="ID" Caption="ID" VisibleIndex="0" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="GroupType" Caption="Type" VisibleIndex="0"
                                    Width="15%" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Code" FieldName="GroupCode" VisibleIndex="1"
                                    Width="25%" Visible="False">
                                    <EditFormSettings Visible="False" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CustomerName" Caption="Name" VisibleIndex="0"
                                    Width="20%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Code" Caption="Customer Code" VisibleIndex="0"
                                    Width="20%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="FromDate" Caption="From Date" VisibleIndex="1"
                                    Width="10%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="UntilDate" Caption="Until Date" VisibleIndex="2"
                                    Width="10%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="3" Caption="Delete">
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                            </Styles>
                            <Settings ShowGroupPanel="True" ShowStatusBar="Hidden" />
                            <Templates>
                                <TitlePanel>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="right">
                                                <table width="200px">
                                                    <tr>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </TitlePanel>
                                <EditForm>
                                </EditForm>
                            </Templates>
                            <SettingsText PopupEditFormCaption="Add/ Modify Employee" GroupPanel="Brokerage Schemes" />
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                                PageSize="20">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="chargegroupDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                DeleteCommand="delete from table1 ">
                <DeleteParameters>
                    <asp:Parameter Name="ChargeGroup_ID" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hdType" runat="server" />
        </div>
    </form>
</body>
</html>
