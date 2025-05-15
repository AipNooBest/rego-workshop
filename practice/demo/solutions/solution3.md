# Решение задания 3

## Ход решения

В первую очередь нужно выбрать каждый из аквариумов (`some aquarium in input.aquarium`). Далее нужно посчитать сколько находится рыб в этом аквариуме. Как это сделать? Можно использовать Array Comprehensions. Он позволяет собрать массив на основе определенных условий. Итерируемся по каждой рыбе в аквариуме и записываем в значение массива её количество (`fish.amount`). Далее с помощью встроенной функции `sum` складываем все элементы массива и записываем это значение в отдельную переменную (`total_fish := sum(fish_amount)`). В конце если значение этой переменной больше, чем максимально допустимое в аквариуме (`total_fish > aquarium.max_fish`), то с помощью встроенной функции `sprintf` выводим сообщение, где нужно будет указать название аквариума с помощью плейсхолдера `%s` и поля `aquarium.name`, а допустимое количество рыб и находящееся в аквариуме с помощью плейсхолдеров `%d` и полей `aquarium.max_fish, total_fish`.

## Код политики

```rego
package solutions

deny contains msg if {
	some aquarium in input.aquarium

	fish_amount := [fish.amount |
		some fish in aquarium.fish
	]

	total_fish := sum(fish_amount)
	total_fish > aquarium.max_fish

	# regal ignore:line-length
	msg := sprintf("В аквариуме %s %d рыб. Максимальная вместимость этого аквариума: %d рыб", [aquarium.name, total_fish, aquarium.max_fish])
}
```
