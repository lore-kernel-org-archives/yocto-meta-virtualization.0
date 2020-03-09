Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.68.1583774719477032880
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 10:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rTM6e6JN;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id w1so10844177ljh.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Mar 2020 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=glzpwdmgeW2c4esQcxXpeqUqoVdn274gNiaQRbv/JjA=;
        b=rTM6e6JNzDIl/iYRsALss1WgUHkDwSL3zfKhHllkRiQUeUqzNL3wgbonUo7iCMeH86
         7YQpj5bceP1KQ0sBbf+D9xDrOa4nuHFtVzYyoLia8+Jt/GoI0LkIMJtzWwfjhS8LQOKX
         YGsSbbcvrS3zH0Pf5H64t0myEYqeCfSmkMciorFThJrgFjbzwGCXNbbUjIKxINUI7Ac9
         Kc3mctRpU3V60UYxOFPv6geIrbchKs4rdXj1nD2Ai37pM4IHjuYjOHQ86B+kOEylLNBk
         4/QCnEpuMcb4AJtOjrsSE8vQ76+mxAwIGmbefeQsHmR7kR11BxF7X9SDAuKa7EyxsBY7
         aU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=glzpwdmgeW2c4esQcxXpeqUqoVdn274gNiaQRbv/JjA=;
        b=c+aE4Iy4pxmhEKENHULkeHAXUPoF3tC81Y/s7Ndt+cX8o2UERIUDfkA808nmLlJnaY
         BvAnEFe6kCt5EVWLLBWLAXnXDkowxX5QQxPaNv1xP/h4/Jwdrz/SS7ncimuTt8ajhwA3
         4N0VD0VLpCVZLnffMNFadz1DlQNrACdyqMUthXXb4GUDj1plwu65rIq9b7K/G8BjxvmV
         TSjH92LX20fFX8a5dCwaQlMaOLJinBiqOiULXXkb8vEgrxjllH2vKmcFrPPRbNBZl7g/
         VKfXhUOSAHibgi5eLK0dYPO2qVHvoYOZNVxWEPTcLh+oSkB/QyCoVRpkrbI7cEAH+XRV
         yiCA==
X-Gm-Message-State: ANhLgQ3UKPcPu3w6eCJQmVSVxtJzCXqviDoZznCTU8z+e4+tKv0UleDq
	4umS2elBmVyYrXXj6S3h5rtXEOZ/eLw1GFVh/4I=
X-Google-Smtp-Source: ADFU+vtngJ9SW5OXHzLryKaWcxcvoBYSaKP7yV1UELIxfbD5RDPDLGWX14D1MQZ4fb7S4X1n12dmDFn3CT736Uf5AyU=
X-Received: by 2002:a2e:5ce:: with SMTP id 197mr1694781ljf.234.1583774717633;
 Mon, 09 Mar 2020 10:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200303141036.5833-1-Martin.Jansa@gmail.com> <20200303141036.5833-2-Martin.Jansa@gmail.com>
In-Reply-To: <20200303141036.5833-2-Martin.Jansa@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 9 Mar 2020 10:25:06 -0700
Message-ID: <CACMJ4GbfD94zh67k-riSYZmRzBbkTVMo1C6SCRYAKVTr6WRZaQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] xen-python2: add the same COMPATIBLE_HOST restriction as xen-tools
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 3, 2020 at 6:10 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/xen/xen-python2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-extended/xen/xen-python2.bb b/recipes-extended/xen/xen-python2.bb
> index 08d8e92..ad3c1fd 100644
> --- a/recipes-extended/xen/xen-python2.bb
> +++ b/recipes-extended/xen/xen-python2.bb
> @@ -6,6 +6,9 @@ SECTION = "console/tools"
>
>  SRCREV ?= "a5fcafbfbee55261853fba07149c1c795f2baf58"
>
> +# The same restriction as xen-tools.inc, because of the dependency on xen-tools-xentrace from xen-tools-xentrace-format
> +COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> +
>  XEN_REL ?= "4.12"
>  XEN_BRANCH ?= "stable-4.12"
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher

> --
> 2.20.1
>
> 
