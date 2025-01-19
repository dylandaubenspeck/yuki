import type { Metadata } from 'next'

import { getBaseUrl } from '@/lib/utils'

export const seo = (params: {
  title?: string
  description?: string
  images?: string[]
  url?: string
}): Metadata => {
  const siteName = 'Create Yuki Turbo'
  const title = params.title ? `${siteName} | ${params.title}` : siteName
  const description =
    params.description ??
    'Clean and typesafe starter monorepo using Turborepo along with Next.js and tRPC '
  const url = params.url ? `${getBaseUrl()}${params.url}` : getBaseUrl()
  const images = [...(params.images ?? []), '/api/og']

  return {
    metadataBase: new URL(getBaseUrl()),
    title,
    description,
    applicationName: siteName,
    alternates: { canonical: url },
    twitter: { card: 'summary_large_image' },
    openGraph: { url, images, siteName, type: 'website' },
    icons: {
      icon: 'https://tiesen.id.vn/favicon.ico',
      shortcut: 'https://tiesen.id.vn/favicon-16x16.png',
      apple: 'https://tiesen.id.vn/apple-touch-icon.png',
    },
  }
}
