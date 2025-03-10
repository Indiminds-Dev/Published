<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_SpeakWriteLanguage, App_Web_nidspgif" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script language="javascript" type="text/javascript">
    function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Employee_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Employee_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Employee_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Employee_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Employee_Document.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Employee_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Employee_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Employee_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Employee_Employee.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Employee_EmployeeCTC.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
       // document.location.href="Employee_SpeakWriteLanguage.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="Employee_Remarks.aspx"; 
        }
    } 
    function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");       
    }
    function Language(obj)
    {
        if(obj=='speak')
        {
            var str = "frmLanguages.aspx?status=speak&id="+'<%=SpLanguage %>';
            frmOpenNewWindow1(str,400,200)
        }
        else   
        {
            var str = "frmLanguages.aspx?status=write&id="+'<%=WLanguage %>';
            frmOpenNewWindow1(str,400,200)
        }
        
    }
    function FillValues(chk,obj)
        {
           var sel = document.getElementById(obj);
           for (i = 0; i < sel.options.length; i++) 
           {
               sel.options[i] = null;
           }
           var txt
           var addOption;
            var friend_array = chk.split(",");
            for (var loop=0; loop < friend_array.length; loop++)
            {
                txt = friend_array[loop];
                addOption = new Option(txt,txt);
                sel.options[loop] = addOption; 
            }
        }
        function page_load()
        {
            document.getElementById("TdSpk").style.display = 'none';
            document.getElementById("TdWrt").style.display = 'none';
            document.getElementById("TdAll").style.display = 'none';
        }
</script>

    <form id="form2" runat="server">
    <div>
    <table class="ETable">
        <tr>
            <td class="EHEADER" ></td>
            
        </tr>
        <tr>
            <td>
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="10" ClientInstanceName="page" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                
                <TabPages>
                    <dxtc:TabPage Text="General" Name="General"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Text="CorresPondence" Name="CorresPondence"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                        </dxtc:TabPage>
                    <dxtc:TabPage Name="Bank Details" Text="Bank Details">
                        <ContentCollection>
                            <dxw:ContentControl runat="server"> 
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="DP Details" Text="DP Details">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Documents" Text="Documents">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Family Members" Text="Family Members">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Registration" Text="Registration">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Group Member" Text="Group Member">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Employee" Text="Employee">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Employee CTC" Text="Employee CTC">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Employee Language" Text="Employee Language">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Panel ID="PnlSpLAng" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                <table>
                                                    <tr>
                                                        <td style="width: 98px" class="gridcellright" >
                                                            <span style="color: blue">
                                                            Spoken Language : </span>
                                                        </td>
                                                        <td style="width: 554px" class="gridcellleft">
                                                            <asp:Literal ID="LitSpokenLanguage" runat="server"></asp:Literal>
                                                        </td>
                                                        <td id="TdSpk">
                                                            <asp:ListBox ID="ListSpLang" runat="server" CssClass="gridcellleft"></asp:ListBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <input id="BtnAddModify" type="button" value="Add/Modify" class="btnUpdate" onclick="Language('speak')" style="width: 78px; height: 17px"/> 
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="PnlWrLang" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                <table>
                                                    <tr>
                                                        <td style="width: 98px" class="gridcellright" >
                                                            <span style="color: blue">
                                                            Written Language : </span>
                                                        </td>
                                                        <td style="width: 564px" class="gridcellleft">
                                                            <asp:Literal ID="LitWrittenLanguage" runat="server"></asp:Literal>
                                                        </td>
                                                        <td id="TdWrt">
                                                            <asp:ListBox ID="ListWrtLang" runat="server" CssClass="gridcellleft"></asp:ListBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input id="BtnWrAddModify" type="button" value="Add/Modify" class="btnUpdate" onclick="Language('write')" style="width: 78px; height: 17px"/> 
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="TdAll">
                                            <asp:Button ID="BtnSaveAllLang" runat="server" Text="Save Language's" OnClick="BtnSaveAllLang_Click" CssClass="btnUpdate" Height="22px" Width="113px" />
                                            <asp:HiddenField ID="txtSpeakLanguage" runat="server" />
                                            <asp:HiddenField ID="txtWriteLanguage" runat="server" />
                                        </td>
                                    </tr>
                                </table>   
                                <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                            
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Remarks" Text="Remarks">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    </TabPages>
                    <ClientSideEvents  ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            var Tab6 = page.GetTab(6);
	                                            var Tab7 = page.GetTab(7);
	                                            var Tab8 = page.GetTab(8);
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            else if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                            else if(activeTab == Tab3)
	                                            {
	                                                disp_prompt('tab3');
	                                            }
	                                            else if(activeTab == Tab4)
	                                            {
	                                                disp_prompt('tab4');
	                                            }
	                                            else if(activeTab == Tab5)
	                                            {
	                                                disp_prompt('tab5');
	                                            }
	                                            else if(activeTab == Tab6)
	                                            {
	                                                disp_prompt('tab6');
	                                            }
	                                            else if(activeTab == Tab7)
	                                            {
	                                                disp_prompt('tab7');
	                                            }
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
	                                            }
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                            else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            }
	                                            }">
                    </ClientSideEvents>
                    <ContentStyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </ContentStyle>
                    <LoadingPanelStyle ImageSpacing="6px">
                    </LoadingPanelStyle>
                    <TabStyle Font-Size="10px">
                    </TabStyle>
                </dxtc:ASPxPageControl>
                </td>
                <td>
                      
                </td>
                <td>
                    <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
            </tr>
        </table>
        
    </div>
   
       
    </form>
</body>
</html>
