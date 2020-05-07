Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.2053.1588879190134624875
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 May 2020 12:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=arhomrcf;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id r16so6405837edw.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 May 2020 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pLpVYhhHEMeUQWAL+vpfKH8ziRjLLYWg5nPSamIgcuI=;
        b=arhomrcf3XhEVfU4nzEjP0iNhgvlbMxH3CfOvH3TORZe9CRdeXcYanVL0lmvl6TOx5
         3lGB5E/z/3GTifMN2gyTZy7/oTv0PxWmJBsYtHZmcIt7kfe5kqacngCxbYOf/sOOO6hR
         iakZ6xGFDGuzdl6kde0N7X9pyOgKWlvvzXcZ67aG6in2Qx/gWeZ+ss0eZTQQzpYzpapW
         Fc4bjh3NDVZlTx2yQEPFPPa7IQHucntga/hJ8xCNzR/RTZCME69RBaUkDTjTbKXovB0e
         jAIh2PQ8psBvPckRvFLC3q5QHX4NQxY8KS8NzZSgIYkiiWxj7+x7N7o47ehLInrXzc9w
         DjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLpVYhhHEMeUQWAL+vpfKH8ziRjLLYWg5nPSamIgcuI=;
        b=JLehELhx9LFug9KmdbAD6xTDKGMin2GssyG4ct32VxSttBPLTLWX3lAKMWaGrE1JVF
         Ox7DOUOzKqioDvsiroLXq2rMfoKftxAVWhdCYMh9Z9h2kiwikiTfrp8JtBctEMB4FzrX
         Xd0Uq5cC1YiY0PP7jePhNCNRs6evVpF3ZHE+eVkrUm7ax/aXxpxfPi1DDy8bPs9dIN3k
         2jyB70BzMS9tj8U0dJm8FFY/9MR0UUaQ2tirCCIrpTt86LydtsfxF63XBBB75UqIoKL5
         62NCnflcSoTPR/WAXXeH8QSeJxIE5WXdgP0YXb4htlVpzvzfaJX6mZ71KOtRExEyyQJ2
         eK3g==
X-Gm-Message-State: AGi0PubhyP6tXC+lsC/fCy5ZmMHWWAMiuOVjFe4Gez4F9Kqgsq0hNR4+
	7toZh0zuJvT1H2wrhxJ3DWeOSw/RzU0MgWS1VsA=
X-Google-Smtp-Source: APiQypKF1hmr6J5nHPXBcbvruW3rYC3C6cQGCs01agQdoTcPs00JB40r+Ka8nKu9hbchUuv/hawH1Y1dSWhTjygK204=
X-Received: by 2002:aa7:d9d8:: with SMTP id v24mr13108458eds.27.1588879188405;
 Thu, 07 May 2020 12:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200507185751.74583-1-sakib.sajal@windriver.com>
In-Reply-To: <20200507185751.74583-1-sakib.sajal@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 7 May 2020 15:19:37 -0400
Message-ID: <CADkTA4PF91d1qCMfr8WTsDk_P943AUD=MSOy1=hBREreGr5AGQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: uprev v6.1 -> v6.3
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, May 7, 2020 at 2:58 PM <sakib.sajal@windriver.com> wrote:
>
> Changelog:
> https://www.libvirt.org/news.html#v6.3.0
>

Cut and paste the log into the commit message. Links go bad, and/or
the commit messages might be viewed offline.

Also, what tests were run against the update ? We've had trouble with
libvirt in the past, so it at least needs some runtime testing.

bruce

> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc                | 7 +++++--
>  .../libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb}         | 7 +++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb} (96%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index c5b0fbd..bad4391 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -17,8 +17,11 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>
> -SRC_URI[libvirt_python.md5sum] = "2834626b07da6ac4ca1559abfd55c118"
> -SRC_URI[libvirt_python.sha256sum] = "be644f4809c0e1d368e3ac065df3c66a26dcfe61ecb607ee9706e1799f22c35a"
> +SRC_URI[libvirt_python.md5sum] = "4cf898350ee9a47f94986d402c153bdb"
> +SRC_URI[libvirt_python.sha256sum] = "c772421ecc144f098f4ab15db700c62db9b9e6e76b876217edcfd62e9ce02750"
> +SRC_URI[libvirt_python.sha1sum] = "de484d1778b485d130485b5bce54a53f6b69a4dc"
> +SRC_URI[libvirt_python.sha384sum] = "bf1236da1028cf92f38aacbe58aa17d99d5119a16d545d716b0787ffa5abb3c54244b13574447fad454298a49e6765df"
> +SRC_URI[libvirt_python.sha512sum] = "717badd58a7b9fcc7f603a556f10ad571546750d97732ae1ebc82765d970bb2c19e355197cf49195b961ca492b24f91ea0b938ca6b85970bfd2473a781f2716e"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
> similarity index 96%
> rename from recipes-extended/libvirt/libvirt_6.1.0.bb
> rename to recipes-extended/libvirt/libvirt_6.3.0.bb
> index 9aa78b7..bdcc67a 100644
> --- a/recipes-extended/libvirt/libvirt_6.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
> @@ -42,8 +42,11 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://gnutls-helper.py \
>            "
>
> -SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
> -SRC_URI[libvirt.sha256sum] = "167c185be45560e73dd3e14ed375778b555c01455192de2dafc4d0f74fabebc0"
> +SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
> +SRC_URI[libvirt.sha256sum] = "74069438d34082336e99a88146349e21130552b96efc3b7c562f6878127996f5"
> +SRC_URI[libvirt.sha1sum] = "8607721bafccf4b7727cb93fef4c36a23c849ab3"
> +SRC_URI[libvirt.sha384sum] = "773996c338395f12c1319bef0f880787e7ef019710c66076e870e3031e16142c51d89539de2317036e93df5af6165f80"
> +SRC_URI[libvirt.sha512sum] = "29805cd59745c21b7c84b6c5aebe6e791b9bee84a83cfbc5debafe37cd40120f1773d96286434611a5b9d8726d34ee84083f36108f3f5eb74c0bd848c4e34e38"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perlnative
>  USERADD_PACKAGES = "${PN}"
> --
> 2.24.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
