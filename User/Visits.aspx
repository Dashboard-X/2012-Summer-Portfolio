<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Visits.aspx.cs" Inherits="Assignment2.User.Visits" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadHolder" runat="server">
    <script type="text/javascript">
        $(function () {
            var activeIndex = parseInt($('#<%=hidAccordionIndex.ClientID %>').val());

            $("#accordion").accordion(
            {
                autoHeight: false,
                event: "mousedown",
                active: activeIndex,
                change: function (event, ui) {
                    var index = $(this).children('h3').index(ui.newHeader);
                    $('#<%=hidAccordionIndex.ClientID %>').val(index);
                }
            });

            $(".picker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
    <!-- http://stackoverflow.com/questions/2148933/keep-the-current-jquery-accordion-pane-open-after-asp-net-postback -->
    <asp:HiddenField ID="hidAccordionIndex" runat="server" Value="0" />
    
    <h1>Patient Visits</h1>
    <div id="accordion">
    <h3><a href="#pnl1">In-Patients</a></h3>
    <div>
   <asp:ListView ID="InPatientsView" runat="server" DataSourceID="InPatientsDataSource" OnItemDataBound="InPatientsView_Bound">

        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="PatientNameLabel" runat="server" 
                        Text='<%# Eval("PatientName") %>' />
                </td>
                <td>
                    <asp:Label ID="DoctorNameLabel" runat="server" 
                        Text='<%# Eval("DoctorName") %>' />
                </td>
                <td>
                    <asp:Label ID="DateOfVisitLabel" runat="server" 
                        Text='<%# Eval("DateOfVisit") %>' />
                </td>
                <td>
                    <asp:Label ID="BedNameLabel" runat="server" Text='<%# Eval("BedName") %>' />
                </td>
                <td>
                   <asp:LinkButton ID="DetailsLink" runat="server" Text="Treatment" />
                </td>
                <td>
                    <asp:LoginView ID="LoginView1" runat="server">
                        <RoleGroups>
                            <asp:RoleGroup Roles="admin">
                                <ContentTemplate>
                                    <asp:LinkButton ID="DischargeLink" runat="server" Text="Discharge" />
                                </ContentTemplate>
                            </asp:RoleGroup>
                        </RoleGroups>
                    </asp:LoginView>
                </td>
            </tr>
        </ItemTemplate>

        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server">
                                    Patient</th>
                                <th id="Th2" runat="server">
                                    Doctor</th>
                                <th id="Th3" runat="server">
                                    Admitted</th>
                                <th id="Th4" runat="server">
                                    Bed</th>
                                <th id="Th5" runat="server"></th>
                                <th id="Th6" runat="server"></th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="InPatientsDataSource" runat="server" 
        SelectMethod="getVisits" TypeName="Assignment2.InPatientVisitsDAL"></asp:ObjectDataSource>
    </div>
    <h3><a href="#pnl2">Previous Patients</a></h3>
    <div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Patient Name"></asp:Label>
            <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
        </div>
        <div>
            <table>
            <tr><td>
                <asp:DropDownList runat="server" ID="DropDownFilterCol">
                    <asp:ListItem Value="visit" Text="Visit Date" Selected="True" />
                    <asp:ListItem Value="discharge" Text="Discharge Date" />
                </asp:DropDownList>
            </td></tr>
            <tr><td>From: <asp:TextBox runat="server" ID="PickerFromDate" CssClass="picker" /></td></tr>
            <tr><td>To: <asp:TextBox runat="server" ID="PickerToDate" CssClass="picker" /></td></tr>
            </table>
        </div>
        <asp:Button ID="Submit" runat="server" Text="Narrow Search" />
        <asp:ListView ID="OutPatientsView" runat="server" 
            DataSourceID="OutPatientsDataSource" OnItemDataBound="OutPatientsView_Bound">

            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="PatientNameLabel" runat="server" 
                            Text='<%# Eval("PatientName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DoctorNameLabel" runat="server" 
                            Text='<%# Eval("DoctorName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateOfVisitLabel" runat="server" 
                            Text='<%# Eval("DateOfVisit") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateOfDischargeLabel" runat="server" 
                            Text='<%# Eval("DateOfDischarge") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BedNameLabel" runat="server" Text='<%# Eval("BedName") %>' />
                    </td>
                    <td>
                        <asp:LinkButton ID="DetailsLink" runat="server" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">                                  
                                    <th id="Th1" runat="server">
                                        Patient</th>
                                    <th id="Th2" runat="server">
                                        Doctor</th>
                                    <th runat="server">
                                        Visited</th>
                                    <th runat="server">
                                        Discharged</th>
                                    <th runat="server">
                                        Bed</th>
                                    <th id="Th3" runat="server">
                                        Details</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="OutPatientsDataSource" runat="server"
            SelectMethod="getVisits" TypeName="Assignment2.OutPatientVisitsDAL">
        </asp:ObjectDataSource>
    </div>
    </div>
</asp:Content>
