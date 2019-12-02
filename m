Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.87.1575260326210291718
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 20:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lTWGVybG;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6A4CE010ED; Sun,  1 Dec 2019 20:18:45 -0800 (PST)
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
	*      [209.85.208.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B7C4E010EB
	for <meta-virtualization@yoctoproject.org>; Sun,  1 Dec 2019 20:18:45 -0800 (PST)
Received: by mail-ed1-f68.google.com with SMTP id f8so15701964edv.2
        for <meta-virtualization@yoctoproject.org>; Sun, 01 Dec 2019 20:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N1YVq9wsANL6Ql4C8iRoLJNjhqCGpeIpPCm2naqid0c=;
        b=lTWGVybGuJXGu6HpthBb91TZbatmtznggWNweyJf0Aqfz+q99ZtgDQgcf13eSA9Mga
         +GgOffo6Q7mt0jxWaCnj39MP310pK6reTe2NaQZnaQ+9hq2C0lzei9nBArbtRIhgcmGg
         bUsoxbQP7l5LcFpVe8+mhn1tyw8Fw9lkWjQLdFYJ0N0C3wCaGuiLRPAm78gPReg1zZSL
         UlScSGhLCQsZgohjPJ/9rFMq8/QfXPeV2dcC/5rr94aDFG3YBFm36pS406pw4dUnuvPW
         RtB8F8uXqQtn5ifBfBQW6U5EGE6oBvnrDq1EYIzWgYf/AMwIAM3IQ9dtyjM+TF3RIPHj
         ZLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N1YVq9wsANL6Ql4C8iRoLJNjhqCGpeIpPCm2naqid0c=;
        b=Iuz90rg7nJ4+lQk5gKTR0yybuwP964dLBtSuiF5cK8G4jSLyrdRqTasltEhouQ5Kj9
         INww2xgYZN4wcJ3vSBiIiAberaU4hqylEqPUXM2bkhq9n2gGY/FaKP73b7m9ThJU3O2L
         lhOMuIAyemWxlrPsjwLFx9yJNMNhm7X34E1/yQoOY/D7aIyD8xnvUtEQq8yIjoAo4u76
         8rpJtY2OY1T++m2gLFewftRUVeHw/KdJ2U7fIpHMr+hsuEw88V5ihzR4975j8kJQG+wF
         o5fJ3ed6u2mOObacGFAYr6al/0cEA9CNe9YtcVJzb9NA8zwbRgUfqV2/w3kzgN7kWcfM
         gLMA==
X-Gm-Message-State: APjAAAXvqff5bbVgX011roUhpuJippeaVh8hkR9DO6CdB0ldu3Nrn6Ye
	fyw8B37WLLQrC1TZtEyrmHs3rH42uQE+dYUHQBQ=
X-Google-Smtp-Source: APXvYqyOKdmyNx1fmkfKP9hofOmaNS6wCLc44gLpn7jK3AHc6kV8oIie3reVjPFUnUxyTAd3H5jC1qDEJClIvtkSmTM=
X-Received: by 2002:a05:6402:2d0:: with SMTP id b16mr25466317edx.227.1575260324235;
 Sun, 01 Dec 2019 20:18:44 -0800 (PST)
MIME-Version: 1.0
References: <1574970158-3207-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1574970158-3207-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 1 Dec 2019 23:18:33 -0500
Message-ID: <CADkTA4OKMNMjtckG+rjBf2O64-pV0sdOfDZtDeDc2yJUYH_o6Q@mail.gmail.com>
Subject: Re: [meta-virtualization][zeus][PATCH] layer.conf: Update PREFERRED_VERSION
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Nov 28, 2019 at 5:42 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Update PREFERRED_VERSION for following recipes:
>   python-sqlalchemy
>   python-eventlet
>   python-warlock
>   python-jsonschema
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/conf/layer.conf | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index b6f8dba..a61bf25 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -27,10 +27,10 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
>  PREFERRED_VERSION_python-pexpect = "3.3"
>  PREFERRED_VERSION_python-django = "1.8.6"
>  PREFERRED_VERSION_python-netaddr = "0.7.19"
> -PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
> -PREFERRED_VERSION_python-eventlet = "0.20.0"
> -PREFERRED_VERSION_python-warlock = "1.2.0"
> -PREFERRED_VERSION_python-jsonschema = "2.6.0"
> +PREFERRED_VERSION_python-sqlalchemy = "1.1.17"
> +PREFERRED_VERSION_python-eventlet = "0.25.1"
> +PREFERRED_VERSION_python-warlock = "1.3.3"
> +PREFERRED_VERSION_python-jsonschema = "3.0.2"
>  PREFERRED_VERSION_python-networkx = "${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '1.11', '', d)}"
>  PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
>
> --
> 2.7.4
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4772): https://lists.yoctoproject.org/g/meta-virtualization/message/4772
> Mute This Topic: https://lists.yoctoproject.org/mt/64062219/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
