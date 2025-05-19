# Как написать свою первую политику на Rego и даже больше

Данный репозиторий содержит сопутствующую информацию к воркшопу на Positive Hack Days 2025.

В папке `theory` можно найти основную информацию о синтаксисе Rego, которая потребуется для решения заданий.

В папке `practice` находятся практические задания, большинство из которых были разобраны на воркшопе. Для каждого из заданий имеется решение для самопроверки. В папке `practice/demo` находятся задания к демонстрационному JSON. В папке `practice/dockerfile` лежат задания для разных Dockerfile, которые рекомендуется проверять с помощью утилиты conftest. В папке `practice/k8s` лежит пример интеграции OPA в Kubernetes с помощью Gatekeeper.

## Полезные ссылки
- [Rego Playground](https://play.openpolicyagent.org/)
- [Документация по Rego и его синтаксису](https://www.openpolicyagent.org/docs/latest/policy-language/)
- [Style Guide по Rego](https://github.com/StyraInc/rego-style-guide/blob/main/style-guide.md)
- [Примеры и способы интеграции OPA, use-cases и связанные проекты](https://www.openpolicyagent.org/ecosystem/)
- [Курс от создателей OPA (необходима регистрация)](https://academy.styra.com/courses/opa-rego)
- [Conftest](https://www.conftest.dev/)
- [Gatekeeper (OPA в Kubernetes)](https://open-policy-agent.github.io/gatekeeper/website/docs/)