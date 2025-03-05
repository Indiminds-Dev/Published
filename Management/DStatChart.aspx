<%@ page language="C#" autoeventwireup="true" inherits="management_DStatChart, App_Web_lgnajdkn" %>

<%@ Register Assembly="DevExpress.XtraCharts.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v9.1.Web, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <table >
            <tr>
                <td>
                    <dxchartsui:WebChartControl ID="chrtDalyStat" Height="275px" Width="500px" runat="server"
                        DiagramTypeName="XYDiagram" ClientInstanceName="chart">
                        <SeriesSerializable>
                            <cc1:Series LabelTypeName="PointSeriesLabel" Name="Closing Rates" PointOptionsTypeName="PointOptions"
                                SeriesViewTypeName="LineSeriesView">
                                <view hiddenserializablestring="to be serialized">
                                <LineStyle DashStyle="Dot"></LineStyle>

                                <LineMarkerOptions Visible="False"></LineMarkerOptions>
                                </view>
                                <label hiddenserializablestring="to be serialized" linevisible="False" overlappingoptionstypename="PointOverlappingOptions">
                                    <border visible="False"></border>
                                    <fillstyle fillmode="Empty"></fillstyle>
                                </label>
                                <pointoptions hiddenserializablestring="to be serialized"></pointoptions>
                                <legendpointoptions hiddenserializablestring="to be serialized"></legendpointoptions>
                            </cc1:Series>
                        </SeriesSerializable>
                        <FillStyle FillOptionsTypeName="SolidFillOptions">
                            <Options HiddenSerializableString="to be serialized" />
                        </FillStyle>
                        <BorderOptions Visible="False" />
                        <SeriesTemplate LabelTypeName="SideBySideBarSeriesLabel" PointOptionsTypeName="PointOptions"
                            SeriesViewTypeName="SideBySideBarSeriesView">
                            <View HiddenSerializableString="to be serialized">
                            </View>
                            <Label HiddenSerializableString="to be serialized" LineVisible="True" OverlappingOptionsTypeName="OverlappingOptions">
                                <FillStyle FillOptionsTypeName="SolidFillOptions">
                                    <Options HiddenSerializableString="to be serialized" />
                                </FillStyle>
                            </Label>
                            <PointOptions HiddenSerializableString="to be serialized">
                            </PointOptions>
                            <LegendPointOptions HiddenSerializableString="to be serialized">
                            </LegendPointOptions>
                        </SeriesTemplate>
                      
                    </dxchartsui:WebChartControl>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
