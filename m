Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.8559.1620303681245990469
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 May 2021 05:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rsl6pVX0;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id m12so7985407eja.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 May 2021 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lKc9TTf8u1J6N59VjoA7sDOwRtiq1qjhEVjaES+w9sk=;
        b=Rsl6pVX0pFnOK7G/GfUNW8BMQWsisSTk4H/EE1JKx+Q0bGvBp3hl41aMMpcAfacLgz
         mQfd3Yzlam/2Z5jPPQUT4gQ27D7DI18EONJ8WI1mXsPItp48SHOZnF0FLmcQA6yL4oZC
         XMq4StS1a/BN+nk4IWA3/+wPNfIxGd/aYUu+UeQo+c/Idoj3AxFiLG3muvEGxFrpFXaI
         1LRC6lCpl6MP+oZuPDmidHLNUZdk+1cdlq/fuMcnNeOi34cFU3QGRibghE42H4RpU9iY
         rYelrk+bYpc+0Vj8oOfvmXFxh+rIdjZ+SbRGLJSdFFWzEOnj0AS0zPZKLeqGfbZ/ypIP
         m+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lKc9TTf8u1J6N59VjoA7sDOwRtiq1qjhEVjaES+w9sk=;
        b=FTkXeN7pUWzlPNyX9PWVBS82+ukDdff28QcWggD/U1SpchVAeG+OYeiBqZRAffAFLE
         wh20E6mZbm9rVfJAsPr65N9Zn+aNAzmIRyvNKFfJr6HMpnBRdEDPfqdOua80IrETRBKU
         7VQzt7VhcJL1IUl2b4tT6D5DOD0ifYQHZcsoCXPJDImT1yUSEmOx/hy9X36gaBMYPJZa
         EhNh2AtxsMTfkW7UARfHij58B4yh0cNqqcSqXS6ZA6dfzJPvpdjXBzLWRT1rfLvhUFNs
         5rOog8MejYYSQbzyS+Iv2xs3AZtil0TUaswa8u5V5CyrQZpThce1NKLqv+0TcFYEy/iM
         rKgQ==
X-Gm-Message-State: AOAM531mqjphFb7JLnrDloFd5bKbm5WfXqseQoutCtqw/y7ubQh8ojp9
	JKzcGru4kqWUadl/P7YsNYtqPEpU7vx4U5kVkUU=
X-Google-Smtp-Source: ABdhPJwYFdFoBkuVph5+KwfPF4oeUznb6tfwShuEbL0EeGCa08vxcEa5wdjhqnrY5dlzr3iWQtk809QUHsYIyOkHDOQ=
X-Received: by 2002:a17:906:a103:: with SMTP id t3mr4144225ejy.334.1620303679652;
 Thu, 06 May 2021 05:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB34616A38425054102C5C6ED692589@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB34616A38425054102C5C6ED692589@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 May 2021 08:21:08 -0400
Message-ID: <CADkTA4P+Qd4OKQ0cC1cmei_LiykikSS+kmHfO1E94c5ibC7c+A@mail.gmail.com>
Subject: Re: xen-tools compilation errors with GCC 11
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 2:01 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> Hello,
>
>
>
> We identified compilation errors for xen-tools (4.14 and 4.15) with GCC 1=
1.1 due to `-Werror=3Dvla-parameter`.
>
>
>
> There are a couple of source files with similar errors like this:
>
> ```
>
> linux.c:164:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const=
 long unsigned int[]'} declared as an ordinary array [-Werror=3Dvla-paramet=
er]
>
>   164 |                                  const xen_pfn_t arr[/*num*/], in=
t err[/*num*/])
>
>       |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~
>
> ```
>
>
>
> The quick fix for is to have the following:
>
> ```
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
>
> index 3560e79..5a054af 100644
>
> --- a/recipes-extended/xen/xen-tools.inc
>
> +++ b/recipes-extended/xen/xen-tools.inc
>
> @@ -725,9 +725,11 @@ do_configure() {
>
>      do_configure_common
>
> }
>
>
>
> +EXTRA_CFLAGS_XEN_TOOLS_append =3D " -Wno-vla-parameter"
>
> +
>
> do_compile() {
>
>      cd ${S}
>
> -    oe_runmake tools PYTHON=3D"${PYTHON}"
>
> +    oe_runmake tools EXTRA_CFLAGS_XEN_TOOLS=3D"${EXTRA_CFLAGS_XEN_TOOLS}=
" PYTHON=3D"${PYTHON}"
>
> }
>
>
>
> do_install() {
>
> ```
>
>
>
> I=E2=80=99d like to know if this is an acceptable solution or if you have=
 any other suggestions other than fixing the actual code
>
> since this might take some time and I think that the Xen community will b=
e looking at this soon.
>

I'm ok with the workaround. The code hasn't changed, and we've lived
with it so far, so I'm not really concerned at the technical level
about the warning.

And I'd rather no one spend the time to do a fix that might be
different than the eventual upstream Xen solution.

Bruce

>
>
> Cheers,
>
>
>
> --
> Diego Sueiro
>
>



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
