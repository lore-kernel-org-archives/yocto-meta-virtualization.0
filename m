Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C354BE00D81; Tue, 19 Dec 2017 19:55:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FDE6E00D6B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 19:55:53 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id x199so1283325ywg.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 19:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rCWUvbS7liqAQCfUWRiZ4DXkmGc8XDohwg6skxlPBec=;
	b=BjXKoVV86ITR9t/Tpl9EVpPGhnEfVjIin0OURYQHp716WPPdR4S+AWfe5Uny6Zl8J/
	0TAWu//PB6Dj7wG6QKbF9aiHljPsDf6e1tS3zdeiDSFYpot+LqA6j2wnG44x10XJxG6q
	ahvVs/8GCwht7Akrr8MA0K5WTZkxY9OYTK/rIh5ckoCdUGohWAdYa1n+ni+KqRKedBFs
	DzNvQ4/aFt5mTHz1Yt18/Spn7QJRvFtAXnk+P0vRseP2vMwGJMlZOSB2WlZ821ll4DSX
	JwBMutQMWpzOm/J6Nj42VyANy3WGcx66r7SDzHvRgGhZlTHfb1Ez94BTSKq3PG4kUQfb
	bmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=rCWUvbS7liqAQCfUWRiZ4DXkmGc8XDohwg6skxlPBec=;
	b=TzU8VdFclqU6lBoqq7RIjfEPecfLbvUSqFjuUmNIPpbQ3UoKGJ4IQ6efX87vafSjuZ
	1hjVNEhp1KUAzbFF4O1bGE3vxUpMMQsgNWic/s2Bt3acd5YjTOMf9whmfNzXKE5dkwTX
	aij6MQVCX7a9tOkJue3jmmAHVyUatz8bHwYqWewW6z4D0IAVTHeDARkqsSm3AbEc8v5j
	pAR4S0t1TDfxCgVJpBMNHmKKNwcTmw94p1iMj/LK5zRVHg6ofhutyvlOH0A+PZqmysf3
	pZpxZ+br0P7u5o2wsBVpL+xQXCUKF/BcunK/LMIMUbBmm5QpmJjhb6TfR7r8OcKQI9tk
	XNBA==
X-Gm-Message-State: AKGB3mLDNIrRTtujAvnwiJ97wO4z6Uf6qGKcHkQA/vxCHumiIv2+74z6
	iiiwVjsV5qFjpHKRNCUVwEqpSt/YvKRUy6TvkB+KrQ==
X-Google-Smtp-Source: ACJfBosXKSIPTV+NtCuLJFkqDNWpLDEi7rQUYOtlXvNx7UvE1Yi73vyltEiA+pQYBC8/srnVmUUiywLzZdjRwHOFcjM=
X-Received: by 10.129.97.5 with SMTP id v5mr4102371ywb.394.1513742152337; Tue,
	19 Dec 2017 19:55:52 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.189.69 with HTTP; Tue, 19 Dec 2017 19:55:51 -0800 (PST)
In-Reply-To: <ab20c1f5-1d5b-bc58-d6b0-9e0e495a9507@windriver.com>
References: <1513648689-92598-1-git-send-email-haitao.liu@windriver.com>
	<CAPuovEKHtgbGtKDiogu6u1wp1Ct5h=36G_T6rrSpC1LzfXvkbw@mail.gmail.com>
	<ab20c1f5-1d5b-bc58-d6b0-9e0e495a9507@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 19 Dec 2017 22:55:51 -0500
X-Google-Sender-Auth: YD5ahlYAl_5aY0WMHmE1LxiQf7A
Message-ID: <CAPuovEKFRFG+ZJb7q-XU+5-=6s6xs3UObj3TLY0OpQ5RQ5n9VA@mail.gmail.com>
To: Haitaoliu <Haitao.Liu@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: Disable the bind-interfaces for lxc.
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
X-List-Received-Date: Wed, 20 Dec 2017 03:55:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2017 at 4:27 AM, Haitaoliu <Haitao.Liu@windriver.com> wrote=
:
>
>
> On 2017=E5=B9=B412=E6=9C=8819=E6=97=A5 11:14, Mark Asselstine wrote:
>
> On Mon, Dec 18, 2017 at 8:58 PM, Liu Haitao <haitao.liu@windriver.com>
> wrote:
>
> When enable lxc service it failed with the following errors:
>
> """
> root@intel-x86-64:~# /usr/libexec/lxc/lxc-net start
>
>      dnsmasq: cannot set --bind-interfaces and --bind-dynamic
>      Failed to setup lxc-net.
> """
>
> It said that the "bind-interfaces" and "bind-dynamic" cannot cooperate
> together.
> These two options have the same fundamental capacity of binding network
> interfaces.
>
> So dnsmasq just require one of this kind of option.
>
> For some reason ,the following commit  compulsively add the "bind-dynamic=
"
> option
> for dnsamsq.
>
> """
>         c3c4d977cbb51363f9030c2e39d56a772b29f73b
> """
>
> It is not for "some reason", it is for a specific reason that is
> explained in detail in the commit log and in the comment that goes
> with the setting. Libvirt will have issues setting up virbr0 if we do
> not use 'bind-dynamic'.
>
> Now you aren't touching the dnsmasq.conf file which is good since you
> will not be breaking libvirt with this change but I will have to take
> a closer look at your approach to see if it valid for lxc-net. Really
> we should move the 'bind-dynamic' into a libvirt specific
> sub-configuration file in /etc/dnsmasq.d/, so something like
> /etc/dnsmasq.d/libvirt.conf, and then have another one for lxc
> (/etc/dnsmasq.d/lxc.conf). The main dnsmasq.conf file should be empty.
> But again I need to dig around a bit to remind myself of how things
> work.
>
> Did you do any testing other than lxc-net starting? did you validate
> the dnsmasq functions on the lxcbr0 that is bound to the new instance
> of dnsmasq?
>
> I did not do any other test about lxc-net except starting.
> if we don't remove 'bind-interfaces' , the lxcbr0 would also be created
> correctly . But the dnsmasq will fail. I have no idea if it has an influe=
nce
> on  IP address assignment of lxc.
>
> I will validate it later.

