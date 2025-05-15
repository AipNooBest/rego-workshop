# Решение задания 1

## Ход решения

Из-за того, что правила в `if` применяются сверху вниз, то сначала нужно проитерироваться по каждому из аквариумов (`some aquarium in input.aquarium`) и проверить, что имя аквариума не равно Coral Haven (`not aquarium.name == "Coral Haven"`). Если имя аквариума будет равно Coral Haven, тогда просто пропускаем этот аквариум. Далее нужно проитерироваться по каждой рыбе в аквариуме и проверить, равен ли её цвет цвету Multicolor. Если равен, тогда с помощью встроенной функции `sprintf` вывести сообщение, где нужно будет указать вид и имя рыбы с помощью плейсхолдеров `%s` и полей `fish.species, fish.name`.

## Код политики

```rego
package solutions

deny contains msg if {
	some aquarium in input.aquarium
	not aquarium.name == "Coral Haven"

	some fish in aquarium.fish
	fish.color == "Multicolor"

	msg := sprintf("Разноцветная рыба %s %s достойна жить только в Coral Haven!", [fish.species, fish.name])
}
```
