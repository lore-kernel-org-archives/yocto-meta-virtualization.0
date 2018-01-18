Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC346E00E94; Thu, 18 Jan 2018 07:48:32 -0800 (PST)
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
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B0EBE00CF7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 07:48:30 -0800 (PST)
Received: by mail-qt0-f193.google.com with SMTP id c2so31268312qtn.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 07:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VBx5dZu2LWQYK1dvOYO/OkxT6+76UyRrOH33j/AC5Bs=;
	b=jGCz9qF0c5JQ/FHhAQg34OMpfFUEI++tf6cYZvaCxF0ubnx+gDL0oKswkxV1ymmuLY
	bEjE8IqVBLTYntnoZODOK31Ud45mO7uZo1HLgz3u9yuTmCFJQoj2TXWy2h50/PAIZtMF
	uCuGFQ/GST8V0tezB9YnLw6w8kOzTS9p8a7U7x7RE67LkgHDsvQJS/W53jFyw0PgjUIi
	j6sm9ujzfyWfgytnRFJaKuoFXOoXwpZS+TKqBoheFGnIf+pMBU1Ftl2BAvrkQ2GOu6+D
	L3KkJPFtiiWOmi35JmiGm5XFfqKvoVIXSrTDwop3MHNi3PDNrcRGqmNNaMglMGvWud46
	nddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VBx5dZu2LWQYK1dvOYO/OkxT6+76UyRrOH33j/AC5Bs=;
	b=E3oxQrfx5P0qTAtQz1KdgDrKLE8Xjqw51RvLaQcI8ckQ6GoWHLwPc/XblSC460tiZu
	pImr9k4dA5EF/fNbz4kOiWbYOZGlDHoO6oMnEOrxqYbu0yED09XdvuHxd9JEsnP/tF2i
	c/DEylW1Y/zYpRo4sBx5rlC4AVi283ee9JcwVw3JcUQrrmvsHwUX9TX6VRy2IM1nwq59
	4QlsjrmAskniXJLAuU42qrdeFq2xaT7i2jaShnI8FL7Z9yXyF+uQUGYIHi+trQ49gZp7
	iMi+7RHawqFNrNTIIWfq7xdWYUPv8n+mXXacnv5Q4mi7VfSkl+ReupZR0BLAeM/XEcUR
	i8Yg==
X-Gm-Message-State: AKwxytcXvU3FVrihevEhpFpnHmlTg8kNo640SC09Aix/BUemsG2N80/B
	41bl9V5EoZRejTk9r9IJaSvDq3QoBTn12JLvkj1PoA==
X-Google-Smtp-Source: ACJfBovjv0HFlzrxGoS4IG966DUT9KhXH3o9EuO3NBuOu1CnQ4WFQAi1T2P4FzLh86bqBXvQIp4LeU/4Qc24dNGMXjM=
X-Received: by 10.200.15.218 with SMTP id f26mr8665142qtk.237.1516290510242;
	Thu, 18 Jan 2018 07:48:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.82 with HTTP; Thu, 18 Jan 2018 07:48:29 -0800 (PST)
In-Reply-To: <1516267420-85807-1-git-send-email-liezhi.yang@windriver.com>
References: <1516267420-85807-1-git-send-email-liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Jan 2018 10:48:29 -0500
Message-ID: <CADkTA4P=CdwpwjmHDLLv4LWurDBNmHnJ48YYjVCOG6LBvXQUUw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] conf/layer.conf: remove bbclass from BBFILES
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
X-List-Received-Date: Thu, 18 Jan 2018 15:48:32 -0000
Content-Type: text/plain; charset="UTF-8"

Since this is actually for meta-cloud-services, it should have [m-c-s]
as part of the subject.

.. but it is now merged regardless.

Bruce

On Thu, Jan 18, 2018 at 4:23 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Add bbclass to BBFILES doesn't make any sense.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
>  meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
>  meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
>  meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
>  meta-openstack-controller-test-config/conf/layer.conf | 2 +-
>  meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
> index 3943e76..b7d6002 100644
> --- a/meta-openstack-aio-deploy/conf/layer.conf
> +++ b/meta-openstack-aio-deploy/conf/layer.conf
> @@ -2,7 +2,7 @@
>  BBPATH .= ":${LAYERDIR}"
>
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>
>  BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
>  BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
> diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
> index ee88f42..177e1b5 100644
> --- a/meta-openstack-compute-deploy/conf/layer.conf
> +++ b/meta-openstack-compute-deploy/conf/layer.conf
> @@ -2,7 +2,7 @@
>  BBPATH .= ":${LAYERDIR}"
>
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>
>  BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
>  BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
> diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
> index e54c05d..186438d 100644
> --- a/meta-openstack-compute-test-config/conf/layer.conf
> +++ b/meta-openstack-compute-test-config/conf/layer.conf
> @@ -2,7 +2,7 @@
>  BBPATH .= ":${LAYERDIR}"
>
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>
>  BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
>  BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
> diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
> index e6c1c74..cda55da 100644
> --- a/meta-openstack-controller-deploy/conf/layer.conf
> +++ b/meta-openstack-controller-deploy/conf/layer.conf
> @@ -2,7 +2,7 @@
>  BBPATH .= ":${LAYERDIR}"
>
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>
>  BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
>  BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
> diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
> index 35c016d..9cf87e4 100644
> --- a/meta-openstack-controller-test-config/conf/layer.conf
> +++ b/meta-openstack-controller-test-config/conf/layer.conf
> @@ -2,7 +2,7 @@
>  BBPATH .= ":${LAYERDIR}"
>
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>
>  BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
>  BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
> diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
> index 9b5e785..6f9f588 100644
> --- a/meta-openstack-swift-deploy/conf/layer.conf
> +++ b/meta-openstack-swift-deploy/conf/layer.conf
> @@ -2,7 +2,7 @@
>  BBPATH .= ":${LAYERDIR}"
>
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>
>  BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
>  BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

