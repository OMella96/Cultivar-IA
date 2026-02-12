# Arquitectura del Proyecto Cultivar-IA

## Visión General
Este proyecto es una aplicación de seguimiento de cultivos inteligente, diseñada como un **Monolito Modular** para maximizar la velocidad de desarrollo inicial sin sacrificar la escalabilidad futura.

## Stack Tecnológico

### Frontend (Mobile)
- **Framework**: React Native + Expo
- **Lenguaje**: TypeScript
- **Estilos**: NativeWind (TailwindCSS para React Native)
- **Estado**: TanStack Query (Server State) + Zustand (Client State)
- **Navegación**: Expo Router

### Backend (API)
- **Framework**: NestJS
- **Lenguaje**: TypeScript
- **Base de Datos**: PostgreSQL
- **ORM**: Prisma
- **Vector Search**: pgvector
- **Almacenamiento**: MinIO (Dev) / S3 (Prod)

## Diseño de Módulos (Backend)
El backend se divide en dominios lógicos:
1.  **Cultivation**: Gestión de cultivos, plantas y ciclos.
2.  **Identity**: Usuarios y autenticación (Multi-tenant).
3.  **Logs/Events**: Sistema central de registro de eventos (Riegos, Fotos, etc.).
4.  **Equipment**: Gestión de inventario de equipos.
5.  **AI**: Orquestador de agentes y RAG.

## Modelo de Datos
La entidad central es el `Log` (Evento), que permite reconstruir la historia de cualquier planta.
- Ver `schema.prisma` para el detalle de implementación.

## Infraestructura
Todo el entorno de desarrollo está contenerizado con Docker:
- PostgreSQL con extensión `vector`.
- MinIO para simular S3 localmente.
