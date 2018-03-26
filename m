Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B43F1E00B8E; Mon, 26 Mar 2018 11:16:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11023E0084D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:15:59 -0700 (PDT)
Received: by mail-yb0-f193.google.com with SMTP id x72-v6so3076721ybe.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Hh+rRAtUgEPTzBlgYPQL5bbCjJNKgBxPxvNvyrFDjSo=;
	b=AdoT+SEsrtOSG6IrH6vQkG7wstQ7x2IsDkU3UUPXW/6lKZiezfCoZybsKp5O2jLRQd
	4oG1irS6I0jo5ekv4CxkmbAGXTsgLH+4Hy34sUTOrWbo/Y+7OvHST3VDq+qnt8vkRZgd
	D7FjUtzyjbFRRno1ha6r3+R0xm0JK35YOGciTALxCnE2ibsFpZ6Kk8WK3Zme2S/un61M
	hQ2xLevyYWmUzX6dA62otZD5DwVh+MrB79Y9umpEsZSWPHdRUpjYychfCnJLnQYMvrbk
	s8rKSA3+KhCkJ3S7Wc02LxrI2PVtneyMgSgqyscfaPgNmaZMaQZbbKFQOC47HDBMcGP4
	autQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Hh+rRAtUgEPTzBlgYPQL5bbCjJNKgBxPxvNvyrFDjSo=;
	b=Gmi9YEQlXaThWBi1RQ/BhteeafHCSghvdcXmtXumsNkg+Es5INyCKb5l2sSkkqrNHc
	+8Zw8gLvHa9aeQsgMPUVug8YRqEjAYpj4Anr/jdrYmWVlIKEs28Bqyni2OkzrU/oHeBi
	a3UvlRr31mIbNN2YxnWrp4HHTdMUSeVUJVOza/qj51oUIH1hC6iSDWI9rQ00M/BeQEI9
	lE8uXif953E+UeQgfOBnCyroo4iuWEh8h2gXiCv5ZXwfG6/T7w4PJ9D4sCX4YL5h8PQq
	A5njmdWn1iJbKqjjc9gXIQDenKQwSKZR4VmIxrzWSoNurQUNpZLZiXh6WPDh2yF8rwTo
	O4lg==
X-Gm-Message-State: AElRT7GONSjFnKVZWoe2nbJbViJhiXbxdyvaPiyVI0KR4stXYKSz9/gt
	ndWNbx8/Lb+9Yv6Pz+3rQO6sLfSoXhQPIZ7xofyZJw==
X-Google-Smtp-Source: AIpwx49c+LoIyJ9L9FgDMmNY5x/OeaDZT9PEWPeJZPEi928PydjKK9rEIJAldKEQlwNlEuqNHeCOA4NtTTqf/n81KYM=
X-Received: by 2002:a25:320f:: with SMTP id
	y15-v6mr5019611yby.255.1522088159180; 
	Mon, 26 Mar 2018 11:15:59 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:15:58
	-0700 (PDT)
In-Reply-To: <1521775736-38102-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521775736-38102-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:15:58 -0400
X-Google-Sender-Auth: hm3hoWntWqs3HhLuJG84Ebd1K-E
Message-ID: <CAPuovE+ZzQxi5BFmDzZ8W-gJaw2MtF0e3_5qXDckpfpeAkMU8w@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-oslo.i18n: 3.17.0 -> 3.20.0
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
X-List-Received-Date: Mon, 26 Mar 2018 18:16:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-oslo.i18n from 3.17.0 to 3.20.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce. This one should also be OK after a cursory check. Same applies
to this and the rest, if my quick check does end up proving incorrect
we will have to revive the old version and add a PREF_VERSION.

MarkA

>  meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> index 9f7ddc5..313c277 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
>
> -PV = "3.17.0+git${SRCPV}"
> -SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
> +PV = "3.20.0+git${SRCPV}"
> +SRCREV = "172e20b10981069c36b0f42377e5b4fbe22a9864"
>
>  SRCNAME = "oslo.i18n"
>  SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
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

