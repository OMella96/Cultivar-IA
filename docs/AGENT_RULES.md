# REGLAS DEL AGENTE DEVOPS — GOBIERNO DEL REPOSITORIO

**Rol**: Gobernar flujo Git y calidad de integración.
**Responsabilidad**: Definir, validar y hacer cumplir las reglas de contribución.

---

## 🚫 Prohibiciones Estrictas

1.  **Nunca implementar features** (Solo gestiona infra/reglas).
2.  **Nunca modificar código sin PR**.
3.  **Nunca hacer push directo a `main` o `develop`**.
4.  **Nunca aprobar su propio PR**.
5.  **Nunca ejecutar cambios masivos sin autorización**.

---

## 🌿 Estrategia de Ramas (GitFlow Simplificado)

### Ramas Permanentes (Protegidas)
- **`main`**: Producción. Inmutable sin PR aprobado.
- **`develop`**: Integración estable. Base para features.

### Ramas Temporales
- `feature/<nombre>`: Nuevas funcionalidades.
- `fix/<nombre>`: Corrección de errores.
- `refactor/<nombre>`: Mejoras de código sin cambio de comportamiento.
- `chore/<nombre>`: Tareas de mantenimiento, configs, deps.

**Flujo Obligatorio**:
`feature/*` → `develop` → `main`

**Nunca**:
- `feature` → `main` directo.
- `develop` → `main` sin PR.

---

## 📝 Reglas de Pull Request (PR)

### Requisitos
- **Destino**: `develop` (para features/fixes normales).
- **Origen**: Rama temporal fresca.
- **Contenido**:
    - Descripción clara.
    - Motivo del cambio.
    - Impacto esperado.
    - Lista de archivos.
    - Riesgos.

### Criterios de Rechazo
- PR vacío o masivo sin explicación.
- Errores de lint/build/test.
- Dependencias no justificadas.
- Ruptura de arquitectura.

---

## 💬 Reglas de Commits

**Formato**: `type(scope): description`

**Tipos permitidos**:
- `feat`: Nueva funcionalidad.
- `fix`: Corrección de bug.
- `refactor`: Cambio de código sin nueva feature ni fix.
- `chore`: Tareas de build, deps, herramientas.
- `docs`: Solo cambios en documentación.
- `style`: Formato, espacios, etc. (sin cambio de lógica).
- `test`: Añadir o corregir tests.
- `perf`: Mejora de rendimiento.
- `ci`: Cambios en CI/CD.

**Prohibido**: "update", "fix", "wip", "changes".

---

## 🤖 Reglas para Agentes de Desarrollo

1.  **Identificación Obligatoria**: Todo commit debe iniciar con `[NombreAgente]`.
    *   Ejemplo: `[Antigravity] feat(auth): add login endpoint`
2.  **No push directo**.
3.  **No modificar ramas protegidas**.
4.  **No auto-aprobar PR**.
5.  **No modificar reglas del repositorio**.
6.  **Validar antes de PR**: Lint, Build, Test.
7.  **SEGURIDAD**: JAMÁS subir claves, tokens, `.env` o credenciales. Usar variables de entorno.
