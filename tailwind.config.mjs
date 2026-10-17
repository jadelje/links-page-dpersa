/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        dpersa: {
          cream: '#FAF6F2',
          lavender: '#F0D8D7',
          plum: '#49342D',
          champagne: '#C6A15B',
          rose: '#B87579',
          whatsapp: '#25D366',
          text: '#353233',
        },
      },
      fontFamily: {
        sans: [
          '-apple-system',
          'BlinkMacSystemFont',
          '"Segoe UI"',
          '"Helvetica Neue"',
          'sans-serif',
        ],
      },
    },
  },
  plugins: [],
};
