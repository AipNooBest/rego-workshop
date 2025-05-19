# Задание 1 - Используется версия latest

__Задание__: написать политику, которая проверяет, что образы Dockerfile не используют версию 'latest'. Образ на основе scratch проверять не нужно.

Решение должно выдавать сообщение для файла `positive.Dockerfile`, но не выдавать ничего для файла `negative.Dockerfile`

Для запуска предоставленного решения необходимо выполнить команду:
```sh
conftest test --all-namespaces -p solution.rego samples
```

При использовании Docker команда будет выглядеть следующим образом:
```sh
docker run --rm -v ${PWD}:/project openpolicyagent/conftest test --all-namespaces -p solution.rego samples
```

> [!TIP]
> Для тех, у кого не установлен conftest, но есть желание написать политику, в папке лежит сконвертированный с помощью conftest файл `input.json`. Его можно использовать в качестве входных данных в Rego Playground или в плагине VS Code.