/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        dpersa: {
          cream: '#F8F7F5',
          lavender: '#DCCFE3',
          plum: '#5E3B56',
          champagne: '#BFA37A',
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
