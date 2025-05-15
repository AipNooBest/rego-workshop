# Решение задания 4

## Ход решения

Начало похоже на предыдущие политики: итерируемся по аквариумам, в них - по рыбам. Отдельно объявляем переменную `species`, в которую запишем вид рыбы (`species := fish.species`), чтобы мы смогли позднее с ней удобно сравниваться. Далее с помощью Array Comprehensions создаём массив, в котором собираем `amount` каждой рыбы, у которой вид совпал с переменной `species`. Можно не объявлять лишнюю переменную и сразу применить встроенную функцию `sum` к этому массиву и записать результат в переменную `total`. В конце остаётся только вывести вид рыбы и её количество.

## Код политики

**Примечание:** Чтобы убедиться, что значения в массив total приходят верные, можно убрать функцию `sum` и через функцию `print(total)` вывести значение для каждой из `fish`.

```rego
package solutions

fish_total contains msg if {
	some aquarium in input.aquarium
	some fish in aquarium.fish

	species := fish.species

	total := sum([inner_fish.amount |
		some inner_aquarium in input.aquarium
		some inner_fish in inner_aquarium.fish
		inner_fish.species == species
	])

	msg := sprintf("Рыб вида %s всего: %d", [species, total])
}
```
