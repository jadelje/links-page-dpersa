# go.dpersa.com

Página de links para Dpersa — floristería premium. Diseñada para tráfico desde redes sociales, publicidad y códigos QR.

**URL en producción:** https://go.dpersa.com

## Paleta de colores

| Token | Hex | Uso |
|---|---|---|
| `cream` | `#FAF6F2` | Fondo general y header |
| `plum` | `#49342D` | Títulos y texto principal |
| `rose` | `#B87579` | Botón principal de compra |
| `lavender` | `#F0D8D7` | Fondos de categorías |
| `champagne` | `#C6A15B` | Detalles decorativos |
| `whatsapp` | `#25D366` | Botón de WhatsApp |

## Estructura

```
├── public/
│   ├── favicon.svg
│   ├── og-image.svg
│   └── icons/
├── src/
│   ├── components/
│   │   ├── Button.astro
│   │   ├── CategoryCard.astro
│   │   ├── Header.astro
│   │   └── SocialLinks.astro
│   ├── layouts/
│   │   └── BaseLayout.astro
│   ├── pages/
│   │   └── index.astro
│   ├── styles/
│   │   └── globals.css
│   └── utils/
│       └── utm.ts
├── scripts/
│   ├── deploy.sh       # Deploy desde el VPS
│   └── vps-setup.sh    # Setup inicial del VPS
├── Dockerfile
├── docker-compose.yml
└── nginx.conf
```

## Desarrollo local

```bash
npm install
npm run dev       # http://localhost:4321
npm run build     # Compila en ./dist/
npm run preview   # Previsualiza el build
```

## Infraestructura

- **VPS:** Contabo (Ubuntu)
- **Contenedor:** nginx:stable-alpine sirviendo el build estático
- **SSL:** Cloudflare Origin Certificate — modo Completo
- **DNS:** Cloudflare proxy activo en `go.dpersa.com`
- **Puerto 443:** nginx con cert montado desde `/opt/dpersa-links/certs/`

### Deploy

Desde el VPS:

```bash
cd /opt/dpersa-links && git pull origin main && ./scripts/deploy.sh
```

El script hace pull del repo, reconstruye la imagen Docker y reinicia el contenedor.

### Certificado SSL

El certificado de origen de Cloudflare vive en el VPS en `/opt/dpersa-links/certs/` y **no se sube al repositorio**. Para renovarlo, generá uno nuevo en Cloudflare → SSL/TLS → Servidor de origen y reemplazá los archivos en esa ruta.

## Parámetros UTM

Se leen desde la URL y se guardan en `sessionStorage` sin envío a servicios externos.

```
https://go.dpersa.com/?utm_source=instagram&utm_medium=social&utm_campaign=perfil
```

Parámetros soportados: `utm_source`, `utm_medium`, `utm_campaign`, `utm_term`, `utm_content`.
