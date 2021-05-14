Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.8153.1620996377361886083
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 05:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AMjTyd1O;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id u21so44442411ejo.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 05:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBWrL4yrwbD+oXD0B4qcUyWgHC9uxFOHmKUoRF4VTTQ=;
        b=AMjTyd1OBBKUuv/uOLJgsH1n31SmyzEu2+dZ6V+2OpcUlhlSS1EYpt6SZGhV0rmYWB
         XpAnqcBDK/0lHXjkzfg1smPp55Dwtu6y1fNm8mEWDNriE5NEtvHwEuJNOaPKBjfjhm1l
         gNpVjAge8KFqO2fbVPrCIGLPnXeU1XQbLWtzmOKeWx/pWCyrEsOudYqmK5sFuhHZMsnG
         ftGM/6A9asRkQY5lEAbUQ62xjJu2AXZAuXez+NCmBDls+3ZNBsJwmc2SWlM6TmjD0i/u
         YlSOS0+mSmfdKUCXr06GpjVL8zWDWNeUWPFDctCwF2ExmKwzpn/I5Svzyw02pfg6d4qD
         edvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBWrL4yrwbD+oXD0B4qcUyWgHC9uxFOHmKUoRF4VTTQ=;
        b=hnImV2QDoJgtgzD8iBXiaD+dScF5oooEo4SWcsPX/PWCN29AuqyrKsPSUbryaQUr+w
         sQZ3kj7ZXxwn6FBM7w7VGZ5MRvc7JiI6JPjOkUryrwZRIcnodAokM6Cs+4ffF7RnlmOv
         T5mb8J3Jw+t2bil7+RgA9B7GL/AS42F2xaQik7Xam9Sohbjp2EO6+69nB3DvVH8I6Ry6
         ZF6mixHl9+c7LFz59UCxWH56pgPdjI7Wm/e8QrPgjpbWlhCQ4Kj+P3+HutgVbEOu1vZ8
         Z/DxToOyCftzkAudT21JMhf9fA4eSnx92e7l93USl/mo3ViE7PCIjeq/92aANFhVFeJ7
         ab6w==
X-Gm-Message-State: AOAM530JB/tMw99Z8VpIm/zRnLOlBj0mg5VXTSOPftmaxPxa3nC+bsl8
	Gasa1oDErLPlFnHfvhqB8cFOnBIQrCvyjKx7+Fo=
X-Google-Smtp-Source: ABdhPJy/S/ST3VBIZRYaXMz6tLwp/DiCE+wZqmp3wBHckQY13cS5Agc+3jeEPkC7fN0ZthWQw9mhGz8x4tJw8GbyfJM=
X-Received: by 2002:a17:906:c211:: with SMTP id d17mr13559605ejz.247.1620996375746;
 Fri, 14 May 2021 05:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 14 May 2021 08:46:04 -0400
Message-ID: <CADkTA4Oo9hPOHmXfCW56Oh+=Weh7D2EPSxtbzPtL-RzdqRrBtQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/5] upx: fix build with gcc-11
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the fixups.

I haven't been able to spend time on any gcc11 fixes, so these are appreciated.

These built for me ... so they are merged.

But then I switched to a different machine on a different builder, and
dev86 blew up during compilation.

I'm leaving the changes as-is in the tree, and we can fix them as
required as new patches (I'm done mucking with history for one day;)

Cheers,

Bruce



On Fri, May 14, 2021 at 5:52 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0001-MyCom.h-fix-build-with-gcc-11.patch  | 31 +++++++++++++++++++
>  recipes-extended/upx/upx_git.bb               |  4 ++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
>
> diff --git a/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
> new file mode 100644
> index 0000000..8b07c77
> --- /dev/null
> +++ b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
> @@ -0,0 +1,31 @@
> +From 8fe8cd22163fe11b791aac15b642d122ea98b9b5 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <martin.jansa@lge.com>
> +Date: Fri, 14 May 2021 02:26:13 -0700
> +Subject: [PATCH] MyCom.h: fix build with gcc-11
> +
> +* fixes:
> +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/LZMAEncoder.h: In member function 'virtual ULONG NCompress::NLZMA::CEncoder::Release()':
> +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/../../../Common/MyCom.h:159:32: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
> +    159 | STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0)  \
> +        |                                ^~
> +
> +Upstream-Status: Submitted [https://github.com/upx/upx-lzma-sdk/pull/5]
> +Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> +---
> + C/Common/MyCom.h | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/C/Common/MyCom.h b/C/Common/MyCom.h
> +index b8dbf38..2e3c54a 100644
> +--- a/C/Common/MyCom.h
> ++++ b/C/Common/MyCom.h
> +@@ -156,8 +156,7 @@ public:
> +
> + #define MY_ADDREF_RELEASE \
> + STDMETHOD_(ULONG, AddRef)() { return ++__m_RefCount; } \
> +-STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0)  \
> +-  return __m_RefCount; delete this; return 0; }
> ++STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0) return __m_RefCount; delete this; return 0; }
> +
> + #define MY_UNKNOWN_IMP_SPEC(i) \
> +   MY_QUERYINTERFACE_BEGIN \
> diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
> index b77e658..96d2e99 100644
> --- a/recipes-extended/upx/upx_git.bb
> +++ b/recipes-extended/upx/upx_git.bb
> @@ -2,7 +2,9 @@ HOMEPAGE = "http://upx.sourceforge.net"
>  SUMMARY = "Ultimate executable compressor."
>
>  SRCREV = "4e1ae22a1a07be5135c68b25ff05058ae8ae48e1"
> -SRC_URI = "gitsm://github.com/upx/upx;branch=devel"
> +SRC_URI = "gitsm://github.com/upx/upx;branch=devel \
> +    file://0001-MyCom.h-fix-build-with-gcc-11.patch;patchdir=src/lzma-sdk \
> +"
>
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
> --
> 2.30.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
