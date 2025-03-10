<%@ page language="C#" autoeventwireup="true" inherits="management_dpacc, App_Web_snhbal_j" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <!--External Styles-->
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />
     <!-- Ajax List Requierd-->
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <!--Other Script-->
    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
       FieldName='Button1';
       function SignOff()
        {
            window.parent.SignOff();
        }
       function Validate()
       {
    
       var str1=document.getElementById("txtid").value;
       var str2=document.getElementById("txtaccid").value;
         //alert(str2);
          if (str1=="")
           {
           alert("DP ID is required.");
           //str1.focus();
           //str1.select();
           return false;                      
           } 
            if (str2=="")
           {
           alert("Account ID is required.");
           return false;           
           } 
       }
       function keyVal(obj)
        { 
            var Arr=obj.split("~");
            var WhichCall=Arr[Arr.length-1];
            if(WhichCall=="COMPANYDP")
            {
                var DPID=Arr[1];
                SetValue("txtID",DPID);
            }
            else
                SetValue("txtID","");
        }
        function Validation()
        {
            var TextToCompare="No Record Found";
            SetValue("hdn_IsValidate","F");
            if(Control_Empty("txtName","Please Select DPName!!!"))
                if(Control_CompareText("txtName",TextToCompare,"Please Select Dp Name Properly!!!"))
                    if(Control_Empty("txtAccID","Please Select Account ID!!!"))
                        SetValue("hdn_IsValidate","T");
        }
    </script>
    
    
   
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            &nbsp;</div>
            <%-- <asp:SqlDataSource ID="AccessDataSourcegroup" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
    
        SelectCommand="SELECT ChargeGroup_Name,ChargeGroup_Code FROM [Master_ChargeGroup] where ChargeGroup_Type=3"></asp:SqlDataSource> --%>
                                    
                                    <table style="width: 850px; z-index: 101;border:solid 1px white;" border="1">
                                        <tr>
                                            <td class="Header" colspan="4">
                                               Special Dp Accounts
                                            </td>
                                        </tr>
                                    
                                    <tr>
                                       <td class="gridcellleft" colspan="1"  style="text-align:left; vertical-align: top; width: 116px; height: 23px; background-color: #b7ceec;">
                                           Account Setting Of</td>
                                       <td class="gridcellleft"   colspan="3"><asp:Label ID="lbl52" runat="server" Width="300px" ForeColor="Brown"  Font-Size="Small" ></asp:Label></td>
                                    </tr>
                                    
                                    <tr>
                                    
                                      <td class="gridcellleft" style="vertical-align: top; width: 116px; height: 23px; background-color: #b7ceec; text-align: left">
                                          Applicable Group</td>
                                      
                                      <td class="gridcellleft" style="width: 301px">  <dxe:ASPxComboBox runat="server" width="220px" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String"   ID="ddlcmpgroup" >
                                          <%--<Items>
                                          DataSourceID="AccessDataSourcegroup" TextField="ChargeGroup_Name" ValueField="ChargeGroup_Code"
                                                  <dxe:ListEditItem Text="All" Value="0">
                                                  </dxe:ListEditItem>
                                                  </Items>--%>
                                        </dxe:ASPxComboBox></td>
                                      
                                      
                                       <td class="gridcellleft" style="vertical-align: top; width: 198px; height: 23px; background-color: #b7ceec; text-align: left">
                                           CMBPID</td>
                                          <td class="gridcellleft">
                                          <asp:TextBox runat="server"  ID="txtcmbpid" width="208px" maxlength="8"></asp:TextBox></td>
                                                 
                                    
                                    </tr>
                                       <tr>
                                            
                                             <td class="gridcellleft" style="vertical-align: top; width: 116px; height: 23px; background-color: #b7ceec; text-align: left">
                                                 DP Name</td>
                                            <td class="gridcellleft" style="width: 301px"><asp:TextBox ID="txtname" runat="server" width="250px"></asp:TextBox></td>
                                            
                                            <td class="gridcellleft" style="vertical-align: top; width: 198px; height: 23px; background-color: #b7ceec; text-align: left">
                                                DPID</td>
                                            <td class="gridcellleft"><asp:TextBox  ID="txtid" runat="server"  width="208px" maxlength="8" Enabled="False"></asp:TextBox></td>
                                                 
                                       
                                       </tr>
                                       
                                       <tr>
                                         
                                            <td class="gridcellleft" style="vertical-align: top; width: 116px; height: 23px; background-color: #b7ceec; text-align: left">
                                                Account Name</td>
                                            <td class="gridcellleft" style="width: 301px"><asp:TextBox runat="server"  ID="txtaccname" width="250px"></asp:TextBox ></td>
                                         
                                          <td class="gridcellleft" style="vertical-align: top; width: 198px; height: 23px; background-color: #b7ceec; text-align: left">
                                              Account ID</td>
                                            <td class="gridcellleft"><asp:TextBox  ID="txtaccid" runat="server"  width="208px" maxlength="8"></asp:TextBox></td>
                                                                      
                                       </tr>
                                       
                                       <tr>
                                       
                                            <td class="gridcellleft" style="vertical-align: top; width: 116px; height: 23px; background-color: #b7ceec; text-align: left">
                                                TM Code</td>
                                            <td class="gridcellleft" style="width: 301px"><asp:TextBox runat="server"  ID="txttmcode" width="250px" maxlength="8"></asp:TextBox ></td>
                                         
                                         <td class="gridcellleft" style="vertical-align: top; width: 198px; height: 23px; background-color: #b7ceec; text-align: left">
                                             CM Code</td>
                                            <td class="gridcellleft"><asp:TextBox runat="server"  ID="txtcmcode" width="208px" maxlength="8"></asp:TextBox ></td>
                                                                    
                                       </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 116px">
                                            </td>
                                            <td class="gridcellleft" style="width: 301px">
                                                     </td>
                                            <td class="gridcellleft" style="width: 198px">
                                                     <asp:Button  ID="Button1" runat="server" Text="Save" OnClientClick="return Validation();"  
                                                     OnClick="Button1_Click" CssClass="btnUpdate" Width="126px" >
                                                      </asp:Button></td>
                                            <td class="gridcellleft">
                                            </td>
                                        </tr>
                                        <asp:HiddenField ID="hdn_IsValidate" runat="server" />
                                    
                                    
                                    </table>
    </form>
</body>
</html>
