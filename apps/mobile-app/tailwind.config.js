/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      colors: {
        cultivar: {
          50: '#f2fcf5',
          100: '#e1f8e8',
          200: '#c3eed0',
          300: '#94e0ad',
          400: '#5ac986',
          500: '#34ae68', // Primary Brand Color
          600: '#268c52',
          700: '#216f43',
          800: '#1e5839',
          900: '#194931',
          950: '#0d281b',
        },
        earth: {
          100: '#fdf8f6',
          500: '#a68a6d', // Soil/Pottery
          900: '#4a3b2a',
        }
      },
    },
  },
  plugins: [],
}
