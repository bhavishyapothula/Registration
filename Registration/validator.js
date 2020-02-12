function Validate() {
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var phno = document.getElementById("phno").value;
    if (fname == "" || lname==""||phno== "") {
        alert("Enter all fields");
        return false;
    }
    return true;
}
