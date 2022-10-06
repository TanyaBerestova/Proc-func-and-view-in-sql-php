function func(selectedValue){
    var selectCourse = document.getElementById("course");
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'index.php');
    xhr.setRequestHeader("Content-type", "'application/x-www-form-urlencoded'");
    xhr.send('teacher=' + selectedValue);
    selectCourse.removeAttribute('disabled');
}


