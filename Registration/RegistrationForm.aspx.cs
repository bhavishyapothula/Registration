using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      
        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void ValidateForm()
        {
            if(String.IsNullOrEmpty(fname.Text))
            {
                lblfn.Text = "Enter first name";
            }
            else
            {
                lblfn.Text = " ";
            }
            if (String.IsNullOrEmpty(lname.Text))
            {
                lblln.Text = "Enter last name";
            }
            else
            {
                lblln.Text = " ";
            }
            if (String.IsNullOrEmpty(email.Text))
            {
                lblmail.Text = "Enter email";
            }
            else
            {
                lblmail.Text = " ";
            }
            if (String.IsNullOrEmpty(phno.Text))
            {  
                lblphno.Text = "Enter phone number";
            }
            else
            {
                lblphno.Text = " ";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ValidateForm();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}