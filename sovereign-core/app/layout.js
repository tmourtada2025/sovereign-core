import React from 'react';

export const metadata = {
  title: 'Sovereign Core',
  description: 'Execution governor for the Sovereign Trader Institute system',
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
