Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B938E00F08; Wed, 14 Mar 2018 05:38:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69FEEE00B66
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:38:15 -0700 (PDT)
Received: by mail-lf0-f49.google.com with SMTP id h127-v6so4508253lfg.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WeUQmiRYdpeoaKTg96c9PUVXQ9jtEIGrvK0FvauQHh8=;
	b=t3J4q6D+3l6L22qHIZXK9keHZFL3QPlo6lzMJwO5GwearZoXu0D3oLDl0Qe7dlOFXH
	gyy5GUrk6bLae4ZfliHFbVFgTV8WlgrgieuQrj/u6gYNB1Gu7dQwPxfTehS2n9zaQ5G6
	jgEBmnZBRPHM572z9tgNUcGkn/pIWeOOTj7xKQzb08GeeEHa2VDF2GDLMBk9tORefEyx
	cIibqWVT74Qwzph415wyTlUiAlQE37jXKZ8LBoLRWa4NkbMJgkaSrdP5TBK5WjRMxTHs
	3LnowgXxrAgP0qSytijFx1MHSkg8HkC4K7/xdcm0wnVQQdR4aYG2rWLaDplpKrY+RvyW
	l+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WeUQmiRYdpeoaKTg96c9PUVXQ9jtEIGrvK0FvauQHh8=;
	b=tte3KB3v8IJ7afXFyfRZycFJ95hH7acMd1HbmYgwOVn1kcCGqjfxgsLgrinnBPbMH4
	PrNnOUc2o5pwNPLn+hU1LYxnizaHh03L38lF5i+9q4EA6jnbLhmBFlyVdJE1GF7LjSen
	web8jojUrTTdmIFMQDVzcy2vnGFBDylLKYK0pBeczlXpwelF8B8gvioxA3E6a+J0bXC3
	sf+pVIHkjJMszcXMdUvaeTPP1z3DC1qHbP5ePdd1aSHsmwSXZ2pwX6EPo+hMt+Ls6elq
	JLgELs+0M8Bf2RtAr5SfpmI/BFdaEQVDNGcg20/c/VIT8B9amY2/drQ9hw/ZpUCGGRNR
	CkCA==
X-Gm-Message-State: AElRT7F3aGXhquT/csOrwfrKiJIW1y7ICrfq2wlE8eK5NakNBRqWb4ML
	vh08+y911o0zSX/oLM6PiG62jbsGZLDxuFknZWmByQ==
X-Google-Smtp-Source: AG47ELvhwPlqo1jM6sbdBT+qtpAGm39NC8TUuw93hFvPUSSPfBMsTMPDbsZuKva9SsOV4gk19bujfyPPCv+zIvoixdI=
X-Received: by 10.46.17.220 with SMTP id 89mr3141691ljr.87.1521031094082; Wed,
	14 Mar 2018 05:38:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:38:13 -0700 (PDT)
In-Reply-To: <20180314083928.20446-1-pascal.bach@siemens.com>
References: <20180314083928.20446-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:38:13 -0400
Message-ID: <CADkTA4NaYt5=akdPVXQ-5VpR4cUYGQy3K+EHtQUcgFRw4++uFw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: remove unnecessary checks
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
X-List-Received-Date: Wed, 14 Mar 2018 12:38:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 14, 2018 at 4:39 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> The variables only take effect if the corresponding init system is enabled

Not in my experience. Can you point me to the oe-core commit that
changed this behaviour ?

Bruce

>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/docker/docker_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 5ae9211..5c21138 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -117,13 +117,13 @@ do_compile() {
>      go build -o ${S}/src/import/bundles/latest/dynbinary-client/docker github.com/docker/cli/cmd/docker
>  }
>
> -SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> -SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE_${PN} = "docker.service"
>
>  SYSTEMD_AUTO_ENABLE_${PN} = "enable"
>
> -INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
> -INITSCRIPT_NAME_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
> +INITSCRIPT_PACKAGES += "${PN}"
> +INITSCRIPT_NAME_${PN} = "docker.init"
>  INITSCRIPT_PARAMS_${PN} = "defaults"
>
>  do_install() {
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

