<?php 
require_once 'myfunc.php';
if (isset($_REQUEST['b_view'])){
    $sql = 'SELECT * FROM view_var2';
    $query = mysqli_query($con, $sql);
}
if (isset($_REQUEST['b_func'])){ 
    $sql = "SELECT function_var2() AS 'count'";
    $res = $mysqli->query($sql)->fetch_object()->count;
}
if (isset($_REQUEST['b_proc']) || isset($_REQUEST['b_teacher_course'])){ 
    $sql = "CALL procedure_var2(:name, :course)";
    $res = $connect -> prepare($sql);
    if (isset($_REQUEST['b_teacher_course'])){
        if (isset($_REQUEST['teacher']) && isset($_REQUEST['course'])){
            $proc_teacher = $_REQUEST['teacher'];
            $proc_course = $_REQUEST['course'];
            $res->execute([':name'=>$proc_teacher, ':course' => $proc_course]);
        }
    }
} 
?>


