import React, { useEffect, useState } from 'react'

export function PngImage({ data }: { data: Uint8Array | undefined }) {
  const [url, setUrl] = useState<string | undefined>(undefined)
  useEffect(() => {
    if (data) {
      const blob = new Blob([data], { type: 'image/png' })
      const obj = URL.createObjectURL(blob)
      setUrl(obj)
      return () => {
        URL.revokeObjectURL(obj)
      }
    } else {
      setUrl(undefined)
    }
  }, [data])

  return <img src={url} style={{ width: '100%' }} />
}
