Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 555C5E00938; Tue,  3 Apr 2018 20:25:13 -0700 (PDT)
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
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BADEE008D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 20:25:12 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id x70-v6so16331501lfa.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 20:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iBjDnTuq8WQlJ5biAqVIMlP9dhLvLS06WM1UZZtWUXE=;
	b=ehxV6eEOIhF4+knz/gB4XmIYIG3j3jImi1xGYdMqkYgQ48vPatvJwOR1PuZ4mEQwAs
	CnKpytaKjYdLa7SU7y1HhC3o3x9howz2tYuGA2jEQx5NLYJJd6iyd7VDby9oRFIG/SDu
	55zivqOv/hQS6qDqlry29TADfWJuMxfdKoyqTEncb4d36Xugg+jVWxgvBQbnIV59UdgR
	nsUhg9d8LOc45xtC8xyZPAcvW+jXDpX9Rqec9+WOCsORtDmfwri1AGIfs8OvBksjeuTC
	2Jz+eJadblWsI5aZqAfgXzmZF4IlGu0AdUZUHf+sSYsWfMIbDQTgNpJjwHwd5UXwpyLe
	vkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iBjDnTuq8WQlJ5biAqVIMlP9dhLvLS06WM1UZZtWUXE=;
	b=P5dXvg42zPd3ZNBbW4RsEXHYxhaxv+hlLW4G5EP0Ywdq0WIBdEv9833faA59nUF6uC
	ZKNkoESp7b4AM9ugO1fWQ9skidgC39fXfpi3ypniGEovYxGul205GATh4s/B/1k0Amyq
	aIghTJQKWuaVigdMstPTbFe1uYeZ2zrxSYESWc6xSHj3PMRYuM1RB4BuYFfxbyDOw6xu
	0flC8m5aGQ2tNhCKx5WmmK4I2WXyRieJjONz8iCd2oMsMS6lMa28dbBnxdNzA5/Zdu+q
	xoPQ6Vd+ab7easmrLL6ph1O+e9sTaPxQZdWtI95s7sDOBKnXrM95Oaq1wQXcJqLUqCag
	A9wA==
X-Gm-Message-State: ALQs6tBHktYGMD/MVCnL8/st97wkiIK5B+eXv5fIa32tzR58O7gMX38W
	V4Zzw4OzsQJevzlQg8DZH30NSThUeafOPh3Zyxp2/A==
X-Google-Smtp-Source: AIpwx4+r+aQTn3CiwKyXAvh8WD9qHRAPXB106cJmp4ncRALxwHMws0U9cDikr5M/mrfyCCDgIwZw3gX2xKRffo74SIs=
X-Received: by 2002:a19:5c4b:: with SMTP id
	q72-v6mr10392531lfb.126.1522812311375; 
	Tue, 03 Apr 2018 20:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 20:25:10 -0700 (PDT)
In-Reply-To: <1522402120-7482-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1522402120-7482-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 23:25:10 -0400
Message-ID: <CADkTA4PjtLz27vnXQs3+XMoCnrNqxgA0Rib6p6sfdDck0eseNw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-wsme: 0.9.1 -> 0.9.2
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
X-List-Received-Date: Wed, 04 Apr 2018 03:25:13 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-wsme from 0.9.1 to 0.9.2.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-wsme_0.9.1.bb => python-wsme_0.9.2.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-wsme_0.9.1.bb => python-wsme_0.9.2.bb} (78%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> similarity index 78%
> rename from meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
> rename to meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> index 0016e63..59e1ddb 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
>
>  PYPI_PACKAGE = "WSME"
>
> -SRC_URI[md5sum] = "23b0269af3f4c1db8cfa35054703f0db"
> -SRC_URI[sha256sum] = "afdd3ba14f815837239d6dead652de460bd61a869e39430b459be77d1a928197"
> +SRC_URI[md5sum] = "f7ab1fecd5fa64f579d6ef3aabf38f60"
> +SRC_URI[sha256sum] = "e790ac755a7e36eaa796d3966d3878677896dbc7d1c2685cb85c06b744c21976"
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
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

