# Cultivar-IA 🌿

Aplicación de seguimiento inteligente de cultivos con asistencia de IA.

## Documentación
La documentación detallada del proyecto se encuentra en la carpeta `/docs`:
- [Arquitectura](./docs/ARCHITECTURE.md)
- [Roadmap](./docs/ROADMAP.md)

## Como iniciar

### Requisitos
- Node.js (v20+)
- Docker
- NPM

### Pasos
1. Instalar dependencias:
   ```bash
   npm install
   ```
2. Levantar infraestructura (DB + MinIO):
   ```bash
   docker compose up -d
   ```
3. Inicializar base de datos:
   ```bash
   npx nx run api:prisma-migrate
   ```
4. Iniciar Backend:
   ```bash
   npx nx serve api
   ```
5. Iniciar Mobile App:
   ```bash
   npx nx start mobile-app
   ```
