Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C173E00ADB; Thu, 29 Mar 2018 14:15:14 -0700 (PDT)
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
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D00AFE00529
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 14:15:13 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id o102-v6so10195165lfg.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dD86LeOPcy0GPLtP2mJlDHiTB24UTOsw5iwc8kPhHXA=;
	b=leEbZUAo2/xMpmJcQu39X4dO9sKwjRUTNLlMbPgwV9qbX1i7PV6wbQcRBsx0Ci+oU1
	OEVW5LFS1CbjfthtUiLwWMOP/G0NJOPm65QiFaIWp1+1pY9V2irz42u8+cJMYt+PZLkY
	wg6bBXiNNpsWKpEqIhKH76IufGr44xkQJUXYCPvl6dgDy8FGXvULslCKiVHbLki6kl7X
	O8nNZL8jSpkuauOzhN059KBSODzXAJMQEmLQdvU43VzH89m7wXml/gjNg20nWjkrkEF5
	rvAEv8NyvlArU7oFGpEI1tXvSozkUpTNaYRB+kHN08zJzd+CdAfF7WJAMkC6qg5WgaEA
	Rt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dD86LeOPcy0GPLtP2mJlDHiTB24UTOsw5iwc8kPhHXA=;
	b=A2DUCP5tHCBbwLLsPCYrN63gfJDI5PvfjMk8iPeBobZCzhbFvCMrygnvbNtzw1fqc8
	z5RyySgDybVKt/h404ws76jbkCkafruY1K19B2gNTIfG0winihKN1Zp0DPhNg89PqIbM
	ssijoK0NHtM1qxceCCZ58V3NWDk5d8DL57i+tOxgM9gwwwsdET1BRnuLor+FdeVFiGGb
	QmBDRkEaV+KzWgsWQjIAm9hdmoM6RlkqW8OaJVA6w8g7exJ97PUXgymN3OoZyLOdX00S
	T5pHaS0WSOhz4eIluZc1MHvqCgaftMJzlTBPmDzOm4794vxKc5cripRCi6Hw+LsoZuSv
	akqg==
X-Gm-Message-State: AElRT7GKRVk/Yjciz8SOnlmEi7p7U+qmo4Ui9c/x/hODKoqW0H5TukBt
	EO1LUMF4z3Fd0FUKO7KoexA4vaJt3fefPTa1r8TcSA==
X-Google-Smtp-Source: AIpwx4/gy/chgBQjdxA4h8viPahAGaNvshntJsgnbQK3eidM8STkPXhmJ8hsVzlaQ4lAx2LiychPIl+cwA0TYVzmME0=
X-Received: by 2002:a19:fe2:: with SMTP id 95-v6mr6576224lfp.13.1522358112650; 
	Thu, 29 Mar 2018 14:15:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 29 Mar 2018 14:15:12 -0700 (PDT)
In-Reply-To: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Mar 2018 17:15:12 -0400
Message-ID: <CADkTA4Otrvgqt5UC=krS-5+T6e+VfMK87oE1XGUNP2vDehCLYw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-heatclient: 1.9.0 -> 1.14.0
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
X-List-Received-Date: Thu, 29 Mar 2018 21:15:14 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-heatclient from 1.9.0 to 1.14.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> index 6653b37..baa1c2c 100644
> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>
>  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
>
> -PV = "1.9.0+git${SRCPV}"
> -SRCREV = "b80166d848dd26718cfe0627bfec22774213616b"
> +PV = "1.14.0+git${SRCPV}"
> +SRCREV = "2ce6aa19a3a8936bc7c9737efadacbb4ae737dab"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

