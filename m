Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B567E00CD4; Wed, 15 Nov 2017 13:02:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADBA6E00C11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:02:14 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id 31so37593250qtz.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5UD/ZCbKrQyzxt/ZgLXwMo5Li+u/Z/DdU/YIGfBZAxg=;
	b=tSwyem1XxtcQVFJ7iaS94a6FNrBaQ+7ZZFubo8g5kXBgXp02/qlYb2rij7HY00EBUF
	gWGzRdgTQkDyrSFm7KWOiVenojfGXa11zLlBaNgHa2GSOQcm+L4i8SybCvc9aEWxeWig
	ThjXDv0Vz0TTengJfh08zlGG9cvL316uhyA0XyxXiIn/p4Zw7PIMsHH5pC+EoIAk1cSG
	v58pm9qlM/wq/RjnyFl70tPRT1KeMVWt7EXaeF+cIvOx4bUW5xXs32QD38LGIA1SqB9P
	Y5ytXu0guJU9gy9fxS8OCn0sq0soJ3ycMABJ6ouVrkBTfUkK9km4WtKc2nMDiSmvjoc1
	ZTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5UD/ZCbKrQyzxt/ZgLXwMo5Li+u/Z/DdU/YIGfBZAxg=;
	b=m1CQJBtfe+kJjj7G36QI0v5FAtIOMeMytQxuHhydVQ7pdMBnR3tOs6CDLg10wL353v
	EJqlwT/NnoWNbW2dZbZYtEQksvZc/TgvsVbeYcQAKG39mlCvanblls38k3R/lQGnbTKQ
	xgl8DDQ88rFVD99K4vfje1iI3CI4CMHTArz/3YBt0UmWrlICgzGeNXcLRBc/XCh/bIE5
	M2kY5GMIFO/BpN7bQilcItgaTkPAwTGlcr9ySYTCYssIr07OxqNRTn5ssznj90F0iukp
	qMdPXFM8sk/0myNXjwR32jWdRbZZKImSbLlmXNpzxBgjb77A2ZU/z/kb3mYNYuVNCbmR
	/kYA==
X-Gm-Message-State: AJaThX7alE3+rJxjD/l6wkpBnxLql5tXOdnvYY3HSefzDiSCwCPVJjNr
	Q8dGeNpPY2d7sPeEfl42FDr5gpRNC+IBjWyr8nRi7A==
X-Google-Smtp-Source: AGs4zMaC6UtzxwnVggH34FONoSMqAUabhdjm7EBReEVzeNgl5uVjl2U5LnUqh58YIVCQAZt4e0rhE9BtruR94y1qhNg=
X-Received: by 10.55.70.67 with SMTP id t64mr2049158qka.103.1510779733801;
	Wed, 15 Nov 2017 13:02:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 15 Nov 2017 13:02:13 -0800 (PST)
In-Reply-To: <1510762164-47666-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1510762164-47666-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Nov 2017 16:02:13 -0500
Message-ID: <CADkTA4NOgGMRfSEo5bXEfVtOFEkg3ZURoX-6ky86bNqLobkuAA@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-paramiko: upgrade to 2.4.0
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
X-List-Received-Date: Wed, 15 Nov 2017 21:02:15 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Nov 15, 2017 at 11:09 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade python-paramiko from 2.2.1 to 2.4.0.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-paramiko_2.1.1.bb => python-paramiko_2.4.0.bb}   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-paramiko_2.1.1.bb => python-paramiko_2.4.0.bb} (55%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.1.1.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> similarity index 55%
> rename from meta-openstack/recipes-devtools/python/python-paramiko_2.1.1.bb
> rename to meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> index e257cff..52d0cda 100644
> --- a/meta-openstack/recipes-devtools/python/python-paramiko_2.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
>  PR = "r0"
>  SRCNAME = "paramiko"
>
> -SRC_URI = "https://pypi.python.org/packages/d1/5a/ebd00d884f30baf208359a027eb7b38372d81d0c004724bb1aa71ae43b37/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/c8/de/791773d6a4b23327c7475ae3d7ada0d07fa147bf77fb6f561a4a7d8afd11/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "9e8abe635baa6bb75a4cd55dcb56a264"
> -SRC_URI[sha256sum] = "d51dada7ad0736c116f8bfe3263627925947e4a50e61436a83d58bfe7055b575"
> +SRC_URI[md5sum] = "ed6d085a5e5369817e49cf1315b32eba"
> +SRC_URI[sha256sum] = "486f637f0a33a4792e0e567be37426c287efaa8c4c4a45e3216f9ce7fd70b1fc"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
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

