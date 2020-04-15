Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.22069.1586978950270193413
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 12:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pATrHkpc;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v1so6524355edq.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Apr 2020 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qMxbHL3C96Ov5Fjl0tcNnCTbHzxlBhhqFLOPxEambRU=;
        b=pATrHkpc0eNyhngyI1SMM3M+DTtIJn9+dXXhFAMLk07HCT7ssoVOKpA+XuM6TKsz3j
         pkLre6Jwu+2lUuEFv/98Y5GLkVPvBbcJX3lbK59WeaPdYO07x0SfdBoE/tmwVWZhS2Bw
         PydE+A2hzYK83lhaT+q046kE8f/6VAD3uw48WafnvPCdxILvyHxOP1N80t8mx5xQiDUb
         XLo2SlcZ4s1zcAOocKCGAYof6LRoF6tHPDo86LI3QTAnEVXEIrWfDQJQt4eVO2a6Q3Ct
         IRn14t6wh1D8OHIlXqwuHu1LmEh+fv0yJSJZlhBCd0hqwzgtOunG++BioyQwZ+Exd2nI
         BMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMxbHL3C96Ov5Fjl0tcNnCTbHzxlBhhqFLOPxEambRU=;
        b=C7RmSCL/TApTvAAHJudFBd8lUab+yemIghpk3fNLVDYVEMyjZjZSzNsbGUMjtEbkDo
         e1XdO3qee0+0C+KEx3zFdW7uUwVvLRvRnuzLuGcMivVsZ5yY1nsEriHel3lgIdL4/SE/
         O2RJ2lyxgkNmKNeSqT3hITwcbJLBDihRW3UQX2wNNi2sNLLIAP42S0YkjBro3AwA2pru
         zb9oSa5xSpCBcMmvNvNyhouV/2WDrrWonez+KwlWkRMlihinohTVLrIDfHkl56VSm2Ha
         4vps9LR2YutErIUMBr5HfX7Uoi6UlZOLL58QDmCWg2+n/Ppc5tstpcjWSgTg00wIAXSt
         iRNw==
X-Gm-Message-State: AGi0Pua9EWr8IKi2vrl9NIFFWQpgQUU7VDlbWj7wImE4UyDx0rINFTP4
	n5zoy4zY6qbqhxiOhjON0x88BHLyYx9LNKzfcSc=
X-Google-Smtp-Source: APiQypIwyxrBJYWnKe+RpkJ14ul+E9tIL+7sG6OcIaAXBWCgPI8/bTj+i9v7wfFvKG/wXp1F69aeExl/j64GLhCLuk0=
X-Received: by 2002:a05:6402:b14:: with SMTP id bm20mr25064294edb.365.1586978948788;
 Wed, 15 Apr 2020 12:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200415165211.8405-1-sakib.sajal@windriver.com>
In-Reply-To: <20200415165211.8405-1-sakib.sajal@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 15 Apr 2020 15:28:57 -0400
Message-ID: <CADkTA4OqCD01NPQzx8B=fPtbJHLLKpTH5cXd43Jgjx0gOejTMg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nagios-nrpe: uprev v3.2.1 => v4.0.2
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Apr 15, 2020 at 12:52 PM <sakib.sajal@windriver.com> wrote:
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../{nagios-nrpe_3.2.1.bb => nagios-nrpe_4.0.2.bb}       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename recipes-extended/nagios/{nagios-nrpe_3.2.1.bb => nagios-nrpe_4.0.2.bb} (85%)
>
> diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> similarity index 85%
> rename from recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> rename to recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> index 9e1f02c..c8875fc 100644
> --- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> +++ b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> @@ -1,7 +1,7 @@
>  require nagios-common.inc
>
>  DESCRIPTION = "Nagios Remote Plugin Executor"
> -HOMEPAGE = "http://exchange.nagios.org"
> +HOMEPAGE = "http://www.nagios.com"
>  SECTION = "console/network"
>  PRIORITY = "optional"
>  LICENSE = "GPLv2"
> @@ -15,8 +15,11 @@ SRC_URI = "https://github.com/NagiosEnterprises/nrpe/releases/download/${SRCNAME
>             file://nagios-nrpe.service \
>  "
>
> -SRC_URI[md5sum] = "8997e195fea93cdceb8c7ed8ac1d43bc"
> -SRC_URI[sha256sum] = "8ad2d1846ab9011fdd2942b8fc0c99dfad9a97e57f4a3e6e394a4ead99c0f1f0"
> +SRC_URI[md5sum] = "37b9e23b3e8d75308f8b31f3b61ee8a4"
> +SRC_URI[sha256sum] = "c5d9d7023eaa49e6fe8cf95c6d101731f07972cf0f8818fa130c171bc9eabd55"
> +SRC_URI[sha1sum] = "2150e274fc7f24905c63b8a996ed7218e2967478"
> +SRC_URI[sha384sum] = "0ece79fb312c8d1ee0e6bde1be499f8090a5a86cf90b0b8dcbebb95c5f8f70b2cf9ac0a4064f726bee091c4147b61d82"
> +SRC_URI[sha512sum] = "4d7cf6abc974bc79df54afc42644418e3f086a279c8c17d0fd104f19e3c21c0f3dae4fb4268dd134446ff9fe505159b0446372c5cac71cfe03a97479ed41c09b"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.24.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
