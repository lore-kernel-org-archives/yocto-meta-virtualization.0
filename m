Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE35AE00A54; Thu, 11 Oct 2018 11:11:34 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECAE8E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:11:33 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id 63-v6so9097746ljs.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZuDu+3OXjbf7uMyU55EmLjLtPjhivzWkpdau37tkenQ=;
	b=t/K5ckpWcH8u8U7jYBOuCPQ4IgJU/nhvsuZB7KR9dqpi2RIVr4xirFaquBc4cvnKsX
	Aar8VOwWX/ZPSOuEV3GNdzmiHunBi8Sz4OJ+pZHphb+MF2/cBFLr2tbUG9XJkO5V6Rm7
	V8BKf6znQtDiVoq65wEH5tBK7GIiAXWF63AQNuv/hIsPAjFL1xX83sTbSpY4wcThU5zV
	wijwZX8H+FAU4upe3i1Pm4CN4oQk8FNfdNhAgzhziHrVgYG4mVOxzkjJ11RXSYQeWHyN
	0BVUDv+Nfn4dOyUi8QhXsENvRLWGoqBxBLpuBsWwqOkrKIaGXihNZAXn4I898pAQdzkJ
	IQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZuDu+3OXjbf7uMyU55EmLjLtPjhivzWkpdau37tkenQ=;
	b=NnFwC2BP8OtmIDtmAJRobQ2C9M/7SuY/L3PoFbYSeiz0qt5daSwFS3vQoZYRUjEXbY
	vL7TXd/5M9ZCSkaDTJet9b+uUqVI3Bn4PGBpds1D/e0EgsacFd9qsWs1npL2z3k+KcS9
	tHPYlKJEdEI6ekZA7lC1ycMqk+7olYHSA24lfeFjxdufG6dDzaJMxM1KicE4208D2eN2
	2Zjy4ocaSFFoInPGWa9CYQUI4qOF/q0vY8oe/2EeYNLCKPO08dgeaN+GKieNzL4K4Ens
	NLLR1JatcdXr2YaJfmPOEOYRl85Ov1PgPX8N6rl+OnGLownEtRoYzMAMoNVzTVZ20Yiz
	qgOw==
X-Gm-Message-State: ABuFfojHRiXyAGdfoL5m982nUgnwPs7SVazyrHAFN/GfVpB/xO2oebVa
	j6b73TTSYTK6JjX3Q3jod2DOlsI74MCnWzaT0u/dSg==
X-Google-Smtp-Source: ACcGV62DHwjpo89l5VLNcfnPehltz2do6ycuFQhHN0Audq26yZwzAtwxaVttxpVoI6ceowte6i4P/IACva2rXobzP7w=
X-Received: by 2002:a2e:8ec6:: with SMTP id
	e6-v6mr1694171ljl.166.1539281492643; 
	Thu, 11 Oct 2018 11:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20181010041824.7029-1-okaya@kernel.org>
In-Reply-To: <20181010041824.7029-1-okaya@kernel.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:11:21 -0400
Message-ID: <CADkTA4NoGCoM==CW5UNK9n9LXia1c_RVw8CMU=edtCVhZ-UPcw@mail.gmail.com>
To: okaya@kernel.org
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [sumo] [PATCH v2] docker: CVE-2018-10892
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
X-List-Received-Date: Thu, 11 Oct 2018 18:11:34 -0000
Content-Type: text/plain; charset="UTF-8"

v2 works.

merged.

Bruce
On Wed, Oct 10, 2018 at 12:18 AM Sinan Kaya <okaya@kernel.org> wrote:
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
>  recipes-containers/docker/docker_git.bb       |  2 ++
>  .../docker/files/CVE-2018-10892.patch         | 34 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2018-10892.patch
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index e055a4f..7c7bd4c 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -30,6 +30,8 @@ SRC_URI = "\
>          file://0001-libnetwork-use-GO-instead-of-go.patch \
>         "
>
> +SRC_URI_append_docker += "CVE-2018-10892.patch"
> +
>  # Apache-2.0 for docker
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
> diff --git a/recipes-containers/docker/files/CVE-2018-10892.patch b/recipes-containers/docker/files/CVE-2018-10892.patch
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
> +Upstream-Status: Backport [https://github.com/moby/moby/pull/37404/commits/569b9702a59804617e1cd3611fbbe953e4247b3e]
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

