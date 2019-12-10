Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.7065.1575963273308623954
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2019 23:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W1yKxQ+M;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FEE8E01126; Mon,  9 Dec 2019 23:34:33 -0800 (PST)
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
	*      [209.85.208.48 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35992E00942
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Dec 2019 23:34:32 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id c93so15070220edf.7
        for <meta-virtualization@yoctoproject.org>; Mon, 09 Dec 2019 23:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pKSb664dqclXQMhuR750KEYZySSuAI4Gr9Wa/zKysAA=;
        b=W1yKxQ+Me22rgz0+2LyL7HES8j6YeVlzcS5mtarIOtQpuOSYA4Ciw0zFXutKEK8sSv
         bFctxJaLIPHXmc/7rgz4OradX71h2kbOsdQ3JWgy1TeZuYlqxK67UtJhiUNxh1ZckcXx
         ttTAOFrbTMVfgKJaPYyB9Jnl8SRTcA7UrNffl3+nFViPy9VX2nm6CPHQXsdXknTGLAiu
         bifT87x2nRtomopE9vSPmMnh7YBoay/PZ57eBgN8Ts/8o2yInid5BTpLF1lRmNSOne9R
         8VOASHiRvJKH2C3U/2/UNgzr5FbDx1nyL0xMVvknMXiEFTFbMPi3cULfwDF6E7pfks/Z
         DveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pKSb664dqclXQMhuR750KEYZySSuAI4Gr9Wa/zKysAA=;
        b=cpMK4KZrM7WZasTJakcWic/oWRUkZod869L8Ta+bWyfz95GB0+CP9f8BJSdL8HGuL5
         w4onpe3TK4jQ6TctazFHoFLEV9EuyUEKyCHe3AxmkMXmYxzTpnRHhSlwmGXmw7aW9poO
         npKRP2bkPcGpkVGhY/6QwNbHqQ09KikFs5MWqKgfgmd1vjHjd+lG3YwwGDdO0RiFlfsM
         9v70W5jO64ho3TAj8xF7plzNk+Jh5LiLIOfA+azhUtg4dyjYtvzy5Bz4VWTYVx7RPifo
         nhvLhBT0J928hLNLJL1JYWfCMfAbYVKfuCURYTS9T4ZqQ2Rklf5PF+6UgIst/+j5J1SY
         CzEQ==
X-Gm-Message-State: APjAAAXTYyphIYyoEIayd415xaLDroZPXaqusLop0H5tLbUPM0v+53jF
	C2G03LiD2rQNiUB3+vZJiNk7Y4d9kIqZ3MW42Mg=
X-Google-Smtp-Source: APXvYqzCBE9aywuVTtSb0CgPbBGgh9OsGw/QjRmRf/EQuS85s4hCl0mxv3zKBmTF5JgZ9+D5x5isqad4mkH4MNiuCJw=
X-Received: by 2002:a05:6402:2036:: with SMTP id ay22mr36787286edb.303.1575963271245;
 Mon, 09 Dec 2019 23:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20191209072153.5389-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191209072153.5389-1-zangrc.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 10 Dec 2019 02:34:20 -0500
Message-ID: <CADkTA4MQ69akjOAN+DwHdRSbZ-+nvUSp7rLhkLUZbdWePpVUgA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python-greenlet: Remove the recipe
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 9, 2019 at 2:21 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Because there are higher versions and python3 versions in meta-oe,I want to remove the recipe.
>

I can't recall a specific requirement on this version anymore, so I'm
good to drop the recipe.

The change is now merged.

Bruce

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-greenlet_0.4.5.bb               | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb b/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> deleted file mode 100644
> index 2f5824f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Python lightweight in-process concurrent programming"
> -HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
> -SECTION = "devel/python"
> -LICENSE = "MIT & PSF"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
> -                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> -
> -# Archived version so we have to overwrite what the pypi class will derive
> -PYPI_SRC_URI = "https://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
> -
> -SRC_URI[md5sum] = "ce383f6475e6311cf8932ea779938703"
> -SRC_URI[sha256sum] = "b990f00f120c4cfb6672eec2acd32210990a2c7b70b815c034d1d8cbf08e2dbe"
> -
> -inherit distutils pypi
> -
> --
> 2.20.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4843): https://lists.yoctoproject.org/g/meta-virtualization/message/4843
> Mute This Topic: https://lists.yoctoproject.org/mt/67789410/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
