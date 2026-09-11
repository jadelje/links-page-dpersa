# go.dpersa.com

Puerta de entrada elegante y premium para Dpersa, diseñada como landing de tráfico desde redes sociales, publicidad y códigos QR.

## 🎯 Características

- ✨ Diseño mobile-first, elegante y femenino
- 🎨 Paleta de colores premium: ciruela (#5E3B56), lavanda suave (#DCCFE3), champagne (#BFA37A)
- 📊 Tracking UTM automático (sin envío de datos a servicios externos)
- 🔍 SEO optimizado (Open Graph, Twitter Cards, Canonical URL)
- ⚡ Zero dependencies (excepto Astro)
- 🔐 Completamente independiente del proyecto dpersa.com

## 📁 Estructura del Proyecto

```
├── public/
│   ├── favicon.svg
│   └── og-image.svg
├── src/
│   ├── pages/
│   │   └── index.astro       # Página principal
│   └── utils/
│       └── utm.ts            # Utilidad para leer parámetros UTM
├── astro.config.mjs
└── package.json
```

## 🚀 Comandos

```sh
npm run dev      # Inicia servidor local en localhost:4321
npm run build    # Compila para producción en ./dist/
npm run preview  # Visualiza el build localmente
```

## 📍 Rutas

- `/` - Página principal (única ruta)

## 🔗 CTAs

- **Tienda**: https://tienda.dpersa.com
- **WhatsApp**: Placeholder (requiere número configurado)
- **Instagram**: https://instagram.com/dpersa
- **Social**: Enlaces circulares a Instagram y Tienda

## 📊 Parámetros UTM Soportados

- `utm_source` - Origen del tráfico (ej: instagram, facebook)
- `utm_medium` - Medio (ej: social, paid)
- `utm_campaign` - Campaña
- `utm_term` - Término
- `utm_content` - Contenido

Ejemplo: `https://go.dpersa.com/?utm_source=instagram&utm_medium=social&utm_campaign=perfil`

Los parámetros se leen desde la URL y se almacenan en sessionStorage sin ser enviados a servicios externos.
