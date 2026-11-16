Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21403.1794802926197665621
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Nov 2026 20:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I4hLY3Fm;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ea16d8072so31918876d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Nov 2026 20:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802925; x=1795407725; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bA9ZYOhAp2Uc83uEC0uJxeNcv6somjEWZyswWttZndU=;
        b=I4hLY3Fm4t35Obo5tYD7xl9ZQ4R4jf6nZypLSLpuPeuR/uxvTyip5+H9dZgR8tNCr7
         9TlfNeePJlfnbl6gR7Oe6hZbaTntahAF3iUyTfojmu5uje6mJglrirXcorJGnHSwg8sM
         KaojlGLG2cgLMVPuBsczugPXiVX5Jr0qXQqXtsDeRyP0VZAwuKR9aENDRU9x+NNaUslQ
         z669lW2x/cumKbNg6dNC44sbMcbcbn1qZWrdqt508Z96cHwhsJqAGsUzDgatqJQarPCX
         +L7VHBmcaMCpBVfiRvatQb9NoM3gGmwFFY/VkM9a41P2Vj4orcldklb5+N45JD2O3P3L
         ZnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802925; x=1795407725;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bA9ZYOhAp2Uc83uEC0uJxeNcv6somjEWZyswWttZndU=;
        b=n+hc6W2pTk9PKG26ExDUh6k24d7zgBktKna0/VcCHag64Ka0fHiCO68HVJmDwEsjEL
         +K0iHZB8oH6kxUfFtNEGXsVJ4CZiSqFRhzEDN0kAuIvC14kbvMLhGaLrjE0nC90w4zpk
         TUU9jVrHKp6vKSKiw+nT+lJUkxm6tz4chorRzNycNRudwCDAFlzmh9FME2cWdDXlVyL0
         vRiQntt4L66ZQhh2KtvsgG21+wDHN9j6aO8NVLDHMvkAgL1wEDr23RQ9CPd6kgfnK08K
         f0tTSG9CV56hZcAE8ETEJVQmCzvpsghF6VyYZH2KCIUfZqYet5VYWDoRMGLDWdOBjhNa
         QDMA==
X-Gm-Message-State: APuU4Z94/1x9K0vlopMW/8Rv2hxkMWzH8Ovk0G5E2/saLJ72mfHUjV1R
	rwK1RC5h4aYfMyMehMyb/hehcKeM835XqBUsSKkWZH6k/k4g43j0n1z1
X-Gm-Gg: AYBFou1kuZmgqPQPl6nmlKvjo/ZB2F12G//jp01axJQzwIhR5CeeVu8CM9cAtuU78y8
	X6oO3eb1A5lnPS11atAdYzBJX8fq2xpyj1b2mXd0e3ghBDoGNEEdKtgX6OSnUqdgSuv+uxpJXTZ
	8EjqopoOaCXTTqnNBayzy34pirGimbyq2MLVcJLE+rhOiQVnocjNHiLoaKuoVK6lv5jn1s22Olh
	do5XSrFLBP0UFghJzeQzW+ySLy/ljBM94sm12lYt+H0IRoGEAbfY9UVvE4wrehUGPK3TFJIo37O
	40/Bh++wXz1gd5qfj6KT+SR/wLGI3B570nZ3t/QooMbDKuRn6MZmVY6Q7c4H77gdYWlb/o+3zDC
	UDvZpDLaJc9K0cbAgpYd/TIav1FENfopqrhi/OjuGu/SaosO1K5ZsD1kYiQSwMeOxo/IrlqZ4a8
	1CS7H7NDDPZ66OgA+ZSo6XznxNdVyu69KoIj1ZsaqX8CYM5LPLKS9GUpkXTaH5dxl+IwUoiKYAr
	q/JOXSYz2Erd3PezVxMSYN+0aY5QVOL4nKJoUNzXELh8Nr0wmLC8vtKoGrp5KxJyPj4BPqRiSTG
	fuRmRXq9OX0lUI+8f+qqUvR/xeL7AT8kzJPuT46KbAVkwo+VCgz58oMsKyHL9u8UR4vq9LsAgJm
	UZk2uXCFeJm4tNteYPpPTjvTDi3t192/HrXRCMHIG6x9uxZfxXQ==
X-Received: by 2002:a05:6214:411c:b0:91e:8d1a:a198 with SMTP id 6a1803df08f44-91f241ea1dfmr151754356d6.49.1794802924902;
        Sun, 15 Nov 2026 20:22:04 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm76912616d6.44.2026.11.15.20.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:22:04 -0800 (PST)
Message-ID: <6afa84ec.4ac1fc02.4a2c6.9391@mx.google.com>
Date: Sun, 15 Nov 2026 20:22:04 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH] podman: set status of several CVEs
In-Reply-To: <20261106212218.441914-1-peter.marko@siemens.com>
References: <20261106212218.441914-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Nov 2026 04:22:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10169

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
> index 0fbd4cfd..0728a816 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -31,9 +31,13 @@ GO_IMPORT =3D "import"
>  PV =3D "5.8.3-dev"
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
