Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D131DFF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:43:03 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11405.1777376575756376892
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fh1BC0Fo;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d880e6fbbso124563881cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376575; x=1777981375; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGbJSpxlf/uCavKpKnAkUGb6SsKtHLzPpXhgNbxiV3Y=;
        b=fh1BC0FogwPpURgwCjVA6JiWFFwlzff/PhruAACX0c7gLeDIgy2PD6AOUWK9dY9nVS
         5zkFZ5PkegRR96FtEFmgPKx6i4NzxI7MEqCnFG6vlxWrSpc6eAzpWQC2lTYtVTXCOosF
         exG5MvotFYgTk+1knkmW+pvuWXhFa43ZmK9AIY8kxsyZAuL5EsmRgFST6RS4WCWPaMpS
         5lidGWs4OmBJtac7piJZbAz6ne4QhAGV3m8bAXCGYQwnlYTB3+aexnNaexm7QQAojSnu
         CbWMoguz54nCQCVbg5G806xOmuacSbujV2GLLN3g0v//ccWuHimXtiZJxJK0tHKk3ARy
         cU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376575; x=1777981375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGbJSpxlf/uCavKpKnAkUGb6SsKtHLzPpXhgNbxiV3Y=;
        b=X3qcnfwHnypEk6dtGeyr2LdvNXJTNf2aETRqmKXtSo73W/HUFDgJzYabhkrOAKzOUo
         qNZn2D/h060RVlyaLYCqCo7fr8oqHJUV5RchGEn79mFqAHFaLuZG7tB3LiGW1gB5RhN1
         Wb+SgtPfICBpJV53Ae2vWqMLoAqneVER+vZXfVSbPYwLQ+xTGQGUmMM8oL4dIc6qQM/x
         hCU080sYY0lXaA01QJ851BaB0InjEkqp6waQUzjwcc+UV4Pbi2kOi/1ythOJmu6kkFcG
         ciEvbOn9bWhltGfG8485IMseY7iqQ2ZCU8xQhbJUsICGse74EIhRlGXS47wY8gb+vXlO
         vzvA==
X-Gm-Message-State: AOJu0YxSbM/ig2LcQdt/HLepefp4fcCcxARVvVMKCZFdqU5/KrI/cUN9
	cNszvoJPTSEUEvYVyhFJaJQOrhkF2haUbtc4ifyopJmsrZGb8smLc1WuS1Phb/8Tzm9IGg==
X-Gm-Gg: AeBDievYN1zKgT6XMVq3+8PNywW0Pn5BYUTQOYbGpPQVw3ZOFUX9BUq6iQzrCazsOdB
	eEw+6NkS73spywJyoC2L8WvpLfMy/GkkWod7iQrASee/UuXfmKxSgPPEDogsUlL75VZ7P56kkHb
	umN3UIVirvYgfIAKNd43v5067YuOfS3wXMnU3pjOXyFkoprUbD8c7TPiwAGKzH72LuIIHrz25Sy
	cBdrebO4uWiG0fr93AYvf1ZglmJ0ACbbF/uUwhP4X85mJy94IZj81EjIbAFl9r7L26NZ1uWfYl1
	MGoIsYIfA13N8QLpKMI+IRtEY+BPk/TyVi7jDiiBhIoP3F5emlGahsKqxjcwTwBXRaAnSnaU0rj
	7euXdH8kvb7fTS1gx6F19ov266SFTLqkBpEGA21g7CkaIuqrR63ZDn9f0bVErap2Attk7VMIYBQ
	wcHQWfEGm4T1WnYoxxGa4x9ea4t71TH0clxttdqAKid+NMTNsSRjIsIjJDoNcbQIkGtWtcqKprn
	Kh/cb3N6OiRIMPk1enmuv3Ar65WPXGbMxaG//DH+E2IuH8=
X-Received: by 2002:ac8:7f03:0:b0:50d:815e:7977 with SMTP id d75a77b69052e-5100da6e776mr31441561cf.34.1777376574631;
        Tue, 28 Apr 2026 04:42:54 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100db401e0sm15191531cf.20.2026.04.28.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:42:53 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:42:51 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] ca-certificates: Ensure changes
 only apply with the selected DISTRO_FEATURES
Message-ID: <afCdOwt4h9p5BwCR@gmail.com>
References: <20260424083855.3214724-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424083855.3214724-1-richard.purdie@linuxfoundation.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:43:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9763

I fixed the typo on the shortlog and pushed this to master
this morning.

Let me know if there are any other lurking issues.

Bruce

In message: [meta-virtualization] [PATCH] ca-certificates: Ensure changes only apply with the selected DISTRO_FEATURES
on 24/04/2026 Richard Purdie via lists.yoctoproject.org wrote:

