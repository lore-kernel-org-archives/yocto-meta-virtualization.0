Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E868F34C54
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:06:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.272650.1776089196557895189
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 07:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rq2eHMxB;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8d68f702851so724969285a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776089195; x=1776693995; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QueaVnLkFof53g049/SNYtc8cDN7S2n9xC7EEOrkgiA=;
        b=Rq2eHMxBzBvhjNbvXVzX5Ua5WAq4jediSTS2MtyNQJ9KdLK8zBQeXE9Wz3JAUfmIfH
         CWDsCa5+PnTfGnNKVqTTyuJuBCff9FcPI3O2gyqA19nim7ZtHeHK7XP1GDqVrQGNDPNg
         dVal5EMJXb7mDHNYV1jPQssNSsxZn+Tj8A5wl/xXOo+ffKH7WSDl9aNubkwgqH+IUZk1
         13oQm3yvB30ELqfAwvWUzCpKYc7i9rPaE95FESvxRHHp/uz5sLCLA7xZ/sfREzioANFb
         /ozTLi07aSRetsGuaVp7xOByMasW9h7w5sIB1o+nVt/RAT0pzm3fCvn0r2PRmjmxywd7
         71Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089195; x=1776693995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QueaVnLkFof53g049/SNYtc8cDN7S2n9xC7EEOrkgiA=;
        b=NGomglfROp7mr34guP9UqdcihSHUFWh0tDTUtYlVCE2denEUHHs7/HswKJvZwzpN+U
         YkPsoClfhP/5joKjKIKZ8JPjKLB0DZTcrzq3NwETWCwZDqanngbmF6QH2xXXHi2P8NT8
         NkKyNxPgHRllCkxGmTwnm6MN/3CFRQlcGFt03rMRimQmyvNXLRlfz+5z3V2MO6uJrarF
         JZLIU5T8aUt0wPyt0Ky6HpYjOMIZ6oBxhNdEmukWLe1dWui2WXch3TL6+4QgjzUkq9El
         dq7WkI43aI/l0qoy77s93H5V8PTmkjXqWHkWJ+MjsNS1+KdGHzPSt9TuGtRtzWS67BeN
         OLYg==
X-Gm-Message-State: AOJu0Yw0UbzbUxDjCshLiV937YL5Imi9euOeqIIdCey01Vl6bR2bzTGl
	FWjnHbxze8VmqGgTNy91boZxyVArbEkh+wjUkBB7ypdwjdILruF71DV3ju8YrQ==
X-Gm-Gg: AeBDievBKNBIONyrGLx/pXpJFDI/qk7i8XMFC9b0KKKBVp5YA9NKbz7Q28+zCIHOP1K
	3OdpqCt0MXlPQTW6eQqSpwr2JN85dlT1nBB2uO1klw52qD33S5IPfEcN42P3ScwJKvi8Myw0Csy
	ea9Y2ypIpYHaQqRuFSdNUry+NX3Eq2WIgmtByxWr2eMO1EfsuaJ2ijgbHs0W2lcvHVge20cNOru
	/119LKoTDH3AxdVp4N/A1fUrBgh/11wYT2dbxYR5EAiJCKYic/fCFTJ+yqLBuifYRoBoVfUo55g
	8oSSRiCj/d7TUUATB2vLjnk7HL/U/6JlSKasBTfD8QEuuAJ9NyWBEcKDqS43lqvhqzRunO8qzhn
	Fxe++CGn74PM5ipDpLUrGoQCdfVwI5Dm6WicrHE+bykFJnAAZ80a9VrxyDM6DXi4mfJ/oAgUexU
	xj1ytiJCwaX1Soyw3CbcE3f36nVN9XQFDc9Tum0ssYL+LfXc3oeoSWHWC5vXxSFLAygzukaZusF
	VZES9Xl7BKAjrxRmS3Cj1KmFUPeTH5CskmK
X-Received: by 2002:a05:620a:4146:b0:8d6:2958:ec16 with SMTP id af79cd13be357-8ddd0592074mr1963746685a.60.1776089195352;
        Mon, 13 Apr 2026 07:06:35 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb915b46bsm877667685a.33.2026.04.13.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:31 -0700 (PDT)
Date: Mon, 13 Apr 2026 14:06:29 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tanguy.raufflet@savoirfairelinux.com
Cc: meta-virtualization@lists.yoctoproject.org,
	paul.leguendekerneizon@savoirfairelinux.com
Subject: Re: [meta-virtualization][PATCH] cockpit-machines: remove autotools
 inheritance
Message-ID: <adz4ZXvb7fIwcekj@gmail.com>
References: <20260413114700.74906-1-tanguy.raufflet@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413114700.74906-1-tanguy.raufflet@savoirfairelinux.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 14:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9696

I had these recipes skipped in my upgrade paths, since I didn't have
meta-webserver in bblayers.

I've confirmed the breakage and merged both patches to master.

Bruce

In message: [meta-virtualization][PATCH] cockpit-machines: remove autotools inheritance
on 13/04/2026 Tanguy Raufflet via lists.yoctoproject.org wrote:

> The commit [1] from openembedded-core, removes the possibility to use
> autotools bbclass when the configure script is missing. Because the
> cockpit-machines release tarball always ships pre-built assets in dist/,
> there is no need to use autotools to build the package.
> 
> This commit fixes the following build error:
>     ERROR: cockpit-machines-346-r0 do_configure: no configure script
>     found at ./configure
> 
> [1]: autotools: require that a configure script exists
>     SHA: 6d327a39befae44a88a812bdf4acde800dcee57b
> 
> Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
> ---
>  .../cockpit-machines/cockpit-machines_346.bb   | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-extended/cockpit-machines/cockpit-machines_346.bb b/recipes-extended/cockpit-machines/cockpit-machines_346.bb
> index 8aaac4c5..d23c39b2 100644
> --- a/recipes-extended/cockpit-machines/cockpit-machines_346.bb
> +++ b/recipes-extended/cockpit-machines/cockpit-machines_346.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "c9d80357da2bf3ecda9698f0dc6fcb46675b3b76da9150a22178071fe9
>  
>  S = "${UNPACKDIR}/${PN}"
>  
> -inherit autotools-brokensep features_check gettext
> +inherit features_check
>  
>  # systemd, which cockpit is dependent, is not compatible with musl lib
>  COMPATIBLE_HOST:libc-musl = "null"
> @@ -24,10 +24,20 @@ RDEPENDS:${PN} += "cockpit libvirt-dbus pciutils virt-manager-install"
>  
>  REQUIRED_DISTRO_FEATURES = "systemd pam"
>  
> -# Default installation path of cockpit-machines is /usr/local/
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install() {
> +    install -d ${D}${datadir}/cockpit/machines
> +    cp -r ${S}/dist/* ${D}${datadir}/cockpit/machines/
> +
> +    install -d ${D}${datadir}/metainfo
> +    install -m 0644 ${S}/org.cockpit_project.machines.metainfo.xml ${D}${datadir}/metainfo/
> +}
> +
>  FILES:${PN} = "\
> -    ${prefix}/local/ \
> -    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xml \
> +    ${datadir}/cockpit/machines/ \
> +    ${datadir}/metainfo/org.cockpit_project.machines.metainfo.xml \
>  "
>  
>  SKIP_RECIPE[cockpit-machines] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on meta-webserver which is not included', d)}"
> -- 
> 2.53.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9694): https://lists.yoctoproject.org/g/meta-virtualization/message/9694
> Mute This Topic: https://lists.yoctoproject.org/mt/118802978/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


