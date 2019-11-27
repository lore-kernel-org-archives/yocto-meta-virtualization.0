Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1174.1574895364404265749
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 14:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HNSND6cn;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 068A9E01082; Wed, 27 Nov 2019 14:56:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4456E0107C
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 14:56:02 -0800 (PST)
Received: by mail-ed1-f66.google.com with SMTP id cy15so13496807edb.4
        for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 14:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=36xZiVLf8CGRoZYZlpLkAu5aNcPsNRdEgZUbddNgeqE=;
        b=HNSND6cnssgWlSUf+XyW3CkQ8RGOPYEPyDxHdiNT4opNLL5S7M5eo+K3KdbFAJr2Cd
         AnYVfYxrGAfVL4h7bL6s1H6+3WTm3rdLpt8BSXY7+wgqt01M2EZUg6G/g9LjHEH/Cr8C
         2+AK6F8W3GwP+yZBn6JsderOyK/qCbHk5z5Tv2vb445ARZZwc3rFGZ0c8D//BjsNaCo1
         IULXk7Dl4c09ko4njRA2x/YXqDbWDagIHjzHAr7Vn5bzVlb3NjGNYloSJhjmLbsFUOVb
         VowBOfEe8MvxL7M63RKXTE/R9DflTuA0G8QwGzB2IWlkBFYYliSDgyKgD6iFJGlk0Dlw
         kOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=36xZiVLf8CGRoZYZlpLkAu5aNcPsNRdEgZUbddNgeqE=;
        b=cHhUOzvjwa6s9eDDUfFg9vMTs7Y4Rw5XoaryTQqUs8kpV959njAsKaqTkRHTe6que2
         xHI/ittaNS09Wti2PUGsa+JoMylDMw+FlKYxN9VPPvpBP5pws9ztandLzp8u9IUy0jDH
         UDxSH5ohr+J4mLmnWyAWvqU7iuMZv9edADjwj/P/DlZrXqmDaLQBGs4WjPVy5BFuDiZN
         T0He2SGrCir0kYGVD8LWKi8o+4raoZ/MXc+g6jcUHzzoSW5ZhIn23CBAFu+fpIgng+s7
         jmyMfcjEjs+OzvJI2FRQ2cpVETfkA8yeY1VAW7eN9xKlDYG4WB3qINrh7H690htUhtHA
         wIeA==
X-Gm-Message-State: APjAAAXvZwY0p7bz+kUyaTEUigNPY88Sasd/DNqkv7b2nNpznr0WsFtX
	KGUvMuFe/uLB1Sz+9wt7LSv1wyK4E3sQcs+6Bik=
X-Google-Smtp-Source: APXvYqyheA5VqnDmrIO2SsnnMcX4GjosA4PRNo7gbcWS9VZFcAOCVmNGxgAZ6S950EUJjdp0tdLPzb58fR/wJqCcioY=
X-Received: by 2002:a05:6402:14d8:: with SMTP id f24mr34976416edx.227.1574895361767;
 Wed, 27 Nov 2019 14:56:01 -0800 (PST)
MIME-Version: 1.0
References: <1574768196-49655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1574768196-49655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 27 Nov 2019 17:55:50 -0500
Message-ID: <CADkTA4M7TgAuFkxmLTwCm0oqP6R04gcGPAbjd0UcvWNnWcpRZA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] python-novaclient: Fix do_package_qa error
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged to master and zeus.

Bruce

On Tue, Nov 26, 2019 at 5:31 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com> w=
rote:
>
> Fix the error as follows:
> ERROR: python-novaclient-9.1.1+gitAUTOINC+204eff6dc7-r0 do_package_qa: QA=
 Issue: /usr/lib/python2.7/site-packages/novaclient/tests/functional/hooks/=
post_test_hook.sh contained in package python-novaclient requires /bin/bash=
, but no providers found in RDEPENDS_python-novaclient? [file-rdeps]
> ERROR: python-novaclient-9.1.1+gitAUTOINC+204eff6dc7-r0 do_package_qa: QA=
 run found fatal errors. Please consider fixing them.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-novaclient_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-novaclient_git=
.bb b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> index 44f73fa..82995ee 100644
> --- a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> @@ -36,6 +36,7 @@ RDEPENDS_${PN} +=3D " \
>          python-simplejson \
>          python-six \
>          python-babel \
> +        bash \
>          "
>
>  PACKAGECONFIG ?=3D "bash-completion"
> --
> 2.7.4
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4751): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/4751
> Mute This Topic: https://lists.yoctoproject.org/mt/61957010/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  =
[bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
