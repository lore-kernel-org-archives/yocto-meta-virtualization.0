Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.2623.1621653516695383809
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 May 2021 20:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aRLwkvID;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id h16so25418126edr.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 May 2021 20:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cg2o36Z+12QtZ83slpPLkBni7OCzTG0qVm1Vd1xNY5E=;
        b=aRLwkvIDuAQEW+kp+prrnPTApc+m2RPto/VL/5M22BGKnquUdFKDhGei1T3LUNgdSR
         qUQHITlT5M1mwD5aAl3hzzjPHBd8JGZrmCoor6+ol00XvqfjgjPNnTMh6CGfVLo7LxyN
         0gkWE/c91ZHwJacyvP91v2BzhzAvBqA3YmxEjKl9uwfx83Mei3Qn7KGxhgaB1wEOXayW
         G0QH2sWQQe3ZMwRCEiYPTQhsJQZlf/VlUsdgm5VPsp8lPBjCqF2N7HOFfG5vM119xW5H
         zF87/oCRm0JRPK5MZMG1QcCskYsfKbFV2DnQFq0iQOOP8Buzg8IicD+G/T542p1kGehJ
         Hr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cg2o36Z+12QtZ83slpPLkBni7OCzTG0qVm1Vd1xNY5E=;
        b=BpVMRgPoiSxgAx2YiZcvbtdJYosYVuehDgFkuW1lgFDTaEEntfFppVo8EMcJT+DDrq
         wnW7xWc2JrINIVDIoAOSaFLnOTsvbt06kW7LuIdaSujmTOG5xrT0LIiC+qlxu1n+hLVS
         /azL6kSJqEZLXznZ9J2QptLBcz9p4cUgDW/9YvesGKHAYXBHdhKclVN75gOrikNNagdr
         rghrWrwq0Uw7Z+9fFr5jjFcO+KBqZdqXAJJXeG8ftzhFnUbgXGUKKk2YGDU4ZlfgcPsy
         iXzXReYSU5rHeQY2Y7AEnoG6PRzhyGWHJsRqCYEgPHCx7WbJYYgcKaOMb3rCc/7ZDxvK
         mwig==
X-Gm-Message-State: AOAM531tynFs9k/hWUsYkqLP+nwnzcrWMRCTSzD4BSSxms0d8WwtmEmi
	pR/lg+xj6ppKu5t4bubtXJXJsvtQpNxnWdG0dnA=
X-Google-Smtp-Source: ABdhPJyq3PPAxZ5crAFbi5uZ81T06jNNgY33aiIsFpb+Iid/RwWLpHKFQTAkYG5mvYlrYy000b3+G1N6haV5n/ZGJTk=
X-Received: by 2002:a05:6402:5211:: with SMTP id s17mr14630714edd.352.1621653514921;
 Fri, 21 May 2021 20:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210519221332.289403-1-saul.wold@windriver.com>
In-Reply-To: <20210519221332.289403-1-saul.wold@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 21 May 2021 23:18:23 -0400
Message-ID: <CADkTA4Mv3KXsUFGsc6sTBcjEh6gPSG2OgjD4Wwi3ao=YJ6A2bg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] ceph: update to 15.2.12 to address CVEs
To: Saul Wold <Saul.Wold@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, May 19, 2021 at 6:15 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> Updated sha*
>
> Fixes: CVE-2021-3509
> Fixes: CVE-2021-3524
> Fixes: CVE-2021-3531
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  .../ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb}             | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>  rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb} (91%)
>
> diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_15.2.12.bb
> similarity index 91%
> rename from recipes-extended/ceph/ceph_15.2.9.bb
> rename to recipes-extended/ceph/ceph_15.2.12.bb
> index 0d821f0b..9ba72b40 100644
> --- a/recipes-extended/ceph/ceph_15.2.9.bb
> +++ b/recipes-extended/ceph/ceph_15.2.12.bb
> @@ -16,11 +16,10 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-cmake-add-support-for-python3.9.patch \
>  "
>
> -SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
> -SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
> -SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
> -SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
> -SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
> +SRC_URI[sha1sum] = "9c76b298e1e659b9c5501003ac77fb28aab7823d"
> +SRC_URI[sha256sum] = "8710f6700de83765138df8eb4fc7a5e7c66104dd838033e0827a1850f250ac85"
> +SRC_URI[sha384sum] = "2a2f177e5b68f6f5d13b253a8d4daba9e956b4a79a40a4775aee288b60c612fe13b417d6baf77944c32b1181b2136f68"
> +SRC_URI[sha512sum] = "08266a2e9a7ca5a37e03f340873571fd012c630dd898a87241cd97c29760b2bf41fe64c8883e7b08e0f83c26245072cd26e69ecb1db02378d1ec38335ba1cd0f"
>
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
