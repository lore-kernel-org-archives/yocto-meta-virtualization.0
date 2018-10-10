Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7993E00B92; Tue,  9 Oct 2018 20:21:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 575CDE0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 20:21:01 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id v6-v6so3473586ljc.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Oct 2018 20:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i1BofiQ1fyOyUAVuYrZRJ3pjC/3xunPaH/sMJFUUHdA=;
	b=HeZAs5uDs72PdrlA0m7IKe3iZZj+XFgAgoSLA4mULAvNgDKCpZJOL4RRgpsMYR7527
	o5pVHG7myQWPfAcwCON50d65SvCUxYHhBm79ry9FZGNc71l2+MkwA1vw/ZvyiX3bXx4t
	UBPT/sKLjdxsd+a82kt+Ki0JPhGpL1jpyQokPtZK3AOPjQWUV2wnM8RF8I5bg0ZUw87c
	dV671SWR5zfkxWQuo9jT137yo/H3QM5+hpdmqrO2BKX3T/J4yDApk2yVzOr9SMEBYV8k
	DAop+gWwItx93DhLPhHe9/Ykx6nbge09u8SgDVjU+QY+XNxwPuWTbmrpjov87SEFgOTX
	pONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i1BofiQ1fyOyUAVuYrZRJ3pjC/3xunPaH/sMJFUUHdA=;
	b=Y+7MMBxFUQNum7JhkaBdr6ZN5ZBqhGejCC+tLSZilpRZWm62x4osfqe2zTu0NqErcB
	SV29HjJIBqQ2Zzejo896L07t/RfLf+/vxkFZoTiGR4uUPIacd27henrdX5Ohj+yccrsw
	tdNsYlJLJe3HeBJ5GfrpuSDvwDtnmHW50xJK2DAGuHE6ThYZSD488XhdSUl6tGUEmpVK
	tq3u8HZMDvD57wpKCAPeiCkI4juMaqwdZ+DoBhVAXV3jPnZcp+uaSV9n0PeSblNe18mY
	SanVe4PbPrQnTKOsV4HzEekblf7Rbr7cYfJYPPHT/7ypVuOkv5E04tnMSuBvVOJr225t
	QkpA==
X-Gm-Message-State: ABuFfohU1k4k5j3xJBwfFTbGXaxqIvwKPld1emAKjG3b+7VF6ueSsJZw
	8e/4kYr+GQ1jhUUpuk8K9Nl3P1GqaybfUVl2MpojyvvD
X-Google-Smtp-Source: ACcGV609iL+azFz4NcU67yZEWbEo+Ib5iLbz/+o+iPzDlcK9kOGe3Kq6YyQZzMirK3xW998XPn27R/jvo7IczFxfF4c=
X-Received: by 2002:a2e:501c:: with SMTP id
	e28-v6mr19328728ljb.45.1539141660136; 
	Tue, 09 Oct 2018 20:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
	<f5dde7bb-cce9-1dfd-8c71-7a1b5fb4ed59@kernel.org>
In-Reply-To: <f5dde7bb-cce9-1dfd-8c71-7a1b5fb4ed59@kernel.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Oct 2018 23:20:48 -0400
Message-ID: <CADkTA4NwvgW8w+2QfS5+czzH5dSg56nmJeY_fo+CFEc6fM5H6w@mail.gmail.com>
To: okaya@kernel.org
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [sumo] [PATCH v1] docker: CVE-2018-10892
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2018 03:21:02 -0000
Content-Type: text/plain; charset="UTF-8"

Your patch is coming through corrupted:

----
Applying: docker: CVE-2018-10892
/home/bruce/poky/meta-virtualization/.git/rebase-apply/patch:44:
trailing whitespace.
Upstream-Status: Backport
fatal: corrupt patch at line 45
Patch failed at 0001 docker: CVE-2018-10892
The copy of the patch that failed is found in:
   /home/bruce/poky/meta-virtualization/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
----

Check your MTA and how you are sending the patch to the list.

Bruce

On Fri, Oct 5, 2018 at 12:33 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> * CVE-2018-10892
> Docker does not block /proc/acpi pathnames. The flaw allows an attacker to
> modify host's hardware like enabling/disabling Bluetooth or turning up/down
> keyboard brightness.
>
> Affects < 18.03.01
>
> CVE: CVE-2018-10892
> Ref: https://access.redhat.com/security/cve/cve-2018-10892
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   recipes-containers/docker/docker_git.bb       |  2 ++
>   .../docker/files/CVE-2018-10892.patch         | 34 +++++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 recipes-containers/docker/files/CVE-2018-10892.patch
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index e055a4f..7c7bd4c 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -30,6 +30,8 @@ SRC_URI = "\
>           file://0001-libnetwork-use-GO-instead-of-go.patch \
>         "
>
> +SRC_URI_append_docker += "CVE-2018-10892.patch"
> +
>   # Apache-2.0 for docker
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
> diff --git a/recipes-containers/docker/files/CVE-2018-10892.patch
> b/recipes-containers/docker/files/CVE-2018-10892.patch
> new file mode 100644
> index 0000000..60d0496
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2018-10892.patch
> @@ -0,0 +1,34 @@
> +From af52f266ea15e6000ed057b13d62d27ddd5441a0 Mon Sep 17 00:00:00 2001
> +From: Antonio Murdaca <runcom@redhat.com>
> +Date: Thu, 5 Jul 2018 17:06:08 +0200
> +Subject: [PATCH] Add /proc/acpi to masked paths
> +
> +The deafult OCI linux spec in oci/defaults{_linux}.go in Docker/Moby
> +from 1.11 to current upstream master does not block /proc/acpi pathnames
> +allowing attackers to modify host's hardware like enabling/disabling
> +bluetooth or turning up/down keyboard brightness. SELinux prevents all
> +of this if enabled.
> +
> +Signed-off-by: Antonio Murdaca <runcom@redhat.com>
> +CVE: CVE-2018-10892
> +Upstream-Status: Backport
> [https://github.com/moby/moby/pull/37404/commits/569b9702a59804617e1cd3611fbbe953e4247b3e]
> +Signed-off-by: Sinan Kaya<okaya@kernel.org>
> +---
> + oci/defaults.go | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/oci/defaults.go b/oci/defaults.go
> +index 4145412dd..992157b0f 100644
> +--- a/oci/defaults.go
> ++++ b/oci/defaults.go
> +@@ -114,6 +114,7 @@ func DefaultLinuxSpec() specs.Spec {
> +
> +       s.Linux = &specs.Linux{
> +               MaskedPaths: []string{
> ++                      "/proc/acpi",
> +                       "/proc/kcore",
> +                       "/proc/keys",
> +                       "/proc/latency_stats",
> +--
> +2.19.0
> +
> --
> 2.19.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

