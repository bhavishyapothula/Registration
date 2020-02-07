<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Registration.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Text box for firstname,Last name,email,phone number-->
            First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="fname" runat="server"></asp:TextBox>
            <br />
            Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="lname" runat="server"></asp:TextBox>
            <br />
            Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            Phone Number
            <asp:TextBox ID="phno" runat="server"></asp:TextBox>
            <br />
            <br />
             <!-- Cascading dropdown for country,state,City-->
            <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [tblCountry]"></asp:SqlDataSource>
            Country:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="CountryList" runat="server" DataSourceID="SqlDataSourceCountry" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryID" >
                <asp:ListItem Value="0">--Select Country--</asp:ListItem>
            </asp:DropDownList>
        </div>
        <p>
            State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="StateList" runat="server" DataSourceID="SqlDataSource1State" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="StateName" DataValueField="StateId">
                <asp:ListItem Value="0">--Select State--</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1State" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [StateId], [StateName] FROM [tblState] WHERE ([FK_CountryId] = @FK_CountryId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CountryList" Name="FK_CountryId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="CityList" runat="server" DataSourceID="CityDataSource" AutoPostBack="true" DataTextField="CityName" DataValueField="CityId" AppendDataBoundItems="true" >
            <asp:ListItem Value="0">--Select City--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="CityDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [CityId], [CityName] FROM [tblCity] WHERE ([FK_StateId] = @FK_StateId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="StateList" Name="FK_StateId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
         <!-- Radio button for gender-->
        Gender :<asp:RadioButton ID="RadioButton1" runat="server" Text="Male" GroupName="Gender"/>
&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" Text="Female" GroupName="Gender"/>
        <br />
        <br />
         <!-- Check box for stream-->
        Stream :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="Java" runat="server"  Text="Java"  />
        <p style="margin-left: 120px">
            <asp:CheckBox ID="doetnet" runat="server"  Text=".Net" />
        </p>
        <p style="margin-left: 120px">
            <asp:CheckBox ID="dep" runat="server"  Text="DEP" />
        </p>
        <p style="margin-left: 120px">
            <asp:CheckBox ID="sdet" runat="server" Text="SDET"  />
        </p>
         <!-- Calendar for date of birth-->
        Date of Birth:<div style="margin-left: 160px">
            <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
        </div>
        <p style="margin-left: 240px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-bottom: 0px; height: 26px;" Text="submit" />
        </p>
    </form>
</body>
</html>
