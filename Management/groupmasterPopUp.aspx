<%@ page language="C#" autoeventwireup="true" inherits="management_groupmasterPopUp, App_Web_sjbhlkdr" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>Add Member</title>
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
	     function showOptions(objID,objType,objEvent)
         {         
           var a=document.getElementById("txtID").value;
           var b=document.getElementById("MType").value;          
           var c=document.getElementById("ddlText").value;
           var d=document.getElementById("ddlValue").value;
           var obj4=a+'~'+ b +'~'+ c +'~'+ d;
           if(c !='' && d !='')
           {
                if(objType=='NSDLClientsGroupMember')
                {   
                   strQuery_Table = " Master_NsdlClients";/*Session["usersegid"]='IN304004'//////select gpm_Type,gpm_code from tbl_master_groupMaster where gpm_id="+a+*/
                   strQuery_FieldName = " distinct Top 10 (LTRIM(rtrim(NsdlClients_BenFirstHolderName))+' ['+cast(ltrim(rtrim(NsdlClients_BenAccountID)) as varchar(10))+']') as Name,(NsdlClients_DPID+cast(NsdlClients_BenAccountID as varchar(10))) as ID ";
                   strQuery_WhereClause = " NsdlClients_DPID='"+'<%=Session["usersegid"] %>'+"' and NsdlClients_DPID+cast(NsdlClients_BenAccountID as varchar(10)) not in (Select grp_contactId from tbl_master_groupMaster,tbl_trans_group Where gpm_code=(select gpm_code from tbl_master_groupMaster where gpm_id="+a+") and gpm_Type=(select gpm_Type from tbl_master_groupMaster where gpm_id="+a+") and grp_groupMaster=gpm_id and Left(grp_contactId,2)='IN') and (NsdlClients_BenFirstHolderName like \'RequestLetter%' Or NsdlClients_BenAccountID  like \'RequestLetter%')";
                   strQuery_OrderBy=" Name"; 
                   strQuery_GroupBy="";
                   CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_GroupBy+"$"+strQuery_OrderBy);
                   ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery),'Main');
                }
                else if(objType=='CDSLClientsGroupMember')
                {                  
                   strQuery_Table = " Master_CdslClients";
                   strQuery_FieldName = " distinct Top 10 (LTRIM(rtrim(CdslClients_FirstHolderName))+' '+LTRIM(rtrim(CdslClients_FirstHolderMiddleName))+' '+LTRIM(rtrim(CdslClients_FirstHolderLastName))+' ['+cast(ltrim(rtrim(right(CdslClients_BOID,8))) as varchar(10))+']') as Name,cast(RIGHT(CdslClients_BOID,8) as varchar(10)) as ID ";
                   strQuery_WhereClause = " CdslClients_DPID='"+'<%=Session["usersegid"] %>'+"' and CdslClients_BOID  not in (Select grp_contactId from tbl_master_groupMaster,tbl_trans_group Where gpm_code=(select gpm_code from tbl_master_groupMaster where gpm_id="+a+") and gpm_Type=(select gpm_Type from tbl_master_groupMaster where gpm_id="+a+") and grp_groupMaster=gpm_id and Left(grp_contactId,2)='12') and (CdslClients_FirstHolderName like \'RequestLetter%' Or right(CdslClients_BOID,8)  like \'RequestLetter%')";
                   strQuery_OrderBy=" Name";
                   strQuery_GroupBy="";
                   CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_GroupBy+"$"+strQuery_OrderBy);
                   ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery),'Main');
                } 
                else
                {                      
                     ajax_showOptions(objID,objType,objEvent,obj4);
                }     
           }
           else
           {
                alert('Please Select Contact Type...!!')
           }
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
    function CallGrid() {
     
      // editwin.close();
       grid.PerformCallback();
     }
         FieldName='BtnSave';
     function GridName_EndCallBack()
     {
        document.getElementById('<%=txtContact.ClientID%>').focus();
        document.getElementById('<%=txtContact.ClientID%>').select();
     } 
     function Page_Load()
     {
        document.getElementById('<%=txtContact.ClientID%>').focus();
        document.getElementById('<%=txtContact.ClientID%>').select();
     }     
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <strong>Add Member</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Group Name</strong> :<asp:Literal ID="litGpName" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <%--  <asp:Panel ID="Panel1" runat="server" Width="99%" Visible="False">--%>
                                <table width="100%">
                                    <tr>
                                        <td style="text-align: left; width: 127px;">
                                            <asp:Label ID="Label1" runat="server" Text="Choose By" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:DropDownList ID="DDLAddData" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLAddData_SelectedIndexChanged"
                                                Width="230px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Select Contact:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtContact" runat="server" Width="200px"></asp:TextBox>
                                            <asp:HiddenField ID="txtContact_hidden" runat="server" />
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="BtnSave_Click" />
                                            <asp:Button ID="BtnCancel" runat="server" CssClass="btnUpdate" Text="Cancel" OnClick="BtnCancel_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: left" visible="false">
                                            <asp:HiddenField ID="txtID" runat="server" />
                                            <asp:HiddenField ID="MType" runat="server" />
                                            <asp:HiddenField ID="ddlValue" runat="server" />
                                            <asp:HiddenField ID="ddlText" runat="server" />
                                            <%-- <asp:ListBox ID="LLbAddData" runat="server" Width="100%" Height="266px" SelectionMode="Multiple" Visible="false"></asp:ListBox>--%>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--     </asp:Panel>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%-- <asp:Panel ID="GridPanel" runat="server" Visible="false" Width="99%">--%>
                        <dxwgv:ASPxGridView ID="GridName" runat="server" KeyFieldName="grp_id" AutoGenerateColumns="False"
                            DataSourceID="SelectName" ClientInstanceName="grid" Width="100%" OnCustomCallback="GridName_CustomCallback"
                            OnRowDeleting="GridName_RowDeleting">
                            <ClientSideEvents EndCallback="function(s, e) {GridName_EndCallBack();}" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="0" Width="80%">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Id" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <%--<dxwgv:GridViewCommandColumn VisibleIndex="1">
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                </dxwgv:GridViewCommandColumn>--%>
                                <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <HeaderTemplate>
                                        <span style="color: #000099; text-align: center;">Delete</span>
                                    </HeaderTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <SettingsText ConfirmDelete="Are You Sure To Delete This Record ???" />
                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        </dxwgv:ASPxGridView>
                        <%--  <asp:Button ID="AddMember" runat="server" Text="Add Member" OnClick="AddMember_Click" />--%>
                        <%-- </asp:Panel> --%>
                    </td>
                </tr>
            </table>
            <%-- DeleteCommand="Delete from tbl_trans_group where grp_id=@grp_id">
                <DeleteParameters>
                    <asp:Parameter Name="grp_id" Type="decimal" />
                </DeleteParameters>
            --%>
            <asp:SqlDataSource ID="SelectName" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="RId" QueryStringField="id" Type="decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
