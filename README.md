# Meru API

Backend en **Ruby on Rails** pensado como base para servicios desacoplados y despliegue en contenedores Docker.

Este proyecto está orientado a servir como plantilla para nuevas APIs o microservicios en Rails, con una estructura clara y preparada para entornos de desarrollo y producción.

---

## Objetivos del proyecto

- Proporcionar una base en Ruby on Rails en modo API.
- Incluir una configuración lista para ejecutar la aplicación en Docker.
- Facilitar la creación rápida de nuevos servicios backend manteniendo buenas prácticas.
- Servir como ejemplo de cómo estructuro proyectos backend en Rails.

> La lógica de negocio específica puede adaptarse según las necesidades del proyecto.  
> El foco de este repositorio está en la **estructura del backend** y la **preparación para despliegue**.

---

## Stack técnico

- **Lenguaje:** Ruby (ver versión en `.ruby-version`)
- **Framework:** Ruby on Rails (modo API)
- **Base de datos:** PostgreSQL (configurable en `config/database.yml`)
- **Servidor de aplicación:** Puma
- **Contenedores:** Docker (incluye `Dockerfile`)

---

## Requisitos previos

- **Docker** instalado y funcionando.
- (Opcional) **Ruby** y **Bundler** instalados, si se desea ejecutar la app sin Docker.

---

## Ejecución con Docker

1. Clonar el repositorio:

```bash
git clone git@github.com:Manuel-IA/meru-api.git
cd meru-api
