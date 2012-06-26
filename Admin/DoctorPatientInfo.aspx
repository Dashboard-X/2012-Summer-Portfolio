<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true"
    CodeBehind="DoctorPatientInfo.aspx.cs" Inherits="Assignment2.Admin.DoctorPatientInfo" %>

<asp:Content ID="Scripts" ContentPlaceHolderID="HeadHolder" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#tabs").tabs();
        });
    </script>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>
        Doctor Patient Info</h1>
    <asp:ObjectDataSource ID="DoctorsDataSource" runat="server" SelectMethod="getDoctors"
        TypeName="Assignment2.DoctorsDAL"></asp:ObjectDataSource>
    <asp:DropDownList ID="DrpDoctorSelect" runat="server" DataSourceID="DoctorsDataSource"
        DataTextField="Name" DataValueField="Id" AutoPostBack="true" 
        onselectedindexchanged="DrpDoctorSelect_SelectedIndexChanged" OnDataBound="DrpDoctorSelect_SelectedIndexChanged">
    </asp:DropDownList>
    <div id="tabs">
        <ul>
            <li><a href="#treatments-tab">Treatments</a></li>
            <li><a href="#patients-tab">Assign a Patient</a></li>
        </ul>
        <div id="treatments-tab">
            <h2>
                Ongoing</h2>
            <asp:ListView ID="InPatientsView" runat="server" DataSourceID="InPatientsDataSource"
                OnItemDataBound="InPatientsView_Bound">
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>
                                No data was returned.
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="PatientNameLabel" runat="server" Text='<%# Eval("PatientName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DateOfVisitLabel" runat="server" Text='<%# Eval("DateOfVisit") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedNameLabel" runat="server" Text='<%# Eval("BedName") %>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="DetailsLink" runat="server" Text="Treatment" />
                        </td>
                        <td>
                            <asp:LinkButton ID="DischargeLink" runat="server" Text="Discharge" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="Tr2" runat="server" style="">
                                        <th id="Th1" runat="server">
                                            Patient
                                        </th>
                                        <th id="Th3" runat="server">
                                            Admitted
                                        </th>
                                        <th id="Th4" runat="server">
                                            Bed
                                        </th>
                                        <th id="Th5" runat="server">
                                        </th>
                                        <th id="Th6" runat="server">
                                        </th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="InPatientsDataSource" runat="server" SelectMethod="getVisits"
                TypeName="Assignment2.DoctorInPatientsDAL">
                <SelectParameters>
                    <asp:ControlParameter Name="DoctorID" ControlID="DrpDoctorSelect" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <h2>
                Previous</h2>
            <asp:ListView ID="OutPatientsView" runat="server" DataSourceID="OutPatientsDataSource"
                OnItemDataBound="OutPatientsView_Bound">
                <EmptyDataTemplate>
                    <table id="Table3" runat="server" style="">
                        <tr>
                            <td>
                                No data was returned.
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="PatientNameLabel" runat="server" Text='<%# Eval("PatientName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DateOfVisitLabel" runat="server" Text='<%# Eval("DateOfVisit") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DateOfDischargeLabel" runat="server" Text='<%# Eval("DateOfDischarge") %>' />
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
                    <table id="Table4" runat="server">
                        <tr id="Tr4" runat="server">
                            <td id="Td3" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="Tr5" runat="server" style="">
                                        <th id="Th1" runat="server">
                                            Patient
                                        </th>
                                        <th id="Th7" runat="server">
                                            Visited
                                        </th>
                                        <th id="Th8" runat="server">
                                            Discharged
                                        </th>
                                        <th id="Th9" runat="server">
                                            Bed
                                        </th>
                                        <th id="Th3" runat="server">
                                            Details
                                        </th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr6" runat="server">
                            <td id="Td4" runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="OutPatientsDataSource" runat="server" SelectMethod="getVisits"
                TypeName="Assignment2.DoctorOutPatientsDAL">
                <SelectParameters>
                    <asp:ControlParameter Name="DoctorID" ControlID="DrpDoctorSelect" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div id="patients-tab">
            <asp:ScriptManager runat="server" />
            <asp:UpdatePanel runat="server">
            <ContentTemplate>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Search for Patient Name"></asp:Label>
                <asp:TextBox ID="TxtSearchName" runat="server"></asp:TextBox>
                <asp:Button ID="BtnSearchName" runat="server" Text="Search" OnClick="BtnSearchName_Click" />
            </p>
            <asp:GridView ID="GridPatients" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                AllowSorting="False" DataSourceID="PatientsDataSource"  DataKeyNames="Id">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" ReadOnly="True"
                        SortExpression="DateOfBirth" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" ReadOnly="True" SortExpression="Phone" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="PatientsDataSource" runat="server" SelectMethod="getPatients"
                TypeName="Assignment2.User.PatientsDAL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TxtSearchName" Name="name" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            </ContentTemplate>
            </asp:UpdatePanel>

            <asp:Button ID="BtnOutPatient" runat="server" Text="Register As Out-Patient" 
                onclick="BtnOutPatient_Click" />
            <asp:Button ID="BtnInPatient" runat="server" Text="Register As In-Patient" 
                onclick="BtnInPatient_Click" />
        </div>
    </div>
</asp:Content>
