# Решение задания

Итерируемся по каждой команде (`some resource in input`). Потом проверяем, что stage текущей команды является последним (`check_last_stage(resource.Stage)`)[^1]. Откидываем те образы, которые являются scratch (`not resource.Value[0] == "scratch"`)[^2]. В конце с помощью собственной функции `has_user_in_last_stage()` проверяем, есть ли среди хотя бы одной инструкции USER та, которая находится на последнем этапе (`resource.Cmd == "user"` и `resource.Stage == last_stage`). Если нет, то выводим сообщение в `deny`.

[^1] Функция `is_last_stage()`: принимает на вход текущий stage команды. Собираем сет из всех встречающихся stage в данном Dockerfile (`stage_list := {resource.Stage | some resource in input}`). Находим самый последний stage (`last_stage := max(stage_list)`). Если текущий stage совпадает с последним, то функция вернёт `true`.

[^2] Функция `is_scratch_stage()`: принимает на вход текущий stage команды. Собираем сет из всех stage, которые относятся к инструкции FROM scratch. Проверяем, что сет не пустой (`count(stage_list) > 0`). Если текущий stage совпадает с любым stage из сета (`current_stage in stage_list`), то функция вернёт `true`.