> This fixes yocto-check-layer failures:
> 
>  ca-certificates:do_recipe_qa: 4d7b7adb7436eeb5714c354f3c590e7e69294ea044452343d24e64c92d5c040f -> c1676ce811efe714731b666ccd683586477f7a1b52ad7597148bd9d709291220
>       List of dependencies for variable SRC_URI changed from 'frozenset({'PV', 'SRC_URI[sha256sum]', 'BPN'})' to 'frozenset({'SRC_URI[le-r11.sha256sum]', 'BPN', 'SRC_URI[le-e8.sha256sum]', 'PV', 'SRC_URI[sha256sum]'})'
>       Variable SRC_URI value changed:
>       @@ -1 +1,2 @@
>       -${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
>       +${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch             ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',     'https://letsencrypt.org/certs/2024/e8.pem;name=le-e8;unpack=0      https://letsencrypt.org/certs/2024/r11.pem;name=le-r11;unpack=0',     '', d)}
>       +DISTRO_FEATURES{virtualization} = Unset
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../ca-certificates_%.bbappend                | 39 +------------------
>  .../ca-certificates_virtualization.inc        | 38 ++++++++++++++++++
>  2 files changed, 39 insertions(+), 38 deletions(-)
>  create mode 100644 recipes-support/ca-certificates/ca-certificates_virtualization.inc
> 
> diff --git a/recipes-support/ca-certificates/ca-certificates_%.bbappend b/recipes-support/ca-certificates/ca-certificates_%.bbappend
> index e659f1ed..617caccb 100644
> --- a/recipes-support/ca-certificates/ca-certificates_%.bbappend
> +++ b/recipes-support/ca-certificates/ca-certificates_%.bbappend
> @@ -1,38 +1 @@
> -# Install Let's Encrypt intermediate certificates (E8/ECDSA, R11/RSA).
> -#
> -# Only active when 'virtualization' is in DISTRO_FEATURES.
> -#
> -# Some container registries (e.g., registry.yocto.io) don't send the
> -# full certificate chain. Go's TLS library (used by Docker, skopeo,
> -# podman) cannot verify the server certificate without the intermediate,
> -# even though the root CAs (ISRG Root X1/X2) are present.
> -#
> -# These intermediates are fetched at build time and installed alongside
> -# the standard CA certificates. update-ca-certificates (run in
> -# pkg_postinst) incorporates them into the system CA bundle.
> -#
> -# Source: https://letsencrypt.org/certificates/
> -
> -SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', \
> -    'https://letsencrypt.org/certs/2024/e8.pem;name=le-e8;unpack=0 \
> -     https://letsencrypt.org/certs/2024/r11.pem;name=le-r11;unpack=0', \
> -    '', d)}"
> -SRC_URI[le-e8.sha256sum] = "f2c0dde62e2c90e6332fa55af79ed1a0c41329ad03ecf812bd89817a2fc340a9"
> -SRC_URI[le-r11.sha256sum] = "6c06a45850f93aa6e31f9388f956379d8b4fb7ffca5211b9bab4ad159bdfb7b9"
> -
> -do_install:append () {
> -    for pem in ${UNPACKDIR}/e8.pem ${UNPACKDIR}/r11.pem; do
> -        if [ -f "$pem" ]; then
> -            install -d ${D}${datadir}/ca-certificates/letsencrypt
> -            # ca-certificates expects .crt extension
> -            base=$(basename "$pem" .pem)
> -            install -m 0644 "$pem" ${D}${datadir}/ca-certificates/letsencrypt/lets-encrypt-${base}.crt
> -        fi
> -    done
> -
> -    # Add to ca-certificates.conf so update-ca-certificates includes them
> -    for crt in ${D}${datadir}/ca-certificates/letsencrypt/*.crt; do
> -        [ -f "$crt" ] || continue
> -        echo "letsencrypt/$(basename $crt)" >> ${D}${sysconfdir}/ca-certificates.conf
> -    done
> -}
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-support/ca-certificates/ca-certificates_virtualization.inc b/recipes-support/ca-certificates/ca-certificates_virtualization.inc
> new file mode 100644
> index 00000000..e659f1ed
> --- /dev/null
> +++ b/recipes-support/ca-certificates/ca-certificates_virtualization.inc
> @@ -0,0 +1,38 @@
> +# Install Let's Encrypt intermediate certificates (E8/ECDSA, R11/RSA).
> +#
> +# Only active when 'virtualization' is in DISTRO_FEATURES.
> +#
> +# Some container registries (e.g., registry.yocto.io) don't send the
> +# full certificate chain. Go's TLS library (used by Docker, skopeo,
> +# podman) cannot verify the server certificate without the intermediate,
> +# even though the root CAs (ISRG Root X1/X2) are present.
> +#
> +# These intermediates are fetched at build time and installed alongside
> +# the standard CA certificates. update-ca-certificates (run in
> +# pkg_postinst) incorporates them into the system CA bundle.
> +#
> +# Source: https://letsencrypt.org/certificates/
> +
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', \
> +    'https://letsencrypt.org/certs/2024/e8.pem;name=le-e8;unpack=0 \
> +     https://letsencrypt.org/certs/2024/r11.pem;name=le-r11;unpack=0', \
> +    '', d)}"
> +SRC_URI[le-e8.sha256sum] = "f2c0dde62e2c90e6332fa55af79ed1a0c41329ad03ecf812bd89817a2fc340a9"
> +SRC_URI[le-r11.sha256sum] = "6c06a45850f93aa6e31f9388f956379d8b4fb7ffca5211b9bab4ad159bdfb7b9"
> +
> +do_install:append () {
> +    for pem in ${UNPACKDIR}/e8.pem ${UNPACKDIR}/r11.pem; do
> +        if [ -f "$pem" ]; then
> +            install -d ${D}${datadir}/ca-certificates/letsencrypt
> +            # ca-certificates expects .crt extension
> +            base=$(basename "$pem" .pem)
> +            install -m 0644 "$pem" ${D}${datadir}/ca-certificates/letsencrypt/lets-encrypt-${base}.crt
> +        fi
> +    done
> +
> +    # Add to ca-certificates.conf so update-ca-certificates includes them
> +    for crt in ${D}${datadir}/ca-certificates/letsencrypt/*.crt; do
> +        [ -f "$crt" ] || continue
> +        echo "letsencrypt/$(basename $crt)" >> ${D}${sysconfdir}/ca-certificates.conf
> +    done
> +}

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9739): https://lists.yoctoproject.org/g/meta-virtualization/message/9739
> Mute This Topic: https://lists.yoctoproject.org/mt/118984634/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