I didn't get around to looking at this in more detail yet. I did
examine how things are setup in Ubuntu when both lxc and libvirt are
present and it matches what I had planned with both a libvirt and lxc
config file in dnsmasq.d. I am in the process of reviving the
'kvm-image-minimal' in meta-virtualization such that I can test things
out properly. Now that I have this image up and running with both lxc
and libvirt running I can start to try out some configurations.

MarkA


>
> thanks,
> haitao
>
>
> MarkA
>
> So we just remove 'bind-interfaces' in lxc service scripts.
>
> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ---
>  ...1-lxc-Disable-the-bind-interfaces-for-lxc.patch | 45
> ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_2.0.8.bb                |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644
> recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc=
.patch
>
> diff --git
> a/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-l=
xc.patch
> b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-l=
xc.patch
> new file mode 100644
> index 0000000..fec6843
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-l=
xc.patch
> @@ -0,0 +1,45 @@
> +From 76533652915dcca2ce4265b320fd1c20a75adff8 Mon Sep 17 00:00:00 2001
> +From: Liu Haitao <haitao.liu@windriver.com>
> +Date: Sun, 17 Dec 2017 23:02:13 -0800
> +Subject: [PATCH] lxc: Disable the bind-interfaces for lxc.
> +
> +When enable lxc service it failed with the following errors:
> +"""
> +    dnsmasq: cannot set --bind-interfaces and --bind-dynamic
> +    Failed to setup lxc-net.
> +"""
> +It said that the "bind-interfaces" and "bind-dynamic" cannot
> +cooperate together.
> +These two options have the same fundamental capacity of binding
> +network interfaces.
> +So dnsmasq just require one of this kind of option.
> +For some reason ,the following commit  compulsively add the "bind-dynami=
c"
> option
> +for dnsamsq.
> +"""
> +       c3c4d977cbb51363f9030c2e39d56a772b29f73b
> +"""
> +So we just remove 'bind-interfaces' in lxc service scripts.
> +
> +Upstream-Status: Inappropiate [Modify configuration]
> +
> +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> +---
> + config/init/common/lxc-net.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/init/common/lxc-net.in b/config/init/common/lxc-net.=
in
> +index f770950f..6f45228d 100644
> +--- a/config/init/common/lxc-net.in
> ++++ b/config/init/common/lxc-net.in
> +@@ -128,7 +128,7 @@ start() {
> +     done
> +
> +     dnsmasq $LXC_DHCP_CONFILE_ARG $LXC_DOMAIN_ARG -u ${DNSMASQ_USER} \
> +-            --strict-order --bind-interfaces
> --pid-file=3D"${varrun}"/dnsmasq.pid \
> ++            --strict-order --pid-file=3D"${varrun}"/dnsmasq.pid \
> +             --listen-address ${LXC_ADDR} --dhcp-range ${LXC_DHCP_RANGE}=
 \
> +             --dhcp-lease-max=3D${LXC_DHCP_MAX} --dhcp-no-override \
> +             --except-interface=3Dlo --interface=3D${LXC_BRIDGE} \
> +--
> +2.11.0
> +
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb
> b/recipes-containers/lxc/lxc_2.0.8.bb
> index c9ce5f0..5267bf7 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D
> "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch=
 \
>         file://cgroups-work-around-issue-in-gcc-7.patch \
> +       file://0001-lxc-Disable-the-bind-interfaces-for-lxc.patch \
>         "
>
>  SRC_URI[md5sum] =3D "7bfd95280522d7936c0979dfea92cdb5"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

