Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4262.1575642377550895446
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 06:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c5Uh+9IQ;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B388E010B0; Fri,  6 Dec 2019 06:26:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33731E00782
	for <meta-virtualization@yoctoproject.org>; Fri,  6 Dec 2019 06:26:16 -0800 (PST)
Received: by mail-lf1-f68.google.com with SMTP id b15so5412331lfc.4
        for <meta-virtualization@yoctoproject.org>; Fri, 06 Dec 2019 06:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o8uxsVpe47DP/Amnnppdn6dchtu3egCLfVVJhnXkCHE=;
        b=c5Uh+9IQv82nAq7uNve1DNjCRk96efJ/BLOMKe2WEo7mf3KavM7bIPWnp33QUApaEM
         UgV4tTZzIgXomJYkWu+DLp0Vtn7R6P5UVVmY5ANRPl5eUsSDYg2g7resTik2m90J1IhR
         e1/m28bI4fPU3kLyV8rwOtJPwv1EUlyT15a0qKYdH1y7O3OpqRO1o0N1Ae/D0wm20NZT
         OpVYTIjyFycvHQItvmFNACDaTCfFBQH10rn4w4zXzLYqbPhzU23FLnDCgxALPPSgjWu3
         TBHlFbakte5HbRSmdiCK/3QdduMCK2oZQK3BaejzXCtTF55GcESfmOE9ekpxqfXKts+i
         nNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8uxsVpe47DP/Amnnppdn6dchtu3egCLfVVJhnXkCHE=;
        b=ttlE3rL/oJcg63W0rmvaHQW9Dbk1gwJHUU/CIkJcmvZGt7/V9Qb77fVKWLx0N9wIv8
         mXy1cMLLysN+TYInQdaY7dpXJ3F4F0Evhji/lVoLbYEumojbq1ClIXElDpfpCcLBo4Ip
         HPY2yCuUqC+v2IONjBs8Zm+DNm3zqJsAhOxCidXQ9QTjRl5MN6jRdcdabnmzFJGRd4Ph
         3q2COD7Anfe/oiG9S2QgAGOeFZJZkktl9bQhP8gfYuJHR6X1mzniPxEcdkd0l7ubJzrP
         gCaiV7HwIDfmsQL8QrSxgyMN4ZrHHLeSYgePoiPjOBMYW2N6nglnuzRpeUEKZa4e/f1K
         qydg==
X-Gm-Message-State: APjAAAX/IP5JjXuxahaUyfy9J/yAuNH0ivjYuPxVACJw1anRqbCewQmw
	WHRRVYzd+fd6ml9Kr9BTJGZuY3QiIArWhfXDdEhixJGPhMg=
X-Google-Smtp-Source: APXvYqyseFrr4scxNCgnmfJPup60l1XAIWnkkA8MJD1vR1GtYwax+S/7FFnjBNHiwNYmg4iyQw68gzo4ZEehaLR7yAg=
X-Received: by 2002:a19:7507:: with SMTP id y7mr5453650lfe.146.1575642374977;
 Fri, 06 Dec 2019 06:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20191206011454.37368-1-Qi.Chen@windriver.com> <20191206011454.37368-2-Qi.Chen@windriver.com>
In-Reply-To: <20191206011454.37368-2-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 6 Dec 2019 09:26:03 -0500
Message-ID: <CADkTA4O30BDWvV3mAzBQQ-ysxW9JaUvFdqEQLf4ES28XPHo50w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] layer.conf: use go 1.12 version
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 5, 2019 at 8:15 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> kubernetes could not be built correctly with go 1.13.
> Use 1.12 version in layer.conf.

We unfortunately can't set the version of GO like this, since it would
impact someone that simply includes meta-virt in their layers.

I see two options for this:

 - create a k8s distro feature and only set the go version when it is
enabled .. or we re-use the virtualization distro feature (which is a
better idea)
 - put the preferred GO version into the meta-virt .inc file that is
included when virtualization is in distro features

Although, I recall someone saying that the .inc wasn't working
properly and isn't actually triggering .. I found the email from Mark
hatle that describes the problem. If you check the list archives for
the subject:  "[meta-virtualization] conf/layer.conf is broken".
You'll find a description of the problem.

The fix for that, is to make the .inc work like the one in meta-cube:
https://github.com/WindRiver-OpenSourceLabs/meta-overc/blob/wr-10.19-20190121/meta-cube/conf/layer.conf

The .inc is the best solution, and this is a good opportunity to fix
it (it hasn't been working correctly for some time now). I'll try and
make those changes today, and follow up later with the results.

Bruce


>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  conf/layer.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index dfca6da..2d008bb 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -41,3 +41,7 @@ PREFERRED_PROVIDER_virtual/docker ?= "docker-ce"
>  INHERIT += "sanity-meta-virt"
>
>  require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'meta-virt-default-versions.inc', '', d)}
> +
> +# Use go 1.12 to avoid k8s build failure.
> +# Remove this after https://github.com/kubernetes/kubernetes/issues/82531 is resolved and k8s is updated to a working version.
> +GOVERSION = "1.12%"
> --
> 2.17.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4829): https://lists.yoctoproject.org/g/meta-virtualization/message/4829
> Mute This Topic: https://lists.yoctoproject.org/mt/67394161/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
