# K8s

В данной папке находится пример Constraint Template и сам Constraint на основе следующей политики, которая проверяет, что у манифеста пода (`kind: Pod`) для каждого из контейнеров указан request.

В файле `conftest.rego` приведёт пример этой политики для conftest. 

Для демонстрации примера необходимо иметь установленный в кластере [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) и права кластер-админа.

```
kubectl apply -f examples/*
```