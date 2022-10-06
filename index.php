<?php include './config.php'; ?>
<?php include 'php/myfunc.php'; ?>
<?php include 'php/query.php'; ?>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <title>Университет</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
            <script type='text/javascript' src='js/interlocking_combo.js'></script>
    </head>
    <body>
        <div id="main">
            <header>
                <h1>Запросы. Университет. </h1>

            </header>

            <section>
                <section> 
                    <?php if (isset($_REQUEST['b_view'])){ ?>
                    <table border = "1" width="500">
                        <tr>
                            <th>Преподаватель</th>
                            <th>Курс</th>
                            <th>Продолжительность курса</th>
                            <th>Факультет</th>
                        </tr>
                        <?php while ($r = mysqli_fetch_object($query)){
                                $teacher = $r->teacher;
                                $course = $r->course;
                                $duration = $r->min_duration;
                                $faculty = $r->faculty;
                                echo "<tr><td>$teacher</td><td>$course</td><td>$duration</td><td>$faculty</td></tr>";
                              } ?>       
                    </table>       
                    <?php } else if (isset($_REQUEST['b_func'])){ ?>
                        <p>Количество студентов, не имеющих ни одной оценки: <?= $res ?></p>
                    <?php } else if (isset($_REQUEST['b_proc']) || isset($_REQUEST['b_teacher_course'])){ ?> 
                    <form method='post' action=''>
                        <p>Выберите преподавателя: <?= combo('teacher', $mysqli, 'teacher', 'last_name'); ?></p>
                        <p>Выберите курс: <?php if(isset($_REQUEST['teacher'])) { 
                                                    combo('course', $mysqli, 'teacher_course', 'course_name');
                                                } else {
                                                    combo('course', $mysqli, 'teacher_course', 'course_name', true);    
                                                }?>
                        </p>
                        <p><input name="b_teacher_course" type="submit" value="Получить"></input></p>
                    </form>                    
                    <?php if (isset($_REQUEST['b_teacher_course'])) { 
                        $r = $res->fetch(PDO::FETCH_OBJ);
                        if (!empty($r)) { ?>
                        <p>Нагрузка:</p>
                        <table border = "1" width="500">
                            <tr>
                            <th>Часы</th>
                            <th>Факультет</th>
                            </tr>
                            <?php echo "<tr><td>".$r->min_duration."</td><td>".$r->faculty."</td></tr>";
                            while($r = $res->fetch(PDO::FETCH_OBJ)){
                                echo "<tr><td>".$r->min_duration."</td><td>".$r->faculty."</td></tr>";
                            }?>
                        </table>
                    <?php } else { ?>
                        <p>Выбранный преподаватель не ведет эту дисциплину!</p>
                    <?php }}} else { ?>
                        <p>Нажмите на кнопки справа!</p>
                    <?php }?>                  
                </section>
                <aside>
                    <h2>Запросы</h2>
                    <ul>
                        <form method='post' action='index.php'>
                            <p><input name="b_view" type="submit" value="Представление"></input></p>
                            <p><input name="b_func" type="submit" value="Функция"></input></p>
                            <p><input name="b_proc" type="submit" value="Процедура"></input></p>
                        </form>
                    </ul>
                </aside>
            </section>
            <footer> Берестова, 2020</footer>
        </div>
    </body>
</html>
