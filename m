Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BACCFE00A38; Wed, 22 Jul 2015 13:13:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF6EE009EB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 13:13:22 -0700 (PDT)
Received: by ykdu72 with SMTP id u72so202409213ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 13:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6iuoeloVHpMTuQq2cmEyQkxpcTb3Le16DeOObA1br+U=;
	b=ysOrd+qU/vBMBcsgdOiyb+Zv0YJzoZKrZwP+/0UFExgPSUZEX/Sb0zYRzvNquUHciN
	bAq14FG3EnLpd6i4/El7WVGQhF6C32Yq/286mMREIatEu7bFQGBmMc1edTi0n51n1OKV
	Z19o38nNQHVnL/ztQDvuyOd53778G8EC5fbF8oqY9vCu7uyCFfZ8ncHU0zGDe4PIdG4b
	HHc/zgWjxU/K/Ej2/iQ115CxwE2OdlkxJ5H+27RutM49Ti+6e+RNpyC7JeExrn68dQiZ
	rO3vMpFxOlDGSQogLgwIlagKPxUD7Rai140FbBTTWUlKcpLenC5ak7+tmK6DB5UNQau6
	drjA==
MIME-Version: 1.0
X-Received: by 10.13.198.2 with SMTP id i2mr4445246ywd.123.1437596001680; Wed,
	22 Jul 2015 13:13:21 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 22 Jul 2015 13:13:21 -0700 (PDT)
In-Reply-To: <20150722161227.GA31716@windriver.com>
References: <20150722161227.GA31716@windriver.com>
Date: Wed, 22 Jul 2015 16:13:21 -0400
Message-ID: <CADkTA4MVnTSyqfRhRHFuvHwP5jZ+Qcg0ZMEMCZQTuGtG7ZHmZg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker-registry invalid path on startup
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
X-List-Received-Date: Wed, 22 Jul 2015 20:13:28 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Jul 22, 2015 at 12:12 PM, Amy Fong <amy.fong@windriver.com> wrote:
> From 383cba6388cf7a1a221a0b03b78d017b0f0fe299 Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Wed, 22 Jul 2015 10:43:14 -0400
> Subject: [PATCH] docker-registry invalid path on startup
>
> Systemd throws the following warning at boot:
> systemd[1]: [/lib/systemd/system/docker-registry.service:10]
>         Not an absolute path, ignoring: #WORKDIR#
>
> Fix WORKDIR in docker-registry's systemd from #WORKDIR# to
> ${PYTHON_SITEPACKAGES_DIR}/docker_registry
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  recipes-containers/docker-registry/docker-registry_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
> index 338cb69..fe766d2 100644
> --- a/recipes-containers/docker-registry/docker-registry_git.bb
> +++ b/recipes-containers/docker-registry/docker-registry_git.bb
> @@ -83,6 +83,7 @@ do_install_append() {
>         if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>                 install -d ${D}${systemd_unitdir}/system
>                 install -m 644 ${WORKDIR}/docker-registry.service ${D}/${systemd_unitdir}/system
> +               sed -i "s|#WORKDIR#|${PYTHON_SITEPACKAGES_DIR}/docker_registry|" ${D}/${systemd_unitdir}/system/docker-registry.service
>         fi
>         # based on config_mirror.yml - uses /var/docker-registry instead of /tmp for files
>         install ${WORKDIR}/config.yml ${D}/etc/docker-registry.yml
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

