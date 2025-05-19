# Решение задания

## Ход решения

Итерируемся по каждой команде (`some resource in input`). Потом проверяем, что stage текущей команды является последним (`check_last_stage(resource.Stage)`)[^1]. Откидываем те образы, которые являются scratch (`not resource.Value[0] == "scratch"`)[^2]. В конце с помощью собственной функции `has_user_in_last_stage()` проверяем, есть ли среди хотя бы одной инструкции USER та, которая находится на последнем этапе (`resource.Cmd == "user"` и `resource.Stage == last_stage`). Если нет, то выводим сообщение в `warn`.

Функции `is_last_stage()` и `is_scratch_stage()` могут быть полезны не только для этой политики. Чтобы не писать эти функции по несколько раз и использовать их в других политиках, можно вынести эти функции в отдельный файл. Потом после `package` нужно указать какие файлы или отдельные функции/правила мы импортируем в нашу политику.

> [!NOTE]
> Ниже показан пример без использования внешних импортов. В репозитории лежит пример с использованием импорта вспомогательных функций из другого файла.

[^1]: Функция `is_last_stage()`: принимает на вход текущий stage команды. Собираем сет из всех встречающихся stage в данном Dockerfile (`stage_list := {resource.Stage | some resource in input}`). Находим самый последний stage (`last_stage := max(stage_list)`). Если текущий stage совпадает с последним, то функция вернёт `true`.

[^2]: Функция `is_scratch_stage()`: принимает на вход текущий stage команды. Собираем сет из всех stage, которые относятся к инструкции FROM scratch. Проверяем, что сет не пустой (`count(stage_list) > 0`). Если текущий stage совпадает с любым stage из сета (`current_stage in stage_list`), то функция вернёт `true`.

## Код политики

```rego
package task2

warn contains msg if {
	some resource in input
	is_last_stage(resource.Stage)
	not is_scratch_stage(resource.Stage)

	not has_user_in_last_stage(resource.Stage)

	msg := "В Dockerfile должна быть команда 'USER'"
}

has_user_in_last_stage(last_stage) if {
	some resource in input
	resource.Cmd == "user"
	resource.Stage == last_stage
}

is_last_stage(current_stage) if {
	stage_list := {resource.Stage | some resource in input}
	last_stage := max(stage_list)
	current_stage == last_stage
}

is_scratch_stage(current_stage) if {
	stage_list := {resource.Stage |
		some resource in input
		resource.Cmd == "from"
		resource.Value[0] == "scratch"
	}
	count(stage_list) > 0
	current_stage in stage_list
}
```

## Метаданные

Помимо импортов, в политику можно добавить справочную информацию или иначе - метадату. С помощью неё можно добавить описание как к политике в целом, так и к определённым правилам. Метадата должна начинаться с `# METADATA`. Она будет распарсена OPA в виде YAML. Кроме того, каждая строка в блоке комментариев метадаты должна начинаться с самого начала строки в модуле/файле, иначе они не будут учитываться.

Некоторые инструменты, например Trivy, используют метаданные политик, чтобы выводить в stdout номер сработавшей политики, описание и прочую информацию. Пример использования метаданных расположен в файле `solution.rego`
