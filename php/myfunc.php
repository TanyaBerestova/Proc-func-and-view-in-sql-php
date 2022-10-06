<?php
function combo($name, $mysqli, $table, $arg, $disabled = false){ 
    if ($name == 'teacher'){
        $arr = get_teacher($name, $mysqli, $table, $arg);
        $a = "onchange='func(this.value)'";
    } else if ($name == 'course'){
        $arr = get_course($name, $mysqli, $table, $arg);
        $a = '';
    }
    $str = "<select id=$name name=$name $a".($disabled ? "disabled" : "").">".
             "<option disabled selected>Выберите...</option>";
    foreach($arr as $key=>$value){
        $str .= "<option value='".$key."'";
        if (isset($_REQUEST[$name]))
            if ($key == $_REQUEST[$name] ) $str .= 'selected';
        $str .= ">".$value."</option>";
    }
    $str .= "</select>";
        echo $str;
}
function get_teacher($name, $mysqli, $table, $arg){
    $id = $name.'_id';
    $sql = "SELECT $arg AS '$name', $id AS 'id' FROM $table ";
    $query = $mysqli->query($sql);
    while($r = $query ->fetch_object()){
        $arr_teacher[$r->id] = $r->$name;
    }
    return $arr_teacher;
}
function get_course($name, $mysqli, $table, $arg){
    $id = $name.'_id';
    $sql = "SELECT $arg AS '$name', $id AS 'id' FROM course ";
    $query = $mysqli->query($sql);
    while($r = $query ->fetch_object()){
        $arr_course[$r->id] = $r->$name;
    }
    return $arr_course;
}
?>
