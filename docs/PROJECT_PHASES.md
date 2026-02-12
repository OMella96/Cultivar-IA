# Fases del Proyecto y DevOps

Este documento detalla el plan de implementación progresiva de las prácticas de DevOps y Gobierno en el proyecto Cultivar-IA.

---

## 📍 Estado Actual: Fase 1

### Objetivos
Establecer los cimientos del control de calidad y flujo de trabajo.

### Implementaciones Activadas
1.  **Commitlint**: Validación automática de mensajes de commit (Conventional Commits).
2.  **Pull Request Template**: Estandarización de la información en cada PR.
3.  **CI Básico**: Pipeline de GitHub Actions que ejecuta `lint` y `build` en `main`, `develop` y PRs.
4.  **Protección de Ramas**: `main` y `develop` protegidas vía CODEOWNERS (requieren revisión).

---

## 🚀 Fase 2 (Futuro / Post-MVP)

### Objetivos
Automatización avanzada y métricas de calidad estrictas.

### Implementaciones Planeadas
1.  **Smart CI**: Uso de `nx affected` para ejecutar tareas solo en lo modificado.
2.  **Coverage Gates**: % mínimo de cobertura de tests obligatorio.
3.  **Branch Restrictions**: Reglas de protección avanzadas en GitHub (si aplica plan Enterprise/Pro).
4.  **PR Size Checks**: Alerta o bloqueo de PRs demasiado grandes.
5.  **Dependency Validation**: Escaneo de vulnerabilidades y licencias.
