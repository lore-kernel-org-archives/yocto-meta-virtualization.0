Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20992.1794802927247367844
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Nov 2026 20:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iegKsyHI;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so748215137.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Nov 2026 20:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802926; x=1795407726; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWR8hgFKrjnQ4XZpsi6rzd1KHVOk5UPbpeKry4PfjIk=;
        b=iegKsyHI/M+0UttE7J1mHwvDSQZloPsQX3n/wFES1CVWPpJcN7AoT78Kl42pyhv6HR
         v5Lrq5gkj4VL1xki86jpwien+gA81Aqtq/qPY4pENX3dPwOwXYuiEObgXJIIIoBOBxQF
         Qp6ofHy21l1F76NFboLfGURmrjnpSB+veXjbRs+hFuZpqApW+ROCLpY7ywWABtfDt0YG
         FhdSpIJdd+xMlzLIOyM610EKiJhE4aTCdRM9N/0lU+IHJIDXpdwSsXfJQ0FPm8vIX9qG
         66o3c5AxPSWMTPCNI/+Bv9XBfVxTwBhOQuoqtJNr4FzKC1v4qTkyPFO4+Q75HBHvVZbd
         l1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802926; x=1795407726;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWR8hgFKrjnQ4XZpsi6rzd1KHVOk5UPbpeKry4PfjIk=;
        b=QpJJvQfETP9ojpryq8h8Faa7J0+ZkxV+qmMzxZSIQIOdVroc4qrOWClNwpR4q/6Vju
         T352DzDdCnkuF2vpQ5HiVG7WI5cPvvMZTRVpxgNav3ZsABL3nBj50vXqtls96mSJ9889
         SmErZe9cnYmum9WPWTNjng5E4p6bMkM56MRSksiYOOLw0Vie8W6Vl5fHA5HYitB/dabT
         IsMIs6WM0uWSIi3cWZMDh37wMQISvWGYRTS3LAGECkmLyKaJbC2d2+EsJQG95BBaYN98
         AJHj+/JKyLGKnI6Ti1PfQEFm8EexUHQ5lSbd9QFOwqydsLHSc9OfTQAmVhD+T3mqqZqa
         FgTQ==
X-Gm-Message-State: APuU4Z9VFbhwDUKOSUYGp8lO1J8v4Hc1u/b4AndrMYt+gijL0CYuMaeL
	RXEG6cX64TniMWTR0ElKVyIFNeYKQuyM5gpLzbpNIO1K4NgBbg5N/Q1Z
X-Gm-Gg: AYBFou0NQfZMM0ZLa0BVPnjfQV+YQxwKk0GnbqXD0Tca2iUeWyXb6n5P65yD7nsooTQ
	eSsADs9j+9oG+z9P8stKvGZNyrvl/7MZcYKNblzh8ohkqQ05PW+TWQyy9g5YZmOdEG/meVyw87/
	BHsJGccOc5+XZgS7cUVNqjdldGl9ouiZicCMuthtWpYFnGGlr5WrfJze1BOz2CkAKeIhfGT+gxW
	Jts0D7FBM3PVBlVwh9/HxV0G9fk0fKZVMf2TPXEDcFa8PDq1Gn/wXwqHUUOj8BQ73UGzyOiA3jd
	rDxOw3xaS5Xugpi4nFYFxsiN297kfpg/cltPrx5cNDGKDscpQASbA6ThjklYrdd9WSYu2eRRB63
	MwV9su6lbnXAWVjJ+DPoIlgz8+TmpXdNQwxwmCCWu4NVlN+CfgahgdHI8qtzgcDGRnWqrJsiPSN
	1UQmdUQoEAbBJdw0yBq0pXTjStNzQJ+bjidXGiiANFUGovW+3EDKfeEnR/8qKqgVh2+/+bRrfzs
	OmPnkyjtd6fuv3JO6stumF/lsUFLXQBXRWARRi+ctIs5kDdON8Q8oaWmIK+Cx+CHi1EZy2dICzQ
	XejhxDVRmcfW8Ll97APHoPIjjCoKBvNnOzcEhAS08tJANu+rqAjN+yU2ATc7deNfRMzJfuxPf4U
	3lsSkF1a98fNIwqMcGeaFGsYQraU+x9PXsbNf2aBj4a165XI6HA==
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr2266895137.27.1794802925995;
        Sun, 15 Nov 2026 20:22:05 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c1b33e1sm6029689137.1.2026.11.15.20.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:22:05 -0800 (PST)
Message-ID: <6afa84ed.1cefc639.29b32c.8394@mx.google.com>
Date: Sun, 15 Nov 2026 20:22:05 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][blacksail][PATCH] podman: set status of
 several CVEs
In-Reply-To: <20261106212235.441977-1-peter.marko@siemens.com>
References: <20261106212235.441977-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Nov 2026 04:22:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10170

merged

Bruce

On Fri, Nov 06, 2026 at 22:22, Peter Marko wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> These CVEs are showing up in CVE reports as open due to sbom-cve-check
> tooling not being able to make decision.
>
> All statements are based on Debian CVE tracker links/comments.
> The 4th one also additionally by checking commit marked as "unaffected"
> in [1] which updated buildah to 1.27.6 while we already have 1.43.4.
>
> * CVE-2019-10214: no-version-ranges (no unaffected tags in DB)
> * CVE-2022-2738: no-version-ranges (only RedHat package versions in DB)
> * CVE-2022-2739: no-version-ranges (only RedHat package versions in DB)
> * CVE-2025-4953: no-version-ranges (unaffected version is git hash)
>
> [1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2025/4xxx/CVE-20=
25-4953.json
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/p=
odman/podman_git.bb
> index 161d0c6a..707ede83 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -32,9 +32,13 @@ PV =3D "6.2.0-dev"
>  CVE_PRODUCT =3D "podman_project:podman libpod_project:libpod"
>
>  CVE_STATUS[CVE-2019-10152] =3D "fixed-version: fixed since v1.4.0"
> +CVE_STATUS[CVE-2019-10214] =3D "fixed-version: fixed since v3.0.0"
>  CVE_STATUS[CVE-2020-1726] =3D "fixed-version: fixed since v1.8.1"
> +CVE_STATUS[CVE-2022-2738] =3D "not-applicable-platform: RedHat specific is=
sue"
> +CVE_STATUS[CVE-2022-2739] =3D "not-applicable-platform: RedHat specific is=
sue"
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> +CVE_STATUS[CVE-2025-4953] =3D "fixed-version: fixed in used buildah versio=
n"
>
>  PACKAGES =3D+ "${PN}-contrib"
