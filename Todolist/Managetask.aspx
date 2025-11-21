<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="Managetask.aspx.cs"
    Inherits="Todolist.Managetask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Overall background */
        body {
            background: linear-gradient(135deg, #e5f3fa, #f7f9fc);
        }

        /* Main card */
        .task-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 32px 32px 36px;
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 14px 40px rgba(15, 23, 42, 0.12);
            font-family: 'Baloo 2', sans-serif;
            border: 1px solid #e4e7ec;
        }

        .task-container h2 {
            font-size: 32px;
            color: #0b658c;
            text-align: center;
            margin-bottom: 6px;
            letter-spacing: 0.5px;
        }

        .task-subtitle {
            text-align: center;
            margin-bottom: 26px;
            color: #6b7280;
            font-size: 14px;
        }

        /* Form section */
        .form-row {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 16px;
        }

        .form-row label {
            font-size: 16px;
            color: #0b658c;
            min-width: 110px;
            white-space: nowrap;
        }

        .input-text {
            flex: 1;
            width: 100%;
            padding: 10px 14px;
            font-size: 14px;
            border: 1.8px solid #d0d5dd;
            border-radius: 12px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
            background-color: #f9fafb;
        }

        .input-text:focus {
            border-color: #0b658c;
            outline: none;
            box-shadow: 0 0 0 3px rgba(11, 101, 140, 0.18);
            background-color: #ffffff;
        }

        .textarea {
            min-height: 80px;
            resize: vertical;
        }

        .dropdown {
            flex: 1;
            padding: 10px 14px;
            font-size: 14px;
            border: 1.8px solid #d0d5dd;
            border-radius: 12px;
            background-color: #f9fafb;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
        }

        .dropdown:focus {
            border-color: #0b658c;
            outline: none;
            box-shadow: 0 0 0 3px rgba(11, 101, 140, 0.18);
            background-color: #ffffff;
        }

        /* Primary button */
        .btn-add {
            width: 100%;
            padding: 12px;
            background: linear-gradient(90deg, #0b658c, #1293b8);
            color: white;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 999px;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-top: 8px;
            margin-bottom: 6px;
            transition: transform 0.12s ease, box-shadow 0.15s ease, opacity 0.15s ease;
        }

        .btn-add:hover {
            transform: translateY(-1px);
            box-shadow: 0 10px 20px rgba(11, 101, 140, 0.35);
            opacity: 0.97;
        }

        .btn-add:active {
            transform: translateY(0);
            box-shadow: none;
        }

        /* Filter buttons */
        .filter-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 18px 0 8px;
            flex-wrap: wrap;
        }

        .btn-filter {
            padding: 7px 16px;
            border-radius: 999px;
            border: none;
            cursor: pointer;
            font-size: 13px;
            font-family: 'Baloo 2', sans-serif;
            background-color: #e5f3fa;
            color: #0b658c;
            transition: background-color 0.15s ease, transform 0.1s ease, box-shadow 0.1s ease, opacity 0.15s ease;
        }

        .btn-filter:hover {
            background-color: #d4ebf7;
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(11, 101, 140, 0.25);
        }

        .btn-filter-active {
            background-color: #0b658c;
            color: #ffffff;
        }

        /* Grid section */
        .gridview-container {
            margin-top: 22px;
        }

        .task-list-heading {
            font-size: 18px;
            color: #0b658c;
            margin-bottom: 6px;
            font-weight: 600;
        }

        .gridview-container .gridview {
            width: 100%;
            border-collapse: collapse;
            border-radius: 16px;
            overflow: hidden;
            background-color: #ffffff;
            table-layout: fixed;
        }

        .gridview-container .gridview th,
        .gridview-container .gridview td {
            padding: 9px 10px;
            border: 1px solid #e4e7ec;
            font-size: 13px;
        }

        .gridview-container .gridview th {
            background: linear-gradient(90deg, #0b658c, #1293b8);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            text-align: center;
        }

        .gridview-container .gridview td {
            background-color: #ffffff;
            vertical-align: middle;
            word-wrap: break-word;
            overflow-wrap: break-word;
        }

        .gridview-container .gridview tr:nth-child(even) td {
            background-color: #f9fafb;
        }

        .gridview-container .gridview tr:hover td {
            background-color: #eef3fb;
        }

        /* Buttons inside grid */
        .btn-grid {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 999px;
            font-size: 11px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-family: 'Baloo 2', sans-serif;
            margin: 2px 3px;
            white-space: nowrap;
        }

        .btn-edit {
            background-color: #0b658c;
            color: #ffffff;
        }

        .btn-delete {
            background-color: #e11d48;
            color: #ffffff;
        }

        .btn-save {
            background-color: #16a34a;
            color: #ffffff;
        }

        .btn-cancel {
            background-color: #6b7280;
            color: #ffffff;
        }

        .btn-grid:hover {
            opacity: 0.9;
        }

        /* Messages */
        .message {
            margin-top: 12px;
            text-align: center;
            font-size: 14px;
            color: #475467;
        }

        /* Priority badges */
        .priority-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 999px;
            font-size: 11px;
            font-weight: 600;
            min-width: 68px;
            text-align: center;
        }

        .priority-high {
            background-color: #fee2e2;
            color: #b91c1c;
        }

        .priority-medium {
            background-color: #fef3c7;
            color: #92400e;
        }

        .priority-low {
            background-color: #dcfce7;
            color: #166534;
        }

        /* Small screens */
        @media (max-width: 768px) {
            .task-container {
                margin: 20px 10px;
                padding: 20px 18px 24px;
            }

            .form-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .form-row label {
                min-width: auto;
            }

            .btn-add {
                font-size: 15px;
            }

            .gridview-container .gridview th,
            .gridview-container .gridview td {
                font-size: 12px;
                padding: 7px 6px;
            }
        }
    </style>

    <div class="task-container">
        <h2>Manage Tasks</h2>
        <div class="task-subtitle">
            Add, update, and track your daily tasks in one place.
        </div>

        <!-- Title -->
        <div class="form-row">
            <label for="txtTitle">Title:</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="input-text" />
        </div>

        <!-- Description -->
        <div class="form-row">
            <label for="txtDescription">Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="input-text textarea" />
        </div>

        <!-- Priority -->
        <div class="form-row">
            <label for="ddlPriority">Priority:</label>
            <asp:DropDownList ID="ddlPriority" runat="server" CssClass="dropdown">
                <asp:ListItem Text="High" Value="High"></asp:ListItem>
                <asp:ListItem Text="Medium" Value="Medium" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Add button -->
        <asp:Button ID="btnAdd" runat="server" Text="Add Task"
            OnClick="btnAdd_Click" CssClass="btn-add" />

        <!-- Filter buttons -->
        <div class="filter-buttons">
            <asp:Button ID="btnShowAll" runat="server" Text="📋 Show All"
                CssClass="btn-filter" OnClick="btnShowAll_Click" />
            <asp:Button ID="btnShowCompleted" runat="server" Text="✔ Show Completed"
                CssClass="btn-filter" OnClick="btnShowCompleted_Click" />
            <asp:Button ID="btnShowPending" runat="server" Text="⏳ Show Pending"
                CssClass="btn-filter" OnClick="btnShowPending_Click" />
        </div>

        <div class="gridview-container">
            <div class="task-list-heading">Your Task List</div>

            <!-- Total count label -->
            <asp:Label ID="lblTaskCount" runat="server" CssClass="message" />

            <asp:GridView ID="gvTasks" runat="server" CssClass="gridview"
                AutoGenerateColumns="False"
                DataKeyNames="TaskID"
                OnRowEditing="gvTasks_RowEditing"
                OnRowUpdating="gvTasks_RowUpdating"
                OnRowCancelingEdit="gvTasks_RowCancelingEdit"
                OnRowDeleting="gvTasks_RowDeleting"
                OnRowDataBound="gvTasks_RowDataBound">

                <Columns>
                    
                    <asp:TemplateField HeaderText="Sr No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                   
                    <asp:BoundField DataField="TaskID" HeaderText="Task ID" ReadOnly="True" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Title" HeaderText="Title">
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Description" HeaderText="Description">
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Priority">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblPriority" runat="server"
                                Text='<%# Eval("Priority") %>'
                                CssClass="priority-badge" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlPriorityEdit" runat="server">
                                <asp:ListItem Text="High" Value="High"></asp:ListItem>
                                <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                                <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="CreatedDate" HeaderText="Created On"
                        DataFormatString="{0:yyyy-MM-dd}">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Completed">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkComplete" runat="server"
                                Checked='<%# Convert.ToBoolean(Eval("IsCompleted")) %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkComplete" runat="server"
                                Checked='<%# Convert.ToBoolean(Eval("IsCompleted")) %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server"
                                CommandName="Edit" Text="Edit"
                                CssClass="btn-grid btn-edit" />
                            <asp:LinkButton ID="lnkDelete" runat="server"
                                CommandName="Delete" Text="Delete"
                                CssClass="btn-grid btn-delete"
                                OnClientClick="return confirm('Are you sure you want to delete this task?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkUpdate" runat="server"
                                CommandName="Update" Text="Save"
                                CssClass="btn-grid btn-save" />
                            <asp:LinkButton ID="lnkCancel" runat="server"
                                CommandName="Cancel" Text="Cancel"
                                CssClass="btn-grid btn-cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="message" ForeColor="Green" />
    </div>

</asp:Content>
