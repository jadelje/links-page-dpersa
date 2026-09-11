interface UTMParams {
  utm_source?: string;
  utm_medium?: string;
  utm_campaign?: string;
  utm_term?: string;
  utm_content?: string;
}

export function getUTMParams(): UTMParams {
  if (typeof window === 'undefined') {
    return {};
  }

  const params: UTMParams = {};
  const searchParams = new URLSearchParams(window.location.search);

  const utmKeys = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content'] as const;

  utmKeys.forEach((key) => {
    const value = searchParams.get(key);
    if (value) {
      params[key] = value;
    }
  });

  return params;
}

export function storeUTMParams(params: UTMParams): void {
  if (typeof window === 'undefined') return;

  sessionStorage.setItem('utm_params', JSON.stringify(params));
}

export function getStoredUTMParams(): UTMParams {
  if (typeof window === 'undefined') return {};

  const stored = sessionStorage.getItem('utm_params');
  return stored ? JSON.parse(stored) : {};
}
