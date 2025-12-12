import React from 'react';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Sovereign Core',
  description: 'Execution governor for the Sovereign Trader Institute system',
};

/**
 * Root layout for the application. Do not add styling, navigation, or copy here.
 * This component exists solely to wrap all pages in the same HTML structure.
 */
export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}