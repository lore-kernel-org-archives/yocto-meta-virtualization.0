Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A3DFE00BEB; Mon, 26 Mar 2018 11:19:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 073ABE0084D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:19:25 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id y23so6419409ywy.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=0WNhbv9tW4iFRJcLx9EmOxpJTrPNze1R59ATqcOhwVw=;
	b=KnoZX1EPyryV62lxV1MyZ+VQTdRZlvpPYkcEInPytb3JPVjmyNm0iJd2gMe/CakDY7
	btwKZ2psBAk9GSh1aOJW2E2gChOe/njn+POUbN1v0u5M9iGcd+1cFNk/+JCQLv4AKq53
	nbUByqk9MnPMPVy3Oqg/zqfeBYS5G8FC7QVOrRIPvi9Rpmg2QZhlIgI+BlzeJA5+86c+
	5jPI8Tik6IAqd3uI8oe+QYCrjKqt9T80PdkWikHw9Is0F5F4rGLX7DGLhQZ5EP+LFVJt
	KaU2pPS9C/IiPKsJy2mV1CLbvocpNHZE0Mzd51LDnEL0XlAjUoPA1FRZEx2scgcY6lDW
	aIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=0WNhbv9tW4iFRJcLx9EmOxpJTrPNze1R59ATqcOhwVw=;
	b=Tsj2mw0aVaQTNIsbLQ25FqN1qtI/OiqFNHHKxIbbE4O4TMn+yaLD9Tgbu4HBIncllF
	IDII1aepLA+78KY7KWcIt2hvFBZcMX8CTdQlUaO2ni8omJzo55B3I6S3qpmgouxu357K
	1kSTvW21VLH4jl/Efkvy5BpBdBPxAI3aiQ/mLlFBG22oyKqJFHvL7orZ6PzzWqcFgYMN
	sgmC5eVdZ2Wg+yDfLSr+fOsigvDsqNrvgiI+IundvRxCpgw4i+lL3sc9QTWcVE9KHujM
	YijdTliUPQQQcje5dfFSNz2H2i7KhArJyXW2pAQ5zasp5LmlM78Vvq+bc00TyLtflfuS
	a88Q==
X-Gm-Message-State: AElRT7Esi5eic6kCNUB7+r2pB1eyWELcIF4Nz8D8rrWc9j6j52lE94K3
	PQAbV+cO36dU9X8Ry7gPkZoMS+to/5Wm0prULjc=
X-Google-Smtp-Source: AG47ELv1ggem6APCQJq+uunC19tRnWte9rD/2umTNrpR9ytXgt4aliijo4kw8nVde3LsGvWCGKUlhBuHhEsT6Ht04WY=
X-Received: by 10.13.226.206 with SMTP id l197mr24004601ywe.490.1522088364968; 
	Mon, 26 Mar 2018 11:19:24 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:19:24
	-0700 (PDT)
In-Reply-To: <1521775736-38102-7-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521775736-38102-7-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:19:24 -0400
X-Google-Sender-Auth: kvRHIRiJ3Z-dbLeM2kPGqU0mrWk
Message-ID: <CAPuovEKGnXGxJKXgsYRs462RU7zB9Hh51ksbTa24vACpJOojHg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-setuptools-git: 1.1 -> 1.2
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
X-List-Received-Date: Mon, 26 Mar 2018 18:19:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-setuptools-git from 1.1 to 1.2.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce,

This one looks fine.

Mark


>  .../{python-setuptools-git_1.1.bb => python-setuptools-git_1.2.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-setuptools-git_1.1.bb => python-setuptools-git_1.2.bb} (73%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
> similarity index 73%
> rename from meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> rename to meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
> index bfbc1d6..2514017 100644
> --- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
>
> -SRC_URI[md5sum] = "7b5967e9527c789c3113b07a1f196f6e"
> -SRC_URI[sha256sum] = "047d7595546635edebef226bc566579d422ccc48a8a91c7d32d8bd174f68f831"
> +SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
> +SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9c40445"
>
>  inherit setuptools pypi
>
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

