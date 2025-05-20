# Как написать свою первую политику на Rego и даже больше

Данный репозиторий содержит сопутствующую информацию к воркшопу на Positive Hack Days 2025.

В папке `theory` можно найти основную информацию о синтаксисе Rego, которая потребуется для решения заданий.

В папке `practice` находятся практические задания, большинство из которых были разобраны на воркшопе. Для каждого из заданий имеется решение для самопроверки. В папке `practice/demo` находятся задания к демонстрационному JSON. В папке `practice/dockerfile` лежат задания для разных Dockerfile, которые рекомендуется проверять с помощью утилиты conftest. В папке `practice/k8s` лежит пример интеграции OPA в Kubernetes с помощью Gatekeeper.

## Что понадобится в процессе воркшопа
- Conftest, установленный через Docker (`docker pull openpolicyagent/conftest`), либо в качестве исполняемого файла ([гайд по установке](https://www.conftest.dev/install/) или [ссылка на бинарники](https://github.com/open-policy-agent/conftest/releases))
- Плагин Open Policy Agent в Visual Studio Code (желательно) **ИЛИ** открытый [Rego Playground](https://play.openpolicyagent.org/)
- (По желанию) склонированный репозиторий

## Способы выполнения практических заданий
Решать задания и проверять их можно тремя способами...

### Способ 1 - плагин VS Code (Open Policy Agent)
Для решения задач этим способом необходимо создать в рабочей директории файл в формате `.rego`. В этом файле будет происходить написание политик, а входные данные будут браться из файла `input.json`. Для запуска решений в папке `solutions` в репозитории, необходимо переместить файл `input.json` в эту папку, после чего открыть файл в VS Code и выполнить желаемую политику.

> [!IMPORTANT]
> Для качественной работы плагина на **Linux** необходимо установить Regal не через плагин, а напрямую из [репозитория Regal](https://github.com/StyraInc/regal/releases) для вашей архитектуры. Это связано с тем, что плагин качает некорректную версию, которая попросту не запускается. После скачивания исполняемого файла необходимо указать путь до него в настройках плагина через settings.json (`"opa.dependency_paths.regal"`). Для **Windows** установка OPA и Regal через плагин работает без проблем.

### Способ 2 - [conftest](https://www.conftest.dev/)
При условии, что [conftest](https://www.conftest.dev/install/) уже установлен на ПК, для удобства необходимо создать папку `policy` и писать политики в файлах `.rego` внутри этой папки. После чего запускать conftest и смотреть на результаты. Поскольку входящий файл всегда один и тот же, команда для всех политик (при условии, что они находятся в папке `policy`) будет одинаковой. При желании, путь до папки с политиками можно изменить с помощью флага `-p`.

```sh
# Если входящие данные подаются через JSON
conftest test --all-namespaces input.json

# conftest автоматически определит тип файла
# Можно указать путь как до файла, так и до папки
conftest test --all-namespaces Dockerfile
conftest test --all-namespaces my_files_dir
```

Для запуска всех предоставленных решений (если они находятся в папке `solutions`) необходимо выполнить команду:
```sh
conftest test --all-namespaces -p solutions input.json
```

**При использовании Docker команда будет выглядеть следующим образом:**
```sh
docker run --rm -v ${PWD}:/project openpolicyagent/conftest test --all-namespaces -p solutions input.json
```

### Способ 3 - [Rego Playground](https://play.openpolicyagent.org/)
Необходимо скопировать содержимое файла `input.json` и вставить в окно `INPUT`, а в основном окне писать политику. Для запуска предоставленных решений достаточно в основное окно вставить содержимое `.rego` файлов в папке `solutions`.

## Пример пайплайна
В данном репозитории с помощью Github Actions запускается пайплайн с conftest. Его можно использовать как пример интеграции в пайплайн, либо для проверки, какой результат должны выводить правильные ответы, и что эти ответы работают правильно.

## Полезные ссылки
- [Rego Playground](https://play.openpolicyagent.org/)
- [Документация по Rego и его синтаксису](https://www.openpolicyagent.org/docs/latest/policy-language/)
- [Style Guide по Rego](https://github.com/StyraInc/rego-style-guide/blob/main/style-guide.md)
- [Примеры и способы интеграции OPA, use-cases и связанные проекты](https://www.openpolicyagent.org/ecosystem/)
- [Курс от создателей OPA (необходима регистрация)](https://academy.styra.com/courses/opa-rego)
- [Conftest](https://www.conftest.dev/)
- [Gatekeeper (OPA в Kubernetes)](https://open-policy-agent.github.io/gatekeeper/website/docs/)
