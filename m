Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E8BDE00C7D; Sun, 18 Aug 2019 19:27:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DA48E009E6
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:27:43 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id x3so261727lji.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WZdMLyDJJh+1SYqgihRBmPZBLAoT9B1s0C29W6C0UPY=;
	b=Zn8cmnxbImOUn23Ek9aVVLTjUg7pf/OxziciGxKCwXzhcXdVa60BJ/w4IdrTOEgIHF
	/zGek42pK4C/rqOWG/i5MQ49V/VVnVdBVMlWJFUtc6HtVAVp106DfXsdNhdqBrNuuRtP
	ojUpXAPqfluhKSMu08qp5rjdfv+WUGjlMjl01vFU84bwBDWol7t1Ojib4YAdsonvt0RY
	L4jHYyowELJMtVOt4sXhEchvBzlP2lmGtCeMAuUl10Byq8K0THGNOU7DvbJGlND+L7Rl
	MYrv+6hEbTVouAXpvvVcbUSL8ipP+m8ezqIj96Dd/8Crr8zoHPijAZFOYuIx+BwHEm3+
	bmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WZdMLyDJJh+1SYqgihRBmPZBLAoT9B1s0C29W6C0UPY=;
	b=MXGxfM/+wo1K94QkGU8wZBZAZ2umFxzssi66qhYDIYpDYW/FoRpURSadL0Bg0MFx1R
	2AL0i9LQgQUQXOGsi9YZ8HnFyRo++/qy8wppDLWyvs7mk+f9zRRsTIpyvpdO9cnmBp2u
	v+neEvTe8CEGv+lvmRJGxh+XRHri6UyDnEKDSUBakq06RDcoUk9EhgQ42/8v24UMgbCy
	Qv7k2DO3O3sIDl8TMcqIqiYUc5ZgRXGAno/mFuj68OcFbR5G6SMpOshhng61txn8JlAT
	PSTEJNJDFUka28W+aZCwPG6NNN+3tmNkgPYZr3COBOybHXF3mKLvu/VWxf+srbkUX7Ch
	UJUg==
X-Gm-Message-State: APjAAAWSDiyRdEK4lRQxWeVdDvn2M7gGeA3y+EKsmzlJzO9wViTC/Muc
	FLO/Fo9FdgN5jgZGpNqWtAOddCA9GPnr8XXiSb8=
X-Google-Smtp-Source: APXvYqzs5IqiRS8DINNdoBQXarOPeGRPsMmWJUfSSvW9R73WDc+yK7GIFkRzfK0GptDib72+SFDQbfj2onqZ/AkATjg=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr3419284ljg.78.1566181662221; 
	Sun, 18 Aug 2019 19:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190813064510.7331-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190813064510.7331-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Aug 2019 22:27:31 -0400
Message-ID: <CADkTA4PpbXgXx1HGwgiyZUn=0Efc+fWXuLwic1OzQobjq1Hihw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-keystoneauth1: upgrade 3.15.0 -> 3.16.0
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
X-List-Received-Date: Mon, 19 Aug 2019 02:27:44 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 13, 2019 at 2:46 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  ...{python-keystoneauth1_3.15.0.bb => python-keystoneauth1_3.16.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.15.0.bb => python-keystoneauth1_3.16.0.bb} (79%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.15.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb
> similarity index 79%
> rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.15.0.bb
> rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb
> index a584951..fd1d848 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.15.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
>
> -SRC_URI[md5sum] = "0f3e21362a74d1fb8959fc2bf7d28882"
> -SRC_URI[sha256sum] = "439f7dcf6edde5ea5a16ef90603d198e118a03f529aba0f8a6d19d5f6433de95"
> +SRC_URI[md5sum] = "4d2b56ac0b3d19eacb7f3a3198cfcc54"
> +SRC_URI[sha256sum] = "0465ed3e69ec0a148a5785f59f6fd3cece7808090cbcb90a2d2cb27ab360d9d7"
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

