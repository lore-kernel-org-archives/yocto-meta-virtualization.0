Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCEEFE00A75; Tue, 29 May 2018 06:10:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BE4FE009AC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 06:10:14 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id q7-v6so4756034ywd.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xy9EgbT8axWrm4PvuW1qZOIKr3Y5xXFr0DXakBgoJsU=;
	b=o/ALvApvOJKami3eG8XOwHoVf2d4O+Nh+ZfYyWKEu3gZn3DvzG9l7DvTFSRRIjKF5u
	LaF5OpEk61Yu/dkvtUc1GsWJIKiOSZJeIG93uMEa9nu6SNOTD9fAtapbw/+lR+UOY8WQ
	/Mfc7mRfytwMX35he5PGGH5OxM+GDgGsTSEJ44ekops2WD435yFMt6UN1b9dRhw+JO5X
	yxy9n8nTZVDXdwAvyVL/SK+WboEAwXnUrOLWMQUHGcP5TC9ZCZST6QFScsktfC1J9Ehp
	2i0lci14sjHFzOG2G42Et4Js+9ZzgmKzpmKZTgFwBxowu87bGxHANVPGs4jcJhR3c0GA
	4wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=Xy9EgbT8axWrm4PvuW1qZOIKr3Y5xXFr0DXakBgoJsU=;
	b=CRAz59dzeG2z/HhV/aLS9srLgsYIxebHF05EF9hJxNXho0dlC8DP4N0NmcY9iEUtwB
	ISmuCeaBQT7uyfn2oHLSDblZHL7ZMQqX5aYidu4THzoacRTy4c1F6qOQbvwPi2nH+y/a
	nd925huEGYOJthmhGGPUXWG9+JkU4Rw5zAg4ztvhVcM05IT0xOX+WqE/CyZMpPLQ4ovh
	tZzV5Clz2/D8BstO5KtlInR7hCUPFFomtSCrpIaPAaka+sDFjdmqfqz0c9RPJM7XXS9x
	L7KuYK6xrMRyaRWNfpBsvpkPBc9KnINuzvbvq/+aHhH0Jm9e6h9gWabA4ySkFPlcMy0x
	yysA==
X-Gm-Message-State: ALKqPweWWFIdimrTizIebyFsr2POTyHogsFEScO0WP9LyYNxaY5wGA4w
	77pd4ViSTHFJ66md1aK8H8gqf4BzyB3kjNmnREyV6A==
X-Google-Smtp-Source: ADUXVKJNIRG4SAvmw60QmHoYoXJq3hD0b5gKJoG9DXgHgII/Xs0VdRHW48B1e7o3YPfkU4xJzDg2EF7Ft6PV60lIC2I=
X-Received: by 2002:a81:91c7:: with SMTP id
	i190-v6mr2576350ywg.364.1527599413765; 
	Tue, 29 May 2018 06:10:13 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:3dc7:0:0:0:0:0 with HTTP; Tue, 29 May 2018 06:10:13
	-0700 (PDT)
In-Reply-To: <20180529110036.32285-1-hongl.fnst@cn.fujitsu.com>
References: <20180529110036.32285-1-hongl.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 29 May 2018 09:10:13 -0400
X-Google-Sender-Auth: p4T1iIbYO_Gj7vjbVuwXUQhUOsQ
Message-ID: <CAPuovE+sxDa6oHLx-YQyWdxDPK7jU4giLhXf9WYb5aNWKts-tw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][PATCH] python-glanceclient: 2.8.0 -> 2.11.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 13:10:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 7:00 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-glanceclient from 2.8.0 to 2.11.0.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> index 00ea2ab..07cf42d 100644
> --- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> @@ -9,11 +9,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> -SRCREV = "13b25ff1fed908cfe7b4e719a97efd7121e3be96"
> -PV = "2.8.0+git${SRCPV}"
> +SRCREV = "314a29f6a6e64f69fd07fd5a0fdcf7aeb5574c1b"
> +PV = "2.11.0+git${SRCPV}"
>
>  SRC_URI = "\
> -       git://github.com/openstack/${BPN}.git;branch=stable/pike \
> +       git://github.com/openstack/${BPN}.git;branch=master \

We can't be moving these off of the stable/pike branch without a plan.
You need to work with Bruce to figure something out. As is these are
not acceptable in my view. What is the motivation for the uprevs? That
might help with the assessment of these.

Mark


>         file://glance-api-check.sh \
>         "
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

