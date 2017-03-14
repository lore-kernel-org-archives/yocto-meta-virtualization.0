Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1E0CE0094C; Tue, 14 Mar 2017 00:17:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BB42E00901
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 00:17:23 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id n11so56570685wma.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CBDCFuKFSQyi4ZgqJm/dOwPnRu/75Xe/1J2qlK4QzJE=;
	b=F3pNjdTv+fhWqfBivoQ2QD6nYVWn4Mks+Z+oe3WPhi2BlGjTWwBP7tItmqvb5XKg9Q
	3UAZwd9nO2pM5ZOUOUk/prwfOtCJNAmKnc91tFdVydr+MgiQTorEkMM4UveW/aM8A5m3
	Hb02pSY1sdClBg9Dh/l9LKqUBj/b/8PRCvwSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CBDCFuKFSQyi4ZgqJm/dOwPnRu/75Xe/1J2qlK4QzJE=;
	b=XZvdb+q61dZTJRTANKbvPoIC4bjMV4nP++G6C2wTBZCrEtRUDPerPr3PEJye9Y0BxS
	8rX9pBfQN/7YhMvuDxzgZhUAeYuS9Ysj0GBUVjGYysvktl16Sd8Y6im4WtzaMjXhJPkq
	drra8+uPIj737PX+j2FnfAD/JbhNCzpz+3MvZVy3QexAETddtIWd+PwYNQoXT38GxO1p
	AYG6Wvv8kombebVmsSY06hjtGbBut6pcuU4/CRbxcyo6AJKmsk9SqckIUN8JjdT/RNvM
	7MEiuVHJlIZozABDJY4bnd6V92Q3Rf6PHEmCj2X1dyADh84RiTQA3zEzX00MtOjBXBkY
	2+6w==
X-Gm-Message-State: AFeK/H2DDdzvmtBl7d+zKSLEE6kb/K7fMqqZ5hHAM3iPqarA1480ONKzu0wwE/8b28SsjeUgsQj+52P/gVxS1+P4
X-Received: by 10.28.57.131 with SMTP id g125mr12728398wma.33.1489475842758;
	Tue, 14 Mar 2017 00:17:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.90 with HTTP; Tue, 14 Mar 2017 00:17:22 -0700 (PDT)
In-Reply-To: <20170209072501.19696-1-fathi.boudra@linaro.org>
References: <20170209072501.19696-1-fathi.boudra@linaro.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 14 Mar 2017 09:17:22 +0200
Message-ID: <CAGNsrLDDmdv9tgxN5MAtmNQ32t=_rt92_sQprTPU3QCJzeC9uw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: downgrade lxc/docker-registry/rt-tests to suggests
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
X-List-Received-Date: Tue, 14 Mar 2017 07:17:27 -0000
Content-Type: text/plain; charset=UTF-8

Bruce, can you cherry-pick this patch in Morty branch?
or do you prefer I send a patch for the branch?

On 9 February 2017 at 09:25, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> Regular users don't need lxc, docker-registry and rt-tests on the target.
> These tools aren't even needed or provide additional features when running
> docker at runtime. They also increase the size of the image uneccessarily.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-containers/docker/docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index c208a02..81fd4d4 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -61,8 +61,8 @@ RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
>                    ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
>                   "
>  RDEPENDS_${PN} += "containerd runc"
> -RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
> -RRECOMMENDS_${PN} += " kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RSUGGESTS_${PN} = "lxc docker-registry rt-tests"
>  DOCKER_PKG="github.com/docker/docker"
>
>  do_configure[noexec] = "1"
> --
> 2.11.0
>

Cheers,
Fathi

