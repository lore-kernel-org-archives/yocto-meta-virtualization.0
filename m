Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DA21E0172F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2013 06:17:24 -0700 (PDT)
Received: by mail-wi0-f170.google.com with SMTP id l12so5158267wiv.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2013 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=b9AY69kTTVVROiGvLttuPS4J4NVrY5/7sEc4zEyyepM=;
	b=KkdyOFRPGESqZAJHXbUXDKcCDuct2zFVjcBU231yLOE58S4B/KggCdni/w+58OROBe
	I+Ifh+S0sjhbWyK25GIH0YlXRpioZmNm+HR2D7evAwkJHpH9VmRzHdIMpxZkdNr0WIvU
	LM2V+yDu62zoDk3GgA5lxZfLIglRmvbEEsmtk44xrg2OPGCCTsko/cJ3iqK3GomPm4+s
	U4TB3DwotICABdC5ICIh6JGRdaj0msTzbUdrYCzx5qOrHJsMYb4groylvzT+qXjughFg
	+WuUfBQ3EhV2pZ9ncIpdmMAKdCtS7O4hjYVM9MRYw0fM7cQ91zjVvlA4Aa6neVtkVcRi
	EySQ==
X-Received: by 10.180.20.116 with SMTP id m20mr9703220wie.53.1382361441373;
	Mon, 21 Oct 2013 06:17:21 -0700 (PDT)
Received: from [172.22.81.31] (ed03490-ge-0-0-0.mgdfwr.lumison.net.
	[212.20.242.100])
	by mx.google.com with ESMTPSA id jf2sm32244792wic.2.2013.10.21.06.17.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Oct 2013 06:17:21 -0700 (PDT)
Message-ID: <52652960.1010005@gmail.com>
Date: Mon, 21 Oct 2013 14:17:20 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.palsson@pelagicore.com>, 
	meta-virtualization@yoctoproject.org
References: <1382356857-17517-1-git-send-email-jonatan.palsson@pelagicore.com>
In-Reply-To: <1382356857-17517-1-git-send-email-jonatan.palsson@pelagicore.com>
Subject: Re: [PATCH] lxc: fixed URL for tarball
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
X-List-Received-Date: Mon, 21 Oct 2013 13:17:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/2013 01:00 PM, Jonatan Pålsson wrote:
> Signed-off-by: Jonatan Pålsson <jonatan.palsson@pelagicore.com>
> ---
>   recipes-containers/lxc/lxc_0.9.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 563131f..8f7736b 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -21,7 +21,7 @@ RDEPENDS_${PN} = " \
>   		perl-module-exporter-heavy \
>   "
>
> -SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
> +SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
>   	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
>   	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
>       file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
>

Merged to master, thanks.

